class User < ApplicationRecord
  has_secure_password

  has_many :words, inverse_of: :user, dependent: :nullify
  has_many :knowledges, through: :words

  validates :name,     presence: true, uniqueness: true
  validates :email,    presence: true, uniqueness: true
  validates :email,    format: { with: URI::MailTo::EMAIL_REGEXP, allow_blank: true }
  validates :password, length: { minimum: 6, allow_blank: true }
  validates :password_confirmation, presence: true

  scope :where_knowledges_created_at, ->(created_at) { eager_load(:knowledges).where(knowledges: { created_at: created_at }) }
  scope :group_by_name_with_understood_score, ->(started_at, ended_at) {
    joins(sanitize_sql_array([%|
      INNER JOIN (
        SELECT words.* FROM words
        WHERE EXISTS (
          SELECT 1 FROM knowledges
          WHERE knowledges.word_id = words.id
          AND knowledges.created_at BETWEEN ? AND ?
        )
      ) AS u_words
      ON u_words.user_id = users.id
    |, started_at, ended_at])).select("users.name, count(*) AS score").group(:name)
  }

  class << self
    def rank_as_json(term: "daily")
      now = Time.zone.now
      start_and_end = case term
                      when "daily"
                        [now.beginning_of_day.to_s, now.end_of_day.to_s]
                      when "weekly"
                        [now.beginning_of_week.to_s, now.end_of_week.to_s]
                      when "monthly"
                        [now.beginning_of_month.to_s, now.end_of_month.to_s]
                      end
      users = group_by_name_with_understood_score(*start_and_end)
      users.as_json(except: :id).sort_by {|user| -user["score"] }
    end
  end
end
