DESK_OF_CARDS = { Единичка Буби: 1, Двойка Крести: 2, Тройка Черви: 3, Четыре Пики: 4, Туз: 5 }

puts 'Пожалуйста введите ваше имя и нажмите Enter что бы начать игру в "Пьяница"'
username = gets.chomp
puts "Привет #{username}, Добро пожаловать в игру пьяница!
(У вас и у компьютера будет всего по 5 попыток что бы выяснить победителя)"
users_desk = DESK_OF_CARDS.to_a.shuffle.to_h
bots_desk = DESK_OF_CARDS.to_a.shuffle.to_h
user_score = 0
bot_score = 0

loop do
  break if users_desk.size == 0

  puts "Нажмите Enter что бы начать игру #{users_desk.size - 1}" if users_desk.size > 1
	users_input = users_desk.size > 1 ? gets.to_i : 0
	users_step = users_desk.to_a.delete_at(users_input)
	bots_step = bots_desk.to_a.delete_at(rand(0...(bots_desk.size)))
  users_desk.delete(users_step[0])
	bots_desk.delete(bots_step[0])
	puts 'Последний ход!' if users_desk.size == 0
	sleep (rand(1..2))
  puts "Ваша карта  #{users_step[0]} победила. у компьютера карта #{bots_step[0]}" if users_step[1] > bots_step[1]
	user_score += 1 if users_step[1] > bots_step[1]
  puts "Ваша карта #{users_step[0]} проиграла. у компьютера выпала карта #{bots_step[0]}" if users_step[1] < bots_step[1]
  bot_score += 1 if users_step[1] < bots_step[1]
	sleep 1
	puts user_score > bot_score ? "#{username} Вы победили" : "Компьютер проиграл вам, поздравляю вас #{username}" if users_desk.size == 0
end
