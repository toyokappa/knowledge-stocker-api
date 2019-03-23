keys  = %i[id name email password]
users = [
  [1, "toyokappa", "kppg42@gmail.com",  "password"],
  [2, "testuser1", "test1@gunmaaa.com", "password"],
  [3, "testuser2", "test2@gunmaaa.com", "password"],
  [4, "testuser3", "test3@gunmaaa.com", "password"],
  [5, "testuser4", "test4@gunmaaa.com", "password"],
  [6, "testuser5", "test5@gunmaaa.com", "password"],
]

User.seed_once(:id, users.map {|u| keys.zip(u).to_h })
