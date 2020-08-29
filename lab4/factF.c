#include<stdio.h>
#include<math.h>

int main() {
    int n = 5;
    if (n==0) {
        printf("The value is 1");
    }
    else {
        int sum = 1;
        int x = n;
        for(int i = 0; i<x; i++) {
            sum = sum * n;
            n-=1;
        }
        printf("The value is %d\n", sum);
    }
}