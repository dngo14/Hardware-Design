#include<stdio.h>
#include<math.h>

int power(int x, int y) {
    int sum = 1;
    for (int i = 0; i<y; i++) {
        sum *= x;
    }
    return sum;
}

int main() {
    int result = power(4,2);
    printf("The result is %d\n", result);
}