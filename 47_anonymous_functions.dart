void test(void Function(int) action) { // 2.
        final list = [1, 2, 3, 4, 5];
// 3.
        for(final item in list)
            action(item);
}

void main() { // 4.
  
  test((int value) { print("Number $value"); });
  
}