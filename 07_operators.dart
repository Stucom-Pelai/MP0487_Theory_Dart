void main(){

  // ============================================
  // 1. ARITHMETIC OPERATORS
  // ============================================
  print("=== ARITHMETIC OPERATORS ===");
  
  int a = 10;
  int b = 3;
  
  print("a = $a, b = $b");
  print("Addition (+): ${a + b}");           // 13
  print("Subtraction (-): ${a - b}");        // 7
  print("Multiplication (*): ${a * b}");     // 30
  print("Division (/): ${a / b}");           // 3.333...
  print("Integer Division (~/): ${a ~/ b}"); // 3
  print("Modulus (%): ${a % b}");            // 1
  
  
  // ============================================
  // 2. COMPARISON OPERATORS (Return bool)
  // ============================================
  print("\n=== COMPARISON OPERATORS ===");
  
  print("a = $a, b = $b");
  print("Equal (==): ${a == b}");       // false
  print("Not Equal (!=): ${a != b}");   // true
  print("Greater (>): ${a > b}");       // true
  print("Less (<): ${a < b}");          // false
  print("Greater or Equal (>=): ${a >= b}");  // true
  print("Less or Equal (<=): ${a <= b}");     // false
  
  String str1 = "Dart";
  String str2 = "Dart";
  print("\nstr1 = '$str1', str2 = '$str2'");
  print("str1 == str2: ${str1 == str2}"); // true
  
  
  // ============================================
  // 3. LOGICAL OPERATORS
  // ============================================
  print("\n=== LOGICAL OPERATORS ===");
  
  bool x = true;
  bool y = false;
  
  print("x = $x, y = $y");
  print("AND (&&): ${x && y}");  // false
  print("OR (||): ${x || y}");   // true
  print("NOT (!): ${!x}");       // false
  print("NOT (!y): ${!y}");      // true
  
  // Practical example
  int age = 25;
  bool hasLicense = true;
  bool canDrive = (age >= 18) && hasLicense;
  print("\nCan drive? $canDrive"); // true
  
  
  // ============================================
  // 4. ASSIGNMENT OPERATORS
  // ============================================
  print("\n=== ASSIGNMENT OPERATORS ===");
  
  int num = 5;
  print("Initial num = $num");
  
  num += 3;  // num = num + 3
  print("After += 3: $num");   // 8
  
  num -= 2;  // num = num - 2
  print("After -= 2: $num");   // 6
  
  num *= 2;  // num = num * 2
  print("After *= 2: $num");   // 12
  
  num ~/= 3; // num = num ~/ 3
  print("After ~/= 3: $num");  // 4
  
  num %= 3;  // num = num % 3
  print("After %= 3: $num");   // 1
  
  
  // ============================================
  // 5. INCREMENT & DECREMENT OPERATORS
  // ============================================
  print("\n=== INCREMENT & DECREMENT ===");
  
  int counter = 0;
  print("counter = $counter");
  print("counter++: ${counter++}");  // prints 0, then counter becomes 1
  print("After counter++: $counter");  // 1
  
  print("++counter: ${++counter}");  // counter becomes 2, then prints 2
  
  print("counter--: ${counter--}");  // prints 2, then counter becomes 1
  print("After counter--: $counter");  // 1
  
  
  // ============================================
  // 6. TERNARY OPERATOR (? :)
  // ============================================
  print("\n=== TERNARY OPERATOR ===");
  
  int score = 75;
  String result = (score >= 50) ? "PASS" : "FAIL";
  print("Score: $score => Result: $result"); // PASS
  
  int marks = 35;
  String grade = (marks >= 90) ? "A" : 
                 (marks >= 75) ? "B" : 
                 (marks >= 50) ? "C" : "F";
  print("Marks: $marks => Grade: $grade");  // F  
  
  // ============================================
  // 7. OPERATOR PRECEDENCE & EXAMPLE
  // ============================================
  print("\n=== OPERATOR PRECEDENCE EXAMPLE ===");
  
  int result1 = 2 + 3 * 4;      // 14 (multiplication first)
  int result2 = (2 + 3) * 4;    // 20 (parentheses first)
  
  print("2 + 3 * 4 = $result1");
  print("(2 + 3) * 4 = $result2");
  
  bool condition = 5 > 3 && 2 < 4 || 10 == 5;  // true
  print("\n5 > 3 && 2 < 4 || 10 == 5: $condition");
  
}