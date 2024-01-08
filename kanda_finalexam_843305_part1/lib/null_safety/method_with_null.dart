int getValue(int? someValue) {
  if (someValue == null) {
    return 0;
  } else {
    return someValue.abs();
  }
}

void main() {
  int a = getValue(-5), b = getValue(null), c = getValue(5);
  print("$a\t$b\t$c");
}