import 'dart:io';

void main() {
  // Available Menu Config (Using Basic Lists)
  List<String> menuPizzas = [
    "Margherita",
    "Pepperoni",
    "BBQ Chicken",
    "Vegetarian",
  ];
  List<double> basePrices = [8.99, 10.99, 11.99, 9.99];

  // User Cart Tracking Matrix (Parallel Lists)
  List<String> cartPizzas = [];
  List<String> cartSizes = [];
  List<double> cartPrices = [];

  bool ordering = true;
  double salesTaxRate = 0.08; // 8% Sales Tax

  print("=== Welcome to the Slice & Dice Pizzeria Terminal ===");

  while (ordering) {
    print("\n--- PIZZA APP MENU ---");
    print("1. View Menu & Prices");
    print("2. Add Pizza to Order Cart");
    print("3. View Current Cart");
    print("4. Checkout & Print Receipt");
    print("5. Cancel Order and Exit");
    stdout.write("Select options (1-5): ");

    String? menuChoice = stdin.readLineSync();

    switch (menuChoice) {
      // 1. VIEW PIZZA MENU
      case "1":
        print("\n🍕 --- Our Pizza Menu ---");
        for (int i = 0; i < menuPizzas.length; i++) {
          print(
            "${i + 1}. ${menuPizzas[i]} - \$${basePrices[i].toStringAsFixed(2)} (Base Price)",
          );
        }
        print("Note: Medium size adds \$2.00, Large adds \$4.00.");
        break;

      // 2. ADD PIZZA TO CART
      case "2":
        print("\nSelect a Pizza Style:");
        for (int i = 0; i < menuPizzas.length; i++) {
          print("  ${i + 1}. ${menuPizzas[i]}");
        }
        stdout.write("Enter Choice (1-${menuPizzas.length}): ");
        int? pizzaIdx = int.tryParse(stdin.readLineSync() ?? "");

        // Relational operator boundaries to ensure choice falls within list range
        if (pizzaIdx == null || pizzaIdx < 1 || pizzaIdx > menuPizzas.length) {
          print("❌ Invalid selection. Pizza item not added.");
        } else {
          String selectedPizza = menuPizzas[pizzaIdx - 1];
          double calculationPrice = basePrices[pizzaIdx - 1];

          print(
            "\nSelect Size:\n  S. Small (Base)\n  M. Medium (+\$2.00)\n  L. Large (+\$4.00)",
          );
          stdout.write("Enter preference (S/M/L): ");
          String? sizeInput = stdin.readLineSync()?.toUpperCase();

          String targetSize = "Small";
          if (sizeInput == "M") {
            targetSize = "Medium";
            calculationPrice += 2.00; // Compound addition assignment operator
          } else if (sizeInput == "L") {
            targetSize = "Large";
            calculationPrice += 4.00;
          } else if (sizeInput != "S") {
            print("⚠️ Unrecognized size option. Defaulting to Small.");
          }

          // Commit items directly to corresponding list allocations
          cartPizzas.add(selectedPizza);
          cartSizes.add(targetSize);
          cartPrices.add(calculationPrice);

          print(
            "✅ Added: $targetSize $selectedPizza (\$${calculationPrice.toStringAsFixed(2)}) to your cart!",
          );
        }
        break;

      // 3. VIEW CURRENT CART
      case "3":
        print("\n🛒 --- Your Current Order Cart ---");
        if (cartPizzas.isEmpty) {
          print("Your cart is completely empty.");
        } else {
          for (int i = 0; i < cartPizzas.length; i++) {
            print(
              " - Item ${i + 1}: ${cartSizes[i]} ${cartPizzas[i]} | \$${cartPrices[i].toStringAsFixed(2)}",
            );
          }
        }
        break;

      // 4. CHECKOUT & PRINT RECEIPT
      case "4":
        print("\n🧾 --- Finalizing Transaction ---");
        if (cartPizzas.isEmpty) {
          print("❌ Checkout failed. Cannot check out with an empty cart.");
        } else {
          double subtotal = 0.0;

          for (double itemCost in cartPrices) {
            subtotal += itemCost;
          }

          // Basic math operator processing structure
          double calculatedTax = subtotal * salesTaxRate;
          double grandTotal = subtotal + calculatedTax;

          print("\n===============================");
          print("      SLICE & DICE PIZZERIA    ");
          print("===============================");
          for (int i = 0; i < cartPizzas.length; i++) {
            print(
              "${cartSizes[i]} ${cartPizzas[i]} ... \$${cartPrices[i].toStringAsFixed(2)}",
            );
          }
          print("-------------------------------");
          print("Subtotal:         \$${subtotal.toStringAsFixed(2)}");
          print("Tax (8%):         \$${calculatedTax.toStringAsFixed(2)}");
          print("GRAND TOTAL:      \$${grandTotal.toStringAsFixed(2)}");
          print("===============================");
          print("  Thank you for your business! ");

          // Flush current order data mapping strings back to baseline array parameters
          cartPizzas.clear();
          cartSizes.clear();
          cartPrices.clear();

          stdout.write("\nWould you like to start a new order? (Y/N): ");
          String? restartInput = stdin.readLineSync()?.toUpperCase();
          if (restartInput != "Y") {
            print("Exiting system. Have a great day!");
            ordering = false;
          }
        }
        break;

      // 5. CANCEL & EXIT
      case "5":
        print("Closing registers down. Order execution sequence aborted.");
        ordering = false;
        break;

      default:
        print("❌ Invalid instruction entered. Choose 1 through 5.");
    }
  }
}
