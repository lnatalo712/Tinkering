# Pandas will be used to store and access the sql database 
# Pyodbc will be used to gain access to the sql database 
# Random will be used to make the quiz questions randomized
import pandas as pd
import pyodbc
import random
from random import randrange

# Open a connection bewteen this file and the Tinkering database
conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=Tinkering;'
                      'Trusted_Connection=yes;')

# Query will be used to access all information in the Quotee table
# Count will be used to keep track off how many useable entries are left in the database
query = ('SELECT * FROM Tinkering.dbo.Quotee')
count = ('SELECT COUNT(*) FROM Tinkering.dbo.Quotee')

# Variables that don't need to be reset at the beginning of every loop
df = pd.read_sql(query, conn)
cnt = pd.read_sql(count, conn)
cnt = int(cnt.iloc[0])
options = ['1) ', '2) ', '3) ', '4) '] # An array for labeling each answer choice
play = True
incorrect = 0

while(play):
    # Variables that need to be reset at the beginning of each loop
    choices = random.sample(range(cnt), 4) # Randomly select 4 of the remaining quotes  
    answer_index = randrange(len(choices)) # Randomly select 1 of the 4 quotes to be the question and answer
    answer = choices[answer_index]
    wrong = True
    replay = True
    opt = 0
    
    print('Who said this quote?' + '\n')
    print('"' + df.loc[answer, 'Quote'] + '"' + '\n')
    print('Your choices are: ')

    # Print out each multiple choice answer and remove it from the pandas dataframe so that it can't be used again
    for i in choices:
        print(options[opt] + df.loc[i, 'FullName'])
        print('\n')
        df.drop(i, inplace = True)
        cnt -= 1
        opt += 1

    # Reindex the pandas dataframe so that there are no blank entries from the quotes that have already been used
    df.reset_index(drop = True, inplace = True)

    # Check to see if the user's answer is correct and let them keep guessing until they get the right answer
    while(wrong):
        user_answer = input()
        if int(user_answer) == (answer_index + 1):
            print('Correct! Good job!')
            wrong = False
        else:
            print('Incorrect! Try again!')
            incorrect += 1    

    # Ask the user if they would like another question
    while(replay):
        play_again = input('Would you like to play again? (yes/no) \n')
        if play_again == 'no':
            play = False
            replay = False
        elif play_again == 'yes':
            replay = False
        else:
            print('Please respond with either yes or no.')

    # Check to see if the pandas dataframe is empty and out of quotes
    if cnt == 0:
        play = False
        print('You\'ve answered all our questions! \n')

if incorrect == 1:
    print('You guessed incorrectly ' + str(incorrect) + ' time.')
else:
    print('You guessed incorrectly ' + str(incorrect) + ' times.')

print('Thanks for playing!')