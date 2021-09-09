# I often play games that require dice, anywhere between 4-sided up to 100-sided
# Having a dice roller is very useful!
# This is the Ruby version

# what are valid dice shapes/sizes/sides?
valid_dice = [4,6,8,10,12,20,100]

puts "Let's roll some dice!  How many sides does your die have?"
sides = gets.chomp

# make sure they're rolling acceptable dice
while valid_dice.include?(sides.to_i) == false
    puts "Please choose a valid die size (4, 6, 8, 10, 12, 20, or 100)."
    sides = gets.chomp
end

puts "Great! How many of those are you rolling?"
num_of_dice = gets.chomp

# here's the method to generate the random rolls
def roll_dice(num_of_dice,sides)
    # define an empty list to collect the rolls
    rolls = []
    num_of_dice.times {
        result = rand(1...sides)
        rolls.append(result)
    }
    return rolls
end

# okay, so let's do some printing!
result = roll_dice(num_of_dice.to_i,sides.to_i)
puts "You rolled #{num_of_dice} #{sides}-sided dice.  Here are your results:"
puts result.to_s

# some games want you to add the dice together, so let's provide that option
puts "Do you want to add these numbers together? Y/N"
add = gets.chomp.downcase

# here's a method to add those dice together
def add_dice(dice_string)
    total = 0
    dice_string.each { |num| 
        total += num
    }
    return total
end

# add the numbers together if the user inputs y or yes
if add == 'y' || add == 'yes'
    sum = add_dice(result)
    puts "Your total is: #{sum}"
else
    puts "See you again!"
end