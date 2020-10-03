#include <stdio.h>

void strncopy(char *arg1, char *arg2, unsigned int arg3) {
  for (int i = 0; i < arg3; i++) {
    *arg1 = *arg2;
    arg1++;
    arg2++;
  }
}

int main() {
  char A[100];
  strncopy(A, "The end", 5);
  printf("%s\n", A);
}
