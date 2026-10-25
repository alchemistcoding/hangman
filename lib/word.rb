class Hangman
  def initialize
    @word_arr = get_word.split("")
    @word_hidden = Array.new(@word_arr.length,"_")
  end

  def get_guess

    valid = false
    until valid
      print "enter your guess letter or exit : "
      input = gets.chomp
      break if input == "exit"
      valid = true if ("a".."z").include?(input)  
    end
    input

  end

  def correct_letter?(guess)

    unless @word_arr.include?(guess)
      return false
    end

    @word_arr.each_index do |index|
     @word_hidden[index] = guess  if @word_arr[index] == guess
    end
    return true
  end

  def win?
    if @word_arr.join == @word_hidden.join
      return true
    else return false  
    end
  end

  def play
    puts @word_hidden.join(",")
    loop do
      input = get_guess
      if input == "exit"
        puts "game exit.The word was #{@word_arr.join}"
        break
      end
      if correct_letter?(input)
        puts "yes it does include #{input}"
        if win?
          puts "you WIN! the correct words was #{@word_arr.join}"
          break
        else puts @word_hidden.join(",")
        end
      else puts "no it does not include #{input}"
      end
    end
  end
end




def get_word
  file_path = File.expand_path("../english_word.txt", __FILE__)
  File.open(file_path, "r") do |file|
    word = file.to_a.sample
    until word.length >= 5 && word.length <= 12
      word = file.to_a.sample
    end
    word
  end
end