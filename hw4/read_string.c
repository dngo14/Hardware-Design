#include <stdio.h>
#include <math.h>

int read_string(char x[], int y) {
  char z;
  int count = 0;
  while(scanf("%c",&z)!=EOF && z != '\n') {
    x[count] = z;
    count++;
    if (count >=y) {
      printf("This is a longer line which is over 50 chars, so only 49 chars were stored\n");
      break;
  }
  }
  x[count]='\0';
  return count;
}
  
int main() { 
  char char_arr[50];
  int ret = read_string(char_arr, 50);
  printf("%s\n", char_arr);
  printf("%d characters were stored\n",ret); 
}

    
