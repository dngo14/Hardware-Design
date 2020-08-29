#include<stdio.h>
#include<math.h>

int main() {
int N = 5;
printf("x\tsqrt(x)\n");
printf("-\t-------\n");    
for (int i = 0; i<N; i++) {
    printf("%d\t%f\n", i+1, sqrt(i+1));
}
}
