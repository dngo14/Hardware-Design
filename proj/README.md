For the extra features I added a couple of things.
    - Firstly since I did not have any comments on the base version I thought adding commments would be beneficial
    to viewers and graders
    - The first extra feature I added was to add a counter to how many substitutions were done. For this I used
    a local variable in translate and a local variable in main. I had the translate fucntion return the value of the
    counter to main and then store that into a local variable in main where it would iterate overtime and then be
    returned to the summary function to print how many substitutions there were.
    - The next feature I wanted to add was to check if there were any punctuations. Since I did not have any local
    variables left to use I decided to try to use global variables. To do this, I created a .word in the .data
    section of the code and intialized the global variable at 0. Then I created pointers in the .text portions of
    functions that used the global variable like the translate function and the summary function. To access the
    value inside the global variable I needed to make a register hold the address then access it like how you would
    access values that were local with [] and inside that would be the register that holds the address of the global
    variable. Then after taking the value I would add to it if what I am looking for matches the get_byte and then
    store it back into the global variable. I did basic comparisons with ! . and ? to check punctuations. After all	the inputs the global variable would be accessed in summary where it would print out the value.
    - Next I would create a function called is_digit which would check if the value of the get_byte was a digit. To
    do this, I made a function to check if the digit was between the ascii 0 and ascii 9 and if it was it would
    return 1 and if it did not it would return 0 to the translate function which is where is_digit was called. After
    returning a value, the code would check if 1 or 0 was returned and either add 1 or do nothing to the global
    variable digit. After all the inputs from a user the global variable would be called in summary to print the
    value at the digit address.
I worked on the extra features by myself and struggled a lot on figuring out how to use global variables. Google was
my friend while trying to figure out my problems. I used stackframe and developer.arm.com to help me find my bugs
and determine how global variables worked. For the longest time I had an error where digits and punctuations were
counted the same, but thankfully after struggling for hours I figured out the problem which is that I had to
initialize the global variables in the .data section rather than in main. Overall this project allowed me to use
all of my arm assembly knowledge as well as learn new aspects of the language. The project was tough at times,
however, finally getting everything to work perfectly gave me great satisfaction.


spec for is_digit:
is_digit (char)
	 one argument char, a character
	 returns: integer 1 for true or integer 0 for false
	 Takes a char argument and evaluates if it between ascii 0 and ascii 9. If it is return 1 and if it is not
	 return 0
