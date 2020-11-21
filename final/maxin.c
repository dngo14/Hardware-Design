#include <stdio.h>

int maxin(int x) {
  int count = 0;
  int num = 0;
  int number = 0;
  printf("Enter inputs: \n");
  scanf("%d", &number);
  while(count != x-1) {
    scanf("%d", &num);
    if(number <= num) {
      number = num;
      }
    else{
      number= number;
	}
    count++;
  }
  return number;
}

int main() {
  int max;
  max = maxin(5);
  printf("The number is %d\n", max);
}
