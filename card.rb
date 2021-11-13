DESK_OF_CARDS = { Единичка Буби: 1, Двойка Крести: 2, Тройка Черви: 3, Четыре Пики: 4, Туз: 5 }

puts 'Пожалуйста введите ваше имя и нажмите Enter что бы начать игру в "Пьяница"'
username = gets.chomp
puts "Привет #{username}, Добро пожаловать в игру пьяница!
(У вас и у компьютера будет всего по 5 попыток что бы выяснить победителя)"
user_desk = DESK_OF_CARDS.to_a.shuffle.to_h
bot_desk = DESK_OF_CARDS.to_a.shuffle.to_h
user_score = 0
bot_score = 0

loop do
  break if users_desk.size == 0

  puts "Нажмите Enter что бы начать игру #{user_desk.size - 1}" if user_desk.size > 1
	user_input = user_desk.size > 1 ? gets.to_i : 0
	user_step = user_desk.to_a.delete_at(user_input)
	bot_step = bot_desk.to_a.delete_at(rand(0...(bot_desk.size)))
  user_desk.delete(user_step[0])
	bot_desk.delete(bot_step[0])
	puts 'Последний ход!' if user_desk.size == 0
	sleep (rand(1..2))
  puts "Ваша карта  #{user_step[0]} победила. у компьютера карта #{bot_step[0]}" if user_step[1] > bot_step[1]
	user_score += 1 if user_step[1] > bot_step[1]
  puts "Ваша карта #{user_step[0]} проиграла. у компьютера выпала карта #{bot_step[0]}" if user_step[1] < bot_step[1]
  bot_score += 1 if user_step[1] < bot_step[1]
	sleep 1
	puts user_score > bot_score ? "#{username} Вы победили" : "Компьютер проиграл вам, поздравляю вас #{username}" if user_desk.size == 0
end
