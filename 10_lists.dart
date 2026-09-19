void main() {
  
  // ============================================
  // 1. LIST DECLARATION AND INITIALIZATION
  // ============================================
  print("=== LIST DECLARATION ===");
  
  // Empty list with type specification
  List<String> fruits = [];
  List<int> numbers = [];
  
  print("Empty list: $fruits");
  print("Empty numbers: $numbers");
  
  // List with initial values
  List<String> colors = ["Red", "Green", "Blue"];
  List<int> nums = [1, 2, 3, 4, 5];
  
  print("Colors: $colors");
  print("Numbers: $nums");
  
  // Untyped list (stores any type - not recommended)
  List mixedList = [1, "two", 3.0, true];
  print("Mixed list: $mixedList");
  
  // Using List constructor
  List<int> range = List.filled(5, 0);  // [0, 0, 0, 0, 0]
  print("Filled list: $range");
  
  // Generate list
  List<int> sequence = List.generate(5, (i) => i + 1);  // [1, 2, 3, 4, 5]
  print("Generated list: $sequence");
  
  
  // ============================================
  // 2. ACCESSING LIST ELEMENTS
  // ============================================
  print("\n=== ACCESSING ELEMENTS ===");
  
  List<String> days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"];
  
  print("First element: ${days[0]}");      // Monday
  print("Second element: ${days[1]}");     // Tuesday
  print("Last element: ${days[days.length - 1]}");  // Friday
  print("Last element (easy): ${days.last}");       // Friday
  print("First element (easy): ${days.first}");     // Monday
  
  // Multiple access
  List<int> scores = [10, 20, 30, 40, 50];
  print("\nScore at index 2: ${scores[2]}");  // 30
  print("Score at index 4: ${scores[4]}");  // 50
  
  
  // ============================================
  // 3. LIST PROPERTIES
  // ============================================
  print("\n=== LIST PROPERTIES ===");
  
  List<String> animals = ["Dog", "Cat", "Bird"];
  
  print("Length: ${animals.length}");       // 3
  print("Is empty? ${animals.isEmpty}");    // false
  print("Is not empty? ${animals.isNotEmpty}");  // true
  
  List<int> emptyList = [];
  print("\nEmpty list length: ${emptyList.length}");      // 0
  print("Is empty? ${emptyList.isEmpty}");  // true
  
  
  // ============================================
  // 4. ADDING ELEMENTS
  // ============================================
  print("\n=== ADDING ELEMENTS ===");
  
  List<String> shopping = ["Milk", "Bread"];
  print("Initial: $shopping");
  
  // Add single element
  shopping.add("Eggs");
  print("After add: $shopping");
  
  // Add multiple elements
  shopping.addAll(["Butter", "Cheese"]);
  print("After addAll: $shopping");
  
  // Insert at specific position
  shopping.insert(1, "Butter2");  // Insert at index 1
  print("After insert: $shopping");
  
  
  // ============================================
  // 5. REMOVING ELEMENTS
  // ============================================
  print("\n=== REMOVING ELEMENTS ===");
  
  List<int> values = [10, 20, 30, 40, 50];
  print("Initial: $values");
  
  // Remove specific value
  values.remove(30);  // Removes first occurrence
  print("After remove(30): $values");
  
  // Remove at specific index
  values.removeAt(0);  // Removes first element
  print("After removeAt(0): $values");
  
  // Remove last element
  values.removeLast();
  print("After removeLast: $values");
  
  // Remove all matching condition
  List<int> nums2 = [1, 2, 3, 4, 5, 6];
  nums2.removeWhere((n) => n % 2 == 0);  // Remove even numbers
  print("After removeWhere (even removed): $nums2");  // [1, 3, 5]
  
  // Clear entire list
  List<String> temp = ["a", "b", "c"];
  temp.clear();
  print("After clear: $temp");  // []
  
  
  // ============================================
  // 6. MODIFYING ELEMENTS
  // ============================================
  print("\n=== MODIFYING ELEMENTS ===");
  
  List<int> scores2 = [10, 20, 30, 40];
  print("Initial: $scores2");
  
  // Modify by index
  scores2[0] = 15;
  scores2[2] = 35;
  print("After modification: $scores2");  // [15, 20, 35, 40]
  
  
  // ============================================
  // 7. CHECKING IF ELEMENT EXISTS
  // ============================================
  print("\n=== CHECKING ELEMENT EXISTS ===");
  
  List<String> fruits2 = ["Apple", "Banana", "Orange"];
  
  print("Contains 'Banana'? ${fruits2.contains('Banana')}");  // true
  print("Contains 'Mango'? ${fruits2.contains('Mango')}");    // false
  
  // Find index
  print("Index of 'Orange': ${fruits2.indexOf('Orange')}");   // 2
  print("Index of 'Grape': ${fruits2.indexOf('Grape')}");     // -1 (not found)
  
  
  // ============================================
  // 8. ITERATING OVER LIST
  // ============================================
  print("\n=== ITERATING OVER LIST ===");
  
  List<String> colors2 = ["Red", "Green", "Blue"];
  
  // For loop
  print("For loop:");
  for (int i = 0; i < colors2.length; i++) {
    print("  $i: ${colors2[i]}");
  }
  
  // For-in loop
  print("For-in loop:");
  for (String color in colors2) {
    print("  - $color");
  }
  
  // forEach with index
  print("ForEach with asMap:");
  colors2.asMap().forEach((index, color) {
    print("  Position $index: $color");
  });
  
  
  // ============================================
  // 9. LIST TRANSFORMATION - MAP
  // ============================================
  print("\n=== MAP TRANSFORMATION ===");
  
  List<int> numbers2 = [1, 2, 3, 4, 5];
  
  // Double each number
  List<int> doubled = numbers2.map((n) => n * 2).toList();
  print("Original: $numbers2");
  print("Doubled: $doubled");
  
  // Convert to strings
  List<String> numStrings = numbers2.map((n) => "Number: $n").toList();
  print("As strings: $numStrings");
  
  
  // ============================================
  // 10. LIST FILTERING - WHERE
  // ============================================
  print("\n=== FILTERING WITH WHERE ===");
  
  List<int> numbers3 = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  
  // Filter even numbers
  List<int> evens = numbers3.where((n) => n % 2 == 0).toList();
  print("All numbers: $numbers3");
  print("Even numbers: $evens");
  
  // Filter numbers greater than 5
  List<int> greaterThan5 = numbers3.where((n) => n > 5).toList();
  print("Numbers > 5: $greaterThan5");
  
  
  // ============================================
  // 11. SORTING LISTS
  // ============================================
  print("\n=== SORTING LISTS ===");
  
  List<int> unsorted = [5, 2, 8, 1, 9, 3];
  print("Unsorted: $unsorted");
  
  // Sort ascending
  unsorted.sort();
  print("Sorted ascending: $unsorted");
  
  // Sort descending
  List<int> descending = [5, 2, 8, 1, 9, 3];
  descending.sort((a, b) => b.compareTo(a));
  print("Sorted descending: $descending");
  
  // Sort strings
  List<String> words = ["zebra", "apple", "mango", "banana"];
  words.sort();
  print("Sorted words: $words");
  
  
  // ============================================
  // 12. LIST METHODS - USEFUL FUNCTIONS
  // ============================================
  print("\n=== USEFUL LIST METHODS ===");
  
  List<int> nums3 = [1, 2, 3, 4, 5];
  
  // First and last
  print("First: ${nums3.first}");
  print("Last: ${nums3.last}");
  
  // Reversed
  print("Reversed: ${nums3.reversed.toList()}");
  
  // Join (combine into string)
  print("Joined with '-': ${nums3.join('-')}");
  
  // Any and every
  print("Any even? ${nums3.any((n) => n % 2 == 0)}");  // true
  print("All positive? ${nums3.every((n) => n > 0)}"); // true
  
  // Reduce (combine all into one)
  int sum = nums3.reduce((a, b) => a + b);
  print("Sum using reduce: $sum");  // 15
  
  
  // ============================================
  // 13. SUBLIST AND SLICE
  // ============================================
  print("\n=== SUBLIST AND SLICE ===");
  
  List<String> items = ["a", "b", "c", "d", "e"];
  
  // Get sublist from index 1 to 3
  print("Original: $items");
  print("Sublist(1, 3): ${items.sublist(1, 3)}");  // [b, c]
  print("Sublist(2): ${items.sublist(2)}");        // [c, d, e]
  
  
  // ============================================
  // 14. SPREADING AND COMBINING LISTS
  // ============================================
  print("\n=== SPREADING AND COMBINING ===");
  
  List<int> list1 = [1, 2, 3];
  List<int> list2 = [4, 5, 6];
  List<int> list3 = [7, 8, 9];
  
  // Using spread operator
  List<int> combined = [...list1, ...list2, ...list3];
  print("Combined: $combined");
  
  // Add with specific position
  List<int> merged = [1, 2, 3];
  merged.insertAll(3, [4, 5, 6]);
  print("Merged: $merged");
  
  
  // ============================================
  // 15. NESTED LISTS (2D ARRAYS)
  // ============================================
  print("\n=== NESTED LISTS ===");
  
  List<List<int>> matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
  ];
  
  print("Matrix:");
  for (List<int> row in matrix) {
    print(row);
  }
  
  // Access element
  print("Element at [1][2]: ${matrix[1][2]}");  // 6
  
  
  // ============================================
  // 16. UNIQUE ELEMENTS
  // ============================================
  print("\n=== UNIQUE ELEMENTS ===");
  
  List<int> values2 = [1, 2, 2, 3, 3, 3, 4, 4, 5];
  print("Original: $values2");
  
  // Get unique using Set
  List<int> unique = values2.toSet().toList();
  print("Unique: $unique");
  
  
  // ============================================
  // 17. PRACTICAL EXAMPLE: STUDENT GRADES
  // ============================================
  print("\n=== PRACTICAL: STUDENT GRADES ===");
  
  List<int> grades = [85, 90, 78, 92, 88, 76, 95];
  
  print("All grades: $grades");
  print("Highest: ${grades.reduce((a, b) => a > b ? a : b)}");
  print("Lowest: ${grades.reduce((a, b) => a < b ? a : b)}");
  print("Average: ${grades.reduce((a, b) => a + b) / grades.length}");
  print("Passed (>= 80): ${grades.where((g) => g >= 80).toList()}");
  
  
  // ============================================
  // 18. PRACTICAL EXAMPLE: SHOPPING CART
  // ============================================
  print("\n=== PRACTICAL: SHOPPING CART ===");
  
  List<String> cart = [];
  
  // Add items
  cart.add("Laptop");
  cart.addAll(["Mouse", "Keyboard", "Monitor"]);
  print("Cart: $cart");
  print("Items in cart: ${cart.length}");
  
  // Remove item
  cart.remove("Mouse");
  print("After removing Mouse: $cart");
  
  // Check if item exists
  if (cart.contains("Laptop")) {
    print("✓ Laptop is in cart");
  }
  
  
  // ============================================
  // 19. PRACTICAL EXAMPLE: TEMPERATURE MONITOR
  // ============================================
  print("\n=== PRACTICAL: TEMPERATURE MONITOR ===");
  
  List<double> temperatures = [22.5, 23.1, 21.8, 24.5, 22.9, 23.2];
  
  print("Temperatures: $temperatures");
  print("Highest: ${temperatures.reduce((a, b) => a > b ? a : b)}°C");
  print("Lowest: ${temperatures.reduce((a, b) => a < b ? a : b)}°C");
  print("Normal (22-24): ${temperatures.where((t) => t >= 22 && t <= 24).length} readings");
  print("High temp alerts: ${temperatures.where((t) => t > 24).toList()}");
  
  
  // ============================================
  // 20. LIST VS SET VS MAP
  // ============================================
  print("\n=== LIST VS SET VS MAP ===");
  print("LIST: Ordered, allows duplicates, access by index");
  print("SET: Unordered, no duplicates, fast lookup");
  print("MAP: Key-value pairs, lookup by key");
  
  // Example
  List<int> myList = [1, 2, 2, 3];  // [1, 2, 2, 3]
  Set<int> mySet = {1, 2, 3};     // {1, 2, 3}
  Map<String, int> myMap = {"a": 1, "b": 2};  // {"a": 1, "b": 2}
  
  print("\nList: $myList");
  print("Set: $mySet");
  print("Map: $myMap");
  
}
