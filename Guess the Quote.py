import pandas as pd
import pyodbc
import random
from random import randrange

conn = pyodbc.connect('Driver={SQL Server};'
                      'Server=localhost;'
                      'Database=Tinkering;'
                      'Trusted_Connection=yes;')

query = ('SELECT * FROM Tinkering.dbo.Quotee')

df = pd.read_sql(query, conn)
count = 20
options = ['1) ', '2) ', '3) ', '4) ']
play = True

while(play):
    choices = random.sample(range(count), 4)  
    answer_index = randrange(len(choices))
    answer = choices[answer_index]
    wrong = True
    replay = True
    opt = 0
    
    print('Who said this quote?' + '\n')
    print('"' + df.loc[answer, 'Quote'] + '"' + '\n')
    print('Your choices are: ')

    for i in choices:
        print(options[opt] + df.loc[i, 'FullName'])
        print('\n')
        df.drop(i, inplace = True)
        count -= 1
        opt += 1

    df.reset_index(drop = True, inplace = True)

    while(wrong):
        user_answer = input()
        if int(user_answer) == (answer_index + 1):
            print('Correct! Good job!')
            wrong = False
        else:
            print('Incorrect! Try again!')    

    while(replay):
        play_again = input('Would you like to play again? (yes/no) \n')
        if play_again == 'no':
            play = False
            replay = False
        elif play_again == 'yes':
            replay = False
        else:
            print('Please respond with either yes or no.')

    if count == 0:
        play = False
        print('You\'ve answered all our questions! \n')

print('Thanks for playing!')