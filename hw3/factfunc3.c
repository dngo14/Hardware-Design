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
    printf("k\tk!\n");
    printf("-\t-------\n");
    if (x == 0) { 
        printf("%d\t%d\n",0, 1);
        }
    else {
        printf("%d\t%d\n",0, 1);
        for (int i = 0; i<=x; i++) {
        int y = fact(i);
        printf("%d\t%d\n", i, y);
        }
    }
}