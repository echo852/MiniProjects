# Guess a number between min and max, as defined when called

# import the random class so random numbers can be generated
import random

# create a method to generate a random number between min as max
def generate_number(min,max):
    randnum = random.randint(min,max)
    return randnum

# let's keep track of how many guesses it takes!
guess_counter = 0

# let's get the player's name
player_name = input("Let's play a game! What's your name?\n")
print("Hi there " + player_name + "!")
min_num = int(input("Pick a small number.\n"))
max_num = int(input("Pick another number that's bigger than the small number.\n"))
# generate a number between the two numbers that the player has picked
guess_me = generate_number(min_num,max_num)
print("Great!  I'm thinking of a number between " + str(min_num) + " and " + str(max_num) + ". What do you think it is?  You have 5 attempts!\n")

# players have 5 attempts to guess the right number
while guess_counter < 5:
    guess = int(input())
    guess_counter += 1
    if guess == guess_me:
        print("Congratulations! You win!")
        break
    if guess > guess_me:
        print("Too high. Try a smaller number.")
    if guess < guess_me:
        print("Too low. Try a bigger number.")
    
# once the game ends
if guess == guess_me:
    print("It took you " + str(guess_counter) + " tries!")
else:
    print("You weren't able to guess the number.  It was " + str(guess_me))