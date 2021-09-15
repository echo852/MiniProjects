# general outline for a D&D type system

require_relative 'dicebag'
include DiceBag

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

puts "Do you want me to add these numbers together for you?"
sum_request = gets.chomp.downcase
if sum_request == 'y' || sum_request == 'yes'
    sum = die_type.sum_dice(dice_output)
    puts "Okay! Here's your total: #{sum}."
else
    puts "Okay! See you again later!"
end