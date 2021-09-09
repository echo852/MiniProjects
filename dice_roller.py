# I often play games that require dice, anywhere between 4-sided up to 100-sided
# Having a dice roller is very useful!
# This is the Python version

# make sure to import the random module to generate random dice rolls
import random

# let's make a random method to generate a number to represent rolling some dice
def roll_dice(num_of_dice,sides):
    # define an empty list for dice
    rolls = []
    # roll the correct amount and type of dice
    for i in range(num_of_dice):
        result = random.randint(1,sides)
        # add the result of the random roll to the rolls list
        rolls.append(result)
    # spit out the resulting rolls
    return rolls

# what dice types/sides are valid?
valid_dice = [4,6,8,10,12,20,100]


sides = input("Let's roll some dice!  How many sides are on your dice?\n")

# make sure the user is inputting a valid dice option
while int(sides) not in valid_dice:
    print("Please choose a valid die size (4, 6, 8, 10, 12, 20, or 100).")
    sides = input("How many sides are on your dice?\n")

num_of_dice = input("Great!  How many of those are you rolling?\n")

# let's print it out!
result = roll_dice(int(num_of_dice),int(sides))
print("You rolled " + str(num_of_dice) + " " + str(sides) + "-sided dice.  Here are your rolls: \n " + str(result))

# some games want you to add the values of dice so let's do that
add = input("Do you want to add these dice together? Y/N\n")

# let's define a method that will add dice together
def add_dice(dice_array):
    result = 0
    for num in dice_array:
        result += num
    return result

# if the user indicates y or yes, add the numbers
if add.lower() == 'y' or add.lower() == 'yes':
    sum = add_dice(result)
    print("Okay!  Your total is: " + str(sum))
else:
    print("See you again!")