keys = %i[id url title understanding word_id]
knowledges = [
  [1,  "https://gunmaaa.com", "Gunmaaa!!!", 3, 1],
  [2,  "https://gunmaaa.com", "Gunmaaa!!!", 4, 2],
  [3,  "https://gunmaaa.com", "Gunmaaa!!!", 5, 3],
  [4,  "https://gunmaaa.com", "Gunmaaa!!!", 4, 4],
  [5,  "https://gunmaaa.com", "Gunmaaa!!!", 1, 5],
  [6,  "https://gunmaaa.com", "Gunmaaa!!!", 2, 7],
  [7,  "https://gunmaaa.com", "Gunmaaa!!!", 3, 9],
  [8,  "https://gunmaaa.com", "Gunmaaa!!!", 2, 10],
  [9,  "https://gunmaaa.com", "Gunmaaa!!!", 5, 11],
  [10, "https://gunmaaa.com", "Gunmaaa!!!", 5, 12],
  [11, "https://gunmaaa.com", "Gunmaaa!!!", 5, 13],
  [12, "https://gunmaaa.com", "Gunmaaa!!!", 5, 14],
  [13, "https://gunmaaa.com", "Gunmaaa!!!", 2, 15],
  [14, "https://gunmaaa.com", "Gunmaaa!!!", 3, 16],
  [15, "https://gunmaaa.com", "Gunmaaa!!!", 3, 17],
  [16, "https://gunmaaa.com", "Gunmaaa!!!", 3, 18],
  [17, "https://gunmaaa.com", "Gunmaaa!!!", 3, 19],
  [18, "https://gunmaaa.com", "Gunmaaa!!!", 3, 20],
  [19, "https://gunmaaa.com", "Gunmaaa!!!", 3, 21],
  [20, "https://gunmaaa.com", "Gunmaaa!!!", 3, 22],
]

Knowledge.seed_once(:id, knowledges.map {|k| keys.zip(k).to_h })
