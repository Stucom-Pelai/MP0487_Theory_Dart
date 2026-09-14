void main() {
  String name = "John";
  String surname = "Smith";
  // using concatenation +
  String fullName = name.toUpperCase() + " " + surname.toUpperCase();
  print("Hello " + fullName);
  // using interpolation $ and { } for methods
  print("Hello ${name.toLowerCase()} ${surname.toLowerCase()}");
}
