#include<stdio.h>
#include<math.h>

float mean_input() {
    int val, sum = 0, count = 0;
    while (scanf("%d",&val)!=EOF) {
        sum += val;
        count++;
    }
    float x = (sum * 1.0)/count;
    return x;
}

int main() {
    float x = mean_input();
    printf("The mean value is %f\n", x);
}