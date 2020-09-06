#include <stdio.h>
#include <math.h>

unsigned int getbit(unsigned int x) {
    for (int i = 7; i >= 0; i--) {
        printf("The %d position in %x is %d\n", i, x, (x >> i)&1);
    }
}

int main() {
    int x;
    printf("Type in a hexadecimal number\n");
    scanf("%x", &x);
    getbit(x);
}