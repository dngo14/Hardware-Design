#include <stdio.h>

void strncopy(char arg1[], char arg2[], unsigned int x) {
  for (int i = 0; i < x; i++) {
    arg1[i] = arg2[i];
  }
  arg1[x] = '\0';
}

int main() {
  char A[100];
  printf("Calling strncopy(A, \"The end\", 5);\n");
  strncopy(A, "The end", 5);
  printf("The array A now contains string \"%s\"\n", A);
  printf("%s\n", A);
}
