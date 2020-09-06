#include<stdio.h>
#include<math.h>

int main() {
    int n = 0;
    printf("What integer to do factorial?\n");
    scanf("%d", &n);
    int count = (n-1); //keeps track how many times to multiply
    int ans = n; //the answer accummulates in this variable
    if (n == 0) { //if statement to check if the number is 0
        ans = 1; //set answer to 1
        }
    else { //if the number is greater than 1 start this loop
        while (count!=0) { //loop to accumulate the factorial
            ans *= (n-1);
            n -= 1;
            count -= 1;
            }   
        }
    printf("the answer is %d\n", ans); //prints the answer
}
