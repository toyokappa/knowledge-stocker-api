keys = %i[id text user_id]
words = [
  [1,  'aaaaa', 1],
  [2,  'bbbbb', 1],
  [3,  'ccccc', 1],
  [4,  'ddddd', 1],
  [5,  'eeeee', 2],
  [6,  'fffff', 2],
  [7,  'ggggg', 2],
  [8,  'hhhhh', 2],
  [9,  'ddddd', 3],
  [10, 'eeeee', 3],
  [11, 'fffff', 3],
  [12, 'ggggg', 4],
  [13, 'hhhhh', 4],
  [14, 'ddddd', 4],
  [15, 'eeeee', 5],
  [16, 'fffff', 5],
  [17, 'ggggg', 5],
  [18, 'hhhhh', 6],
]

Word.seed_once(:id, words.map {|w| keys.zip(w).to_h })
