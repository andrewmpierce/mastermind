$colors = ['red', 'blue','black', 'yellow', 'green', 'white']

def create_answer
  $colors.shuffle[0..4]
end

$answer = []
$turn_num = 8

$player_won = false


def main
  $answer = create_answer
  while !$player_won && $turn_num <= 10 do
    puts "The colors are #{$colors}"
    puts "Turn #{$turn_num}/10"
    user_input = []
    puts "What is your first peg guess?"
    user_input.push gets.chomp
    puts "What is your second peg guess?"
    user_input.push gets.chomp
    puts "What is your third peg guess?"
    user_input.push gets.chomp
    puts "What is your fourth peg guess?"
    user_input.push gets.chomp

    response = check_user_guess(user_input)

    puts "You have #{response[:black]} black pegs"
    puts "You have #{response[:white]} white pegs"
    $turn_num += 1
  end

  if $player_won
    puts "Hey! You won!"
  else
    puts "Hey! You ran out of turns didn't win!"
  end
end


def check_user_guess(guess)
   result = {
     'white': 0,
     'black': 0
    }

    guess.each_with_index do | peg, i |

      if $answer[i] == peg
        result[:black] += 1
      elsif $answer.include? peg
        result[:white] += 1
      end
    end

    $player_won = true if result[:black] == 4
    result
end


main
