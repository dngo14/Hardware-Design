#include<stdio.h>
#include<math.h>

int main() {
    int x = 0xc93e;
    int y;
    printf("Enter a decimal integer\n");
    scanf("%d", &y);
    printf("The value of %d decimal is %x hexadecimal\n", y, y);
}