void main() {
  
  // ============================================
  // 1. FOR LOOP - BASIC SYNTAX
  // ============================================
  print("=== FOR LOOP - BASIC ===");
  
  for (int i = 1; i <= 5; i++) {
    print("Iteration $i");
  }
  // Output: Iteration 1, 2, 3, 4, 5
  
  
  // ============================================
  // 2. FOR LOOP - REVERSE
  // ============================================
  print("\n=== FOR LOOP - REVERSE ===");
  
  for (int i = 5; i >= 1; i--) {
    print("Countdown: $i");
  }
  // Output: Countdown: 5, 4, 3, 2, 1
  
  
  // ============================================
  // 3. FOR LOOP - WITH STEP
  // ============================================
  print("\n=== FOR LOOP - STEP BY 2 ===");
  
  for (int i = 0; i <= 10; i += 2) {
    print("Even numbers: $i");
  }
  // Output: 0, 2, 4, 6, 8, 10
  
  
  // ============================================
  // 4. FOR-IN LOOP (Iterating over lists)
  // ============================================
  print("\n=== FOR-IN LOOP ===");
  
  List<String> fruits = ["Apple", "Banana", "Orange", "Mango"];
  
  for (String fruit in fruits) {
    print("Fruit: $fruit");
  }
  
  List<int> numbers = [10, 20, 30, 40, 50];
  for (int num in numbers) {
    print("Number: $num");
  }
  
  
  // ============================================
  // 5. FOR-EACH LOOP
  // ============================================
  print("\n=== FOR-EACH LOOP ===");
  
  List<String> colors = ["Red", "Green", "Blue"];
  
  colors.forEach((color) {
    print("Color: $color");
  });
  
  // With arrow function syntax (shorter)
  colors.forEach((color) => print("$color is nice"));
  
  // For-each with index
  colors.asMap().forEach((index, color) {
    print("Index $index: $color");
  });
  
  
  // ============================================
  // 6. WHILE LOOP
  // ============================================
  print("\n=== WHILE LOOP ===");
  
  int count = 1;
  while (count <= 5) {
    print("Count: $count");
    count++;
  }
  // Output: Count: 1, 2, 3, 4, 5
  
  // While loop with condition
  int battery = 100;
  while (battery > 20) {
    print("Battery: $battery%");
    battery -= 20;
  }
  print("Battery low! Connect charger.");
  
  
  // ============================================
  // 7. DO-WHILE LOOP
  // ============================================
  print("\n=== DO-WHILE LOOP ===");
  
  int x = 1;
  do {
    print("Do-While iteration: $x");
    x++;
  } while (x <= 5);
  // Output: Do-While iteration: 1, 2, 3, 4, 5
  
  // Do-while executes at least once
  int value = 10;
  do {
    print("This prints even if condition is false initially");
    value++;
  } while (value < 10);
  // Output: Prints once even though value >= 10
  
  
  // ============================================
  // 8. BREAK STATEMENT
  // ============================================
  print("\n=== BREAK STATEMENT ===");
  
  print("Search for 7 in list:");
  List<int> items = [1, 3, 5, 7, 9, 11];
  
  for (int item in items) {
    if (item == 7) {
      print("Found 7!");
      break;  // Exit loop
    }
    print("Checking: $item");
  }
  
  // Break in while loop
  int counter = 0;
  while (true) {
    if (counter == 3) {
      print("Breaking out at counter = $counter");
      break;
    }
    print("Counter: $counter");
    counter++;
  }
  
  
  // ============================================
  // 9. CONTINUE STATEMENT
  // ============================================
  print("\n=== CONTINUE STATEMENT ===");
  
  print("Print only even numbers:");
  for (int i = 1; i <= 10; i++) {
    if (i % 2 != 0) {
      continue;  // Skip odd numbers
    }
    print("Even: $i");
  }
  
  // Continue in while loop
  int n = 0;
  while (n < 5) {
    n++;
    if (n == 3) {
      continue;  // Skip when n == 3
    }
    print("n = $n");
  }
  
  
  // ============================================
  // 10. NESTED LOOPS
  // ============================================
  print("\n=== NESTED LOOPS ===");
  
  print("Multiplication Table (3x3):");
  for (int i = 1; i <= 3; i++) {
    for (int j = 1; j <= 3; j++) {
      print("$i x $j = ${i * j}");
    }
  }
  
  // Nested with lists
  print("\nMatrix display:");
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  for (int i = 0; i < matrix.length; i++) {
    for (int j = 0; j < matrix[i].length; j++) {
      print("${matrix[i][j]} ", );
    }
    print("");  // New line
  }
  
  
  // ============================================
  // 11. PRACTICAL EXAMPLE: SUM OF NUMBERS
  // ============================================
  print("\n=== PRACTICAL: SUM OF NUMBERS ===");
  
  int sum = 0;
  for (int i = 1; i <= 10; i++) {
    sum += i;
  }
  print("Sum of 1 to 10: $sum");  // 55
  
  
  // ============================================
  // 12. PRACTICAL EXAMPLE: FACTORIAL
  // ============================================
  print("\n=== PRACTICAL: FACTORIAL ===");
  
  int number = 5;
  int factorial = 1;
  
  for (int i = number; i > 0; i--) {
    factorial *= i;
  }
  print("Factorial of $number: $factorial");  // 120
  
  
  // ============================================
  // 13. PRACTICAL EXAMPLE: PATTERN PRINTING
  // ============================================
  print("\n=== PRACTICAL: STAR PATTERN ===");
  
  for (int i = 1; i <= 5; i++) {
    String stars = "";
    for (int j = 0; j < i; j++) {
      stars += "* ";
    }
    print(stars);
  }
  // Output:
  // *
  // * *
  // * * *
  // * * * *
  // * * * * *
  
  
  // ============================================
  // 14. PRACTICAL EXAMPLE: SEARCHING IN LIST
  // ============================================
  print("\n=== PRACTICAL: SEARCH IN LIST ===");
  
  List<String> names = ["Alice", "Bob", "Charlie", "David"];
  String searchName = "Charlie";
  bool found = false;
  
  for (String name in names) {
    if (name == searchName) {
      print("Found: $searchName");
      found = true;
      break;
    }
  }
  
  if (!found) {
    print("$searchName not found");
  }
  
  
  // ============================================
  // 15. PRACTICAL EXAMPLE: VALIDATION
  // ============================================
  print("\n=== PRACTICAL: VALIDATE INPUT ===");
  
  int userPassword = 1234;
  int attempts = 0;
  int maxAttempts = 3;
  
  while (attempts < maxAttempts) {
    int inputPassword = 1234;  // Simulating user input
    
    if (inputPassword == userPassword) {
      print("Password correct! Access granted.");
      break;
    } else {
      attempts++;
      print("Wrong password. Attempts left: ${maxAttempts - attempts}");
      if (attempts >= maxAttempts) {
        print("Account locked! Too many attempts.");
      }
    }
  }
  
  
  // ============================================
  // 16. PRACTICAL EXAMPLE: FIBONACCI SEQUENCE
  // ============================================
  print("\n=== PRACTICAL: FIBONACCI SEQUENCE ===");
  
  int num = 7;
  int a = 0, b = 1;
  
  print("First $n Fibonacci numbers:");
  for (int i = 0; i < num; i++) {
    print(a);
    int temp = a + b;
    a = b;
    b = temp;
  }
  // Output: 0, 1, 1, 2, 3, 5, 8
  
  
  // ============================================
  // 17. COMPARING LOOP TYPES
  // ============================================
  print("\n=== LOOP TYPE COMPARISON ===");
  print("FOR: When you know exact number of iterations");
  print("FOR-IN: When iterating over collections (lists, sets)");
  print("WHILE: When condition-based, unknown iteration count");
  print("DO-WHILE: When loop must execute at least once");
  
  
  // ============================================
  // 18. LOOP WITH LISTS - ADVANCED
  // ============================================
  print("\n=== LOOP WITH LISTS - ADVANCED ===");
  
  List<int> nums = [1, 2, 3, 4, 5];
  
  // Traditional for loop with index
  for (int i = 0; i < nums.length; i++) {
    print("Index $i: ${nums[i]}");
  }
  
  // For-in without index
  for (int num in nums) {
    print("Value: $num");
  }
  
  // Using where to filter
  print("\nEven numbers only:");
  nums.where((num) => num % 2 == 0).forEach((num) {
    print(num);
  });
  
}
