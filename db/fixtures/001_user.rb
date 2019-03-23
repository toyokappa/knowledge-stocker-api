keys  = %i[id name email password]
users = [
  [1,  "toyokappa", "kppg42@gmail.com",  "password"],
  [2,  "testuser1", "test1@gunmaaa.com", "password"],
  [3,  "testuser2", "test2@gunmaaa.com", "password"],
  [4,  "testuser3", "test3@gunmaaa.com", "password"],
  [5,  "testuser4", "test4@gunmaaa.com", "password"],
  [6,  "testuser5", "test5@gunmaaa.com", "password"],
  [7,  "testuser6", "test6@gunmaaa.com", "password"],
  [8,  "testuser7", "test7@gunmaaa.com", "password"],
  [9,  "testuser8", "test8@gunmaaa.com", "password"],
  [10, "testuser9", "test9@gunmaaa.com", "password"],
]

User.seed_once(:id, users.map {|u| keys.zip(u).to_h })
