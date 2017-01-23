class TicTacToe
	attr_accessor :rows,:columns  # For getters and setters

	 def initialize n
		@rows=n
		@columns=n                 # This constructor just initialises the no. of rows and columns of the game
		@board = Array.new(n+1) {Array.new(n+1)}
		
	 	i=1
		while i<=n
			j=1
			while j<=n
				@board[i][j]=nil
				j+=1
			end
			i+=1
		end
	 end

  def printBoard
    i=1
    while i<=@rows
      j=1
      while j<=@columns
      	if @board[i][j]==nil
      		print " "                    
      	else
            print @board[i][j]
        end
        if j!=@columns
          print "|"
        end
        j+=1
      end
    i+=1
    puts()
    end
  end

   def on_board(x,y)
   	  flag=0
   	  if x < 1 || x>@rows
   	  	flag=1
   	  end

   	  if y<1 || y>@columns
   	  	flag=1
   	  end	

   	  if(flag==1)
   	  	return false
   	  else
   	  	return true
   	  end
   end

   def empty(x,y)
   	   if @board[x][y]==nil
   	   	  return true
   	   else
   	   		return false
   	   end
   end

   def if_legal(curr_char,x,y)
   	  if on_board(x,y) && empty(x,y)
   	  	return true
   	  else
   	  	return false
   	  end
   end

   def mark(curr_char,x,y)
       if if_legal curr_char,x,y
   	   	 @board[x][y]=curr_char
   	   	 return true
   	   else
         puts "Invalid move, please move again"
   	   	 return false
   	   end
   end

   	def winning(curr_char)
   	   for i  in 1..@rows
   	   		temp=@board[i][1]
   	   		puts temp
   	   		counter=1
   	   		for j in 2..@columns
   	   			if(@board[i][j]==temp && temp)
   	   				puts @board[i][j]
   	   				counter+=1
   	   				puts counter
   	   			end
   	   		end
   	   		if counter==@rows
   	   			return true
   	   		end
   	   end

   	    for j  in 1..@columns
   	   		temp=@board[1][j]
   	   		counter=1
   	   		for i in 2..@rows
   	   			if(@board[i][j]==temp && temp)
   	   				counter+=1
   	   			end
   	   		end
   	   		if counter==@rows
   	   			return true
   	   		end
   	    end

   	   	temp=@board[1][1]
   	   	counter=1
   		for i in 2..@rows
   	   		if @board[i][i]==temp && temp
   	   			counter+=1
   	   		end
   	  	end
   	   	if counter==@rows
   	   		return true
   	  	end

   	   	temp=@board[@rows][1]
   	   	counter=1
   		for i in 2..@rows
   		   	if @board[@rows-i+1][i]==temp && temp
   	   			counter+=1
   	   		end
   	   	end
   	   	if counter==@rows
   	   		return true
   		end
   	return false
    end
end
			