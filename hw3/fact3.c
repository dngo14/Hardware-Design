#include<stdio.h>
#include<math.h>

int main() {
    int n;
    int ans = 1;
    printf("What small integer to do factorial?\n");
    scanf("%d", &n);
    if (n>10 | n<0) {
        printf("The integer was too large or was negative :(\n");
        return 1;
    }
    else{
    printf("k\tk!\n");
    printf("-\t-------\n");
    if (n == 0) { 
        printf("%d\t%d\n",0, 1);
        }
    else {
        printf("%d\t%d\n",0, 1);
        for(int i = 1; i<=n; i++) { 
            ans *= i;
            printf("%d\t%d\n",i , ans);
            }   
        }
    }
}