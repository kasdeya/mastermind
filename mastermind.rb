digits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]


def code_guess(cde)
    guess = ['','','','']
    p "Enter your 4 digit guess (0-9)"
    guess = gets.strip.split(//)
    matches = guess & cde # returns matches between code and guess
    correct_spot = matches.select do |number| cde.rindex(number) == guess.rindex(number) end # Checks for matches in the right spot
    wrong_spot = matches.select do |number| cde.rindex(number) != guess.rindex(number) end # Checks for matches in the wrong spot
    if guess == cde
        p 'You won'
        return true
    elsif matches.length > 0 && matches.length < 4
        p "Your guess: #{guess.join} you got  #{correct_spot.length.to_s}  correct and  #{wrong_spot.length.to_s}  coincidences"
        return false
    else
        p "none are correct"
        return false
end
return matches
end

def ai_guess(cde, turn)
    dig = ['0','1','2','3','4','5','6','7','8','9']
    confirmed_numbers = []
    guess = []
until confirmed_numbers == cde || turn >= 12
    turn += 1 # adds one to the counter up to 12 turns
    # guess.length == 4 
    guess = dig.sample(4) + confirmed_numbers.sample(4) # makes a random guess, using the dig array and the confirmed numbers array because, it will delete numbers from dig as they become confirmed, but takes numbers from confirmed so that guesses are all 4 digits
    guess = guess[0..3] # makes the guess only 4 digits, in case it was too big from the sum above
    p "Turn: #{turn}"
    p "Computer guess is: #{guess.join} Your code is: #{cde.join}"
    matches = cde & guess # checks for matches
    confirmed_numbers << matches # add matches to confirmed numbers
    confirmed_numbers.flatten!.uniq! # removes duplicates
    guess.select do |number| dig.delete(number) # deletes the numbers that were already matched from our digits array so computer doesnt choose em again
    # until confirmed_numbers == cde
    if confirmed_numbers.length == 4 &&  turn <= 12
        turn += 1
        confirmed_numbers.shuffle! # shuffles confirmed, pretty much until theres a match or turn 12(game over)
        p "Turn: #{turn}"
        p "Computer guess is: #{confirmed_numbers.join} Your code is: #{cde.join}"
        #  break if turn == 12
        if confirmed_numbers == cde && turn <= 12 
            p "Computer wins"
            break
        elsif confirmed_numbers != cde && turn >= 12
            p "You win"
            break
        end
    end
end
end
end


p "Welcome to Mastermind"
p "Do you want to play as the CODEMAKER(1)? or GUESSER(2)?" 
maker_or_guesser = gets.strip 
if maker_or_guesser == '1'
    p 'Input your code, 4 digits 0-9 no duplicates'
    code = ['','','','']
    code = gets.strip.split(//)
    code = code[0..3]
    p "Your code is #{code.join}"
    p "Game Begins"
    turn = 0
    ai_guess(code, turn)
elsif maker_or_guesser == '2'
    code = []
p code = digits.sample(4) 
turn = 1
until turn == 12 do
    p "TURN: " + turn.to_s
 break if code_guess(code) == true
turn += 1
end
end
