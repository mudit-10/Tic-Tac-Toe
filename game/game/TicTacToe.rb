require_relative 'Board.rb'
require_relative 'Players.rb'

puts "\n\n\t\t Welcome to TicTacToe"

puts "\n Please Enter the characters you wish to play with: "        # Here, 2 different objects hold the symbols of the 2 players
print "\nPlayer 1: "
char1=gets.chomp
person1=Person.new char1
print "Player 2: "
char2=gets.chomp
person2=Person.new char2

puts "\n Enter the dimensions of the game (Enter 0 for default): "
variable=gets.chomp
n=variable.to_i
Game=TicTacToe.new n        #Creating a new instance of class and sending the variable n
puts "This is how the board looks like"
Game.printBoard

curr_char=person1.p
puts "P1ayer 1 moves first"

won=0
no_of_squares=0

while won==0
	puts "The coordinates are 1 based (1st coordinate is (1,1))"
	print "\nX: "
	var_x=gets.chomp
	x=var_x.to_i
	print "Y: "
	var_y=gets.chomp
	y=var_y.to_i
	system("reset")
	if Game.mark curr_char,x,y
		no_of_squares+=1

		if Game.winning curr_char
			if curr_char==person1.p
				puts "Game Won by Player 1"
			end
			if curr_char==person2.p
				puts "Game Won by Player 2"
			end
		won=1
        end
        
		if curr_char ==person1.p
			curr_char =person2.p
		else 
			curr_char =person1.p
		end
	end

	if no_of_squares==n*n
		puts "Game Ends in a tie"
		won=1
	end

    Game.printBoard
end