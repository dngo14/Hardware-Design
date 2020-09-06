#include<stdio.h>
#include<math.h>

long fact(unsigned int x) {
    int ans = 1;
    if (x == 0) {
        return 1;
    }
    else{
        for (int i = 1; i <= x; i++) {
            ans *= i;
        }
        return ans;
    }
}

int main() {
    int x;
    printf("Enter an integer\n");
    scanf("%d", &x);
    int y = fact(x);
    printf("The factorial of %d is %d\n", x, y);
}