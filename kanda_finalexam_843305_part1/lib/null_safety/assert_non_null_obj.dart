class Person {
    String? name;
}

void main() {
  Person? person;
  String? name = person!.name;
  print("name is $name");
}
