#include<stdio.h>
#include<math.h>

long prod_input() {
    long val;
    long prod = 0;
    while(scanf("%d", &val)!=EOF) {
        prod = prod * val;
    }
    return prod;
}

int main() {
    long x = prod_input();
    printf("The product is %d\n", x);
}