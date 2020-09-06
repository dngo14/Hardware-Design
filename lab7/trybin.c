#include <stdio.h>
#include <math.h>

int main() {
    int x = 37;
    printf("x has value %d in decimal, %x in hexadecimal\n", (x >> 5) & 1, (x >> 5) & 1);

}