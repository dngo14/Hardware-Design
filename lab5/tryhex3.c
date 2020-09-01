#include<stdio.h>
#include<math.h>

int main() {
    int x = 0xc93e;
    int y;
    printf("Enter a hexadecimal integer\n");
    scanf("%x", &y);
    printf("The value of %x hexadecimal is %d decimal\n", y, y);
}