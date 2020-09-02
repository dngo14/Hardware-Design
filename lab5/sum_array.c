#include<stdio.h>
#include<math.h>

double sum_arrayd(double x[], int y) {
    double sum = 0;
    for(int i = 0; i < y; i++) {
        sum += x[i];
    }
    return sum;
}

int main() {
    double arg1[] = {3.14, 72.6, 45, -13.8};
    double sum = sum_arrayd(arg1, 4);
    printf("The sum of array element is %f\n", sum);
}