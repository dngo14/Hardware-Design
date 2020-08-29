#include<stdio.h>
#include<math.h>

double mean(double num1, double num2) {
  return (num1 + num2) / 2;
}

int sum_input() {
  int val;       /* holds next integer value from standard input */
  int sum = 0;   /* sum of input integers so far */
  while (scanf("%d", &val) != EOF) 
    sum = sum + val;
  return sum; 
}

int main() {
    double result = mean(5, 8);
    printf("The call mean(5, 8) returns %f\n", result);
    printf("Enter integers to find the sum\n");
    int x = sum_input();
    printf("The return value from calling sum_input() is %d\n", x);
}