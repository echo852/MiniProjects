# I often play games that require dice, anywhere between 4-sided up to 100-sided
# Having a dice roller is very useful!
# This is the Ruby version after refactoring with feedback

class Dice
    def initialize
        # what are valid dice shapes/sizes/sides?
        @valid_dice = [4,6,8,10,12,20,100]
        # some modifiable strings to make self tool more useful
        @beginning_prompt = "Let's roll some dice!  How many sides does your die have?"
        @invalid_dice_prompt = "Please choose a valid die size (4, 6, 8, 10, 12, 20, or 100)."
        @number_of_dice_prompt = "Great! How many of those are you rolling?"
        @add_prompt = "Do you want to add these numbers together? Y/N"
    end

    # write a some code to make sure that the dice requested are valid
    def validate_dice(sides)
        return @valid_dice.include?(sides.to_i)
    end

    # generate the random rolls
    def roll_dice(num_of_dice,sides)
    # define an empty list to collect the rolls
        rolls = []
        num_of_dice.times {
            result = rand(1...sides)
            rolls.append(result)
        }
        return rolls
    end

    # some games want the sum of dice rolled, so let's provide an option for that
    def add_dice(dice_string)
        total = 0
        dice_string.each { |num| 
            total += num
        }
        return total
    end

    # start rolling stuff
    def start_rolling
        puts @beginning_prompt
        sides = gets.chomp.to_i

        # make sure the user has entered an acceptable die
        while self.validate_dice(sides) == false
            puts @invalid_dice_prompt
            sides = gets.chomp.to_i
        end

        # now see how many of them they're rolling
        puts @number_of_dice_prompt
        num_of_dice = gets.chomp.to_i

        # once the user has entered the information we want, do some rolling
        result = self.roll_dice(num_of_dice, sides)
        puts "You rolled #{num_of_dice.to_s} #{sides.to_s}-sided dice.  Here are your results:"
        puts result.to_s

        # let's prompt for the adding of dice values
        puts @add_prompt
        add_question = gets.chomp.downcase
        # add the numbers together if the user inputs y or yes
        if add_question == 'y' || add_question == 'yes'
            sum = self.add_dice(result)
            puts "Your total is: #{sum}"
        else
            puts "See you again!"
        end
    end
end


# now let's run the script!
my_dice = Dice.new()
my_dice.start_rolling