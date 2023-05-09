def user_input():
    user_number = input("""###  This program converts decimal numbers to Roman Numerals ###
     (To exit the program, please type "exit")
     Please enter a number between 1 and 3999, inclusively : """)
    if user_number == "exit":
        print("\nThanks for using our program!\n")
        exit()      
    
    elif not user_number.isdigit():
        print("\nPlease don't enter a string. You don't know what a number is?\n")
        user_input()
    
    elif int(user_number) > 3999 or int(user_number) < 1:
        print("\nPlease enter a number between 1 and 3999, inclusively!\n")
        user_input()
    return int(user_number)
            
def decimal_to_roman(args):
    roman_letters = {1:"I", 5:"V", 10:"X", 50:"L", 100:"C", 500:"D", 1000:"M", 2:"II", 3:"III", 4:"IV", 6:"VI", 7:"VII", 8:"VIII", 9:"IX", 40:"XL", 90:"XC", 400:"CD", 900:"CM"}
    count = 0
    roman_number = ""
    my_number = args
    
    for i in sorted(roman_letters)[::-1]:
        if my_number >= i:
            count = my_number // i
            roman_number += roman_letters[i] * count
            my_number %= i
    
    return roman_number   
    
    
my_number = user_input()

print("\nYour number", my_number, "written in Roman Numerals is:", decimal_to_roman(my_number))





