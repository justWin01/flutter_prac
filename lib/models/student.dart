class Student {
  String name;
  int age;
  String course;

  Student({
    required this.name,
    required this.age,
    required this.course,
  });

  void introduce() {
    print('Hi, my name is $name.');
    print('I am $age years old.');
    print('My course is $course.');
  }
}
