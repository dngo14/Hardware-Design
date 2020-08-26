#include<stdio.h>
#include<math.h>

int main() {
    float v = 3.5;
    if (v == 0)
        printf("v is equal to 0\n");
    else if (v > 0)
        printf("v is positive\n");
    else
        printf("v is negative\n");

    float f = 4;
    if (f == (int)f)
        printf("f is an integer\n");
    else
        printf("f is a float\n");

    float i = 16;
    float x = sqrt(16);
    if (x == (int)x)
        printf("i is a square number\n");
    else
        printf("i is not a square number\n");
    
}