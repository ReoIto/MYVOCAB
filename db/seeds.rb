# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
100.times do |index|
  Post.create!(content: "タイトル#{index}", user_id: 1)
end

Tag.create([
  { name: 'TOEIC' },
  { name: 'TOEFL' },
  { name: 'IELTS'},
  { name: '日常会話'},
  { name: 'ビジネス'},
  { name: 'スラング'},
  { name: 'その他'}
])
