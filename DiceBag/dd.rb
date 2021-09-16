# general outline for a D&D type system

require_relative 'dicebag'
include DiceBag

def roll_stats()
    d6 = DSix.new
    dice_array = []
    until dice_array.length == 4
        roll = d6.roll
        while roll == 1
            roll = d6.roll
        end
        dice_array.append(roll)
    end
    dice_array.sort!
    highest3 = dice_array.pop(3)
    sum = DiceBag.sum_dice(highest3)
    return sum
end

menu = [
    "Hi there!  What can I help you do today?",
    "1. Roll a d20.",
    "2. Roll an ability (roll 4d6 and reroll any 1s, take the 3 highest).",
    "3. Roll damage.",
    "4. Quit."
].join("\n")+"\n"

# is the user finished with the rolling program? i'm sure there's a better way to do this
finished = false

while finished == false
    puts menu
    selection = gets.chomp.to_i
    case selection
    when 1
        puts "Okay, rolling a d20 for you.\n"
        d20 = DiceBag.what_kind_of_die(20)
        result = d20.roll
        puts "Here's your result: #{result}\n"
    when 2
        puts "Okay, let's roll a stat for you.\n"
        output = roll_stats
        puts "Here's a stat for you: #{output}\n"
    when 3
        puts "Okay, let's roll some damage."
        puts "How many sides are on the dice you are rolling?"
        sides = gets.chomp.to_i
        die_type = DiceBag.what_kind_of_die(sides)
        puts "Great! How many of those are you rolling?"
        num_of_dice = gets.chomp.to_i
        dice_output = []
        num_of_dice.times {
            roll = die_type.roll
            dice_output.append(roll)
        }
        puts "Here are your results: #{dice_output}\n"
        sum = DiceBag.sum_dice(dice_output)
        puts "Added together, this totals: #{sum}"
    when 4
        puts "Okay!  Bye for now!"
        finished = true
    else
        puts "Sorry, I didn't understand. Please make a selection."
    end
end