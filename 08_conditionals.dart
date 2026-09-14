void main() {
  
  // ============================================
  // 1. IF STATEMENT
  // ============================================
  print("=== IF STATEMENT ===");
  
  int age = 20;
  if (age >= 18) {
    print("You are an adult");  // This will execute
  }
  
  int score = 30;
  if (score > 50) {
    print("You passed");
  }
  // Nothing prints because condition is false
  
  // Single line if (without braces)
  bool isRaining = true;
  if (isRaining) print("Take an umbrella");
  
  
  // ============================================
  // 2. IF-ELSE STATEMENT
  // ============================================
  print("\n=== IF-ELSE STATEMENT ===");
  
  int marks = 45;
  if (marks >= 50) {
    print("PASS");
  } else {
    print("FAIL");  // This executes
  }
  
  String status = "";
  int temperature = 25;
  if (temperature > 30) {
    status = "Hot";
  } else {
    status = "Cool";  // This executes
  }
  print("Weather status: $status");
  
  // Single line if-else
  int number = 10;
  String result = (number % 2 == 0) ? "Even" : "Odd";
  print("$number is $result");
  
  
  // ============================================
  // 3. IF-ELSE IF-ELSE STATEMENT
  // ============================================
  print("\n=== IF-ELSE IF-ELSE STATEMENT ===");
  
  int percent = 85;
  String grade = "";
  
  if (percent >= 90) {
    grade = "A";
  } else if (percent >= 80) {
    grade = "B";  // This executes
  } else if (percent >= 70) {
    grade = "C";
  } else if (percent >= 60) {
    grade = "D";
  } else {
    grade = "F";
  }
  print("Percentage: $percent => Grade: $grade");
  
  
  // ============================================
  // 4. NESTED IF STATEMENTS
  // ============================================
  print("\n=== NESTED IF STATEMENTS ===");
  
  int userAge = 25;
  bool hasLicense = true;
  
  if (userAge >= 18) {
    if (hasLicense) {
      print("You can drive");  // This executes
    } else {
      print("You need a license to drive");
    }
  } else {
    print("You are too young to drive");
  }
  
  // Practical example: Login system
  String username = "john";
  String password = "12345";
  String inputUser = "john";
  String inputPass = "12345";
  
  if (inputUser == username) {
    if (inputPass == password) {
      print("Login successful!");  // This executes
    } else {
      print("Wrong password");
    }
  } else {
    print("Username not found");
  }
  
  
  // ============================================
  // 5. SWITCH STATEMENT
  // ============================================
  print("\n=== SWITCH STATEMENT ===");
  
  int day = 3;
  String dayName = "";
  
  switch (day) {
    case 1:
      dayName = "Monday";
      break;
    case 2:
      dayName = "Tuesday";
      break;
    case 3:
      dayName = "Wednesday";  // This executes
      break;
    case 4:
      dayName = "Thursday";
      break;
    case 5:
      dayName = "Friday";
      break;
    case 6:
      dayName = "Saturday";
      break;
    case 7:
      dayName = "Sunday";
      break;
    default:
      dayName = "Invalid day";
  }
  print("Day $day is: $dayName");
  
  
  // ============================================
  // 6. SWITCH WITH STRING
  // ============================================
  print("\n=== SWITCH WITH STRING ===");
  
  String fruit = "apple";
  int calories = 0;
  
  switch (fruit) {
    case "apple":
      calories = 52;  // This executes
      break;
    case "banana":
      calories = 89;
      break;
    case "orange":
      calories = 47;
      break;
    default:
      calories = 0;
  }
  print("$fruit has approximately $calories calories per 100g");
  
  
  // ============================================
  // 7. SWITCH WITH MULTIPLE CASES
  // ============================================
  print("\n=== SWITCH WITH MULTIPLE CASES ===");
  
  String color = "red";
  String colorType = "";
  
  switch (color) {
    case "red":
    case "green":
    case "blue":
      colorType = "Primary Color";  // Executes for red, green, or blue
      break;
    case "orange":
    case "purple":
    case "pink":
      colorType = "Secondary Color";
      break;
    default:
      colorType = "Unknown Color";
  }
  print("$color is a $colorType");
  
  
  // ============================================
  // 8. SWITCH EXPRESSION (Dart 2.14+)
  // ============================================
  print("\n=== SWITCH EXPRESSION ===");
  
  int month = 6;
  String season = switch (month) {
    1 || 2 || 12 => "Winter",
    3 || 4 || 5 => "Spring",
    6 || 7 || 8 => "Summer",      // Matches this
    9 || 10 || 11 => "Autumn",
    _ => "Invalid month"
  };
  print("Month $month is in: $season");
  
  
  // ============================================
  // 9. COMPLEX CONDITION WITH IF-ELSE
  // ============================================
  print("\n=== COMPLEX CONDITIONS ===");
  
  int userAge2 = 25;
  bool isStudent = false;
  double salary = 50000.0;
  
  if (userAge2 >= 18 && userAge2 <= 65) {
    if (isStudent) {
      print("Student discount available");
    } else if (salary > 30000) {
      print("Premium membership eligible");  // This executes
    } else {
      print("Standard membership");
    }
  } else {
    print("Membership not available for your age");
  }
  
  
  // ============================================
  // 10. PRACTICAL EXAMPLE: CALCULATOR WITH SWITCH
  // ============================================
  print("\n=== PRACTICAL EXAMPLE: CALCULATOR ===");
  
  double num1 = 10;
  double num2 = 5;
  String operation = "+";
  double answer = 0;
  
  switch (operation) {
    case "+":
      answer = num1 + num2;
      break;
    case "-":
      answer = num1 - num2;
      break;
    case "*":
      answer = num1 * num2;
      break;
    case "/":
      if (num2 != 0) {
        answer = num1 / num2;
      } else {
        print("Cannot divide by zero");
        answer = 0;
      }
      break;
    default:
      print("Invalid operation");
  }
  print("$num1 $operation $num2 = $answer");
  
  
  // ============================================
  // 11. PRACTICAL EXAMPLE: USER ROLE CHECK
  // ============================================
  print("\n=== PRACTICAL EXAMPLE: USER ROLE ===");
  
  String userRole = "admin";
  
  if (userRole == "admin") {
    print("✓ Can view all data");
    print("✓ Can edit all data");
    print("✓ Can delete users");
    print("✓ Can manage system settings");
  } else if (userRole == "editor") {
    print("✓ Can view published data");
    print("✓ Can edit own data");
  } else if (userRole == "user") {
    print("✓ Can view own data");
  } else {
    print("✗ Access denied");
  }
  
  
  // ============================================
  // 12. SWITCH VS IF-ELSE COMPARISON
  // ============================================
  print("\n=== SWITCH VS IF-ELSE ===");
  print("SWITCH: Better for multiple specific values (day of week, status codes)");
  print("IF-ELSE: Better for ranges and complex conditions (age >= 18, score > 50)");
  
  // Switch example (cleaner)
  String status2 = "pending";
  switch (status2) {
    case "pending":
      print("Waiting for approval...");
      break;
    case "approved":
      print("Order confirmed");
      break;
    case "rejected":
      print("Order cancelled");
      break;
    default:
      print("Unknown status");
  }
  
  // If-else example (more readable for ranges)
  int orderAmount = 150;
  if (orderAmount < 50) {
    print("Free shipping on orders above 50");
  } else if (orderAmount < 100) {
    print("Shipping: \$5");
  } else {
    print("Free shipping");
  }
  
}
