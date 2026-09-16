import 'dart:io';

void main() {
  // Parallel lists to store shipment data using basic syntax
  List<int> shipmentIds = [101, 102, 103];
  List<String> destinations = ["New York", "London", "Tokyo"];
  List<String> statuses = ["In Transit", "Processing", "Delivered"];
  List<double> weights = [5.5, 12.0, 2.5];

  bool running = true;

  print("=== Welcome to the Shipment Tracking System ===");

  // Infinite menu loop controlled by a boolean flag
  while (running) {
    print("\n--- MAIN MENU ---");
    print("1. View All Shipments");
    print("2. Track a Shipment by ID");
    print("3. Update Shipment Status");
    print("4. Add New Shipment");
    print("5. Calculate Total Shipping Weight");
    print("6. Exit");
    stdout.write("Please enter your choice (1-6): ");
    
    String? choiceInput = stdin.readLineSync();
    
    // Conditional Switch Statement to process user choices
    switch (choiceInput) {
      
      // 1. VIEW ALL SHIPMENTS
      case "1":
        print("\n--- Current Shipments ---");
        if (shipmentIds.isEmpty) {
          print("No shipments found in the system.");
        } else {
          // Standard for loop to iterate through matching indices
          for (int i = 0; i < shipmentIds.length; i++) {
            print("ID: ${shipmentIds[i]} | Destination: ${destinations[i]} | Status: ${statuses[i]} | Weight: ${weights[i]} kg");
          }
        }
        break;

      // 2. TRACK SHIPMENT BY ID
      case "2":
        stdout.write("Enter Shipment ID to track: ");
        String? trackInput = stdin.readLineSync();
        int? trackId = int.tryParse(trackInput ?? "");

        if (trackId == null) {
          print("❌ Invalid input! ID must be a number.");
        } else {
          bool found = false;
          // For loop paired with an if statement to find a record match
          for (int i = 0; i < shipmentIds.length; i++) {
            if (shipmentIds[i] == trackId) {
              print("\n📦 Shipment Found!");
              print("ID: ${shipmentIds[i]}");
              print("Destination: ${destinations[i]}");
              print("Current Status: ${statuses[i]}");
              print("Weight: ${weights[i]} kg");
              found = true;
              break; // Logical exit out of the loop once found
            }
          }
          if (!found) {
            print("❌ Shipment ID $trackId not found.");
          }
        }
        break;

      // 3. UPDATE SHIPMENT STATUS
      case "3":
        stdout.write("Enter Shipment ID to update: ");
        String? updateInput = stdin.readLineSync();
        int? updateId = int.tryParse(updateInput ?? "");

        if (updateId == null) {
          print("❌ Invalid input.");
        } else {
          bool found = false;
          for (int i = 0; i < shipmentIds.length; i++) {
            if (shipmentIds[i] == updateId) {
              found = true;
              print("Current Status: ${statuses[i]}");
              print("Select New Status:\n  A. Processing\n  B. In Transit\n  C. Out for Delivery\n  D. Delivered");
              stdout.write("Enter choice (A/B/C/D): ");
              String? statusChoice = stdin.readLineSync()?.toUpperCase();

              // Conditional update using logical assignment operators
              if (statusChoice == "A") {
                statuses[i] = "Processing";
              } else if (statusChoice == "B") {
                statuses[i] = "In Transit";
              } else if (statusChoice == "C") {
                statuses[i] = "Out for Delivery";
              } else if (statusChoice == "D") {
                statuses[i] = "Delivered";
              } else {
                print("⚠️ Invalid status selection. No changes made.");
                break;
              }
              print("✅ Status successfully updated to: ${statuses[i]}");
              break;
            }
          }
          if (!found) {
            print("❌ Shipment ID $updateId not found.");
          }
        }
        break;

      // 4. ADD NEW SHIPMENT
      case "4":
        stdout.write("Enter New Shipment ID (Numeric): ");
        int? newId = int.tryParse(stdin.readLineSync() ?? "");
        
        stdout.write("Enter Destination: ");
        String? newDest = stdin.readLineSync();
        
        stdout.write("Enter Weight (kg): ");
        double? newWeight = double.tryParse(stdin.readLineSync() ?? "");

        // Logical AND operator (&&) to validate multiple conditions at once
        if (newId != null && newDest != null && newDest.isNotEmpty && newWeight != null) {
          // Check if ID already exists
          bool duplicate = false;
          for (int id in shipmentIds) {
            if (id == newId) {
              duplicate = true;
              break;
            }
          }

          if (duplicate) {
            print("❌ Error: A shipment with ID $newId already exists.");
          } else {
            // Appending data to lists
            shipmentIds.add(newId);
            destinations.add(newDest);
            statuses.add("Processing"); // Default baseline status
            weights.add(newWeight);
            print("✅ Shipment $newId successfully added!");
          }
        } else {
          print("❌ Invalid entries. Unable to create shipment.");
        }
        break;

      // 5. CALCULATE TOTAL WEIGHT
      case "5":
        double totalWeight = 0.0;
        // Arithmetic compounding assignment operator (+=) inside a loop
        for (double w in weights) {
          totalWeight += w;
        }
        print("\n⚖️ Total weight of all shipments in system: $totalWeight kg");
        break;

      // 6. EXIT
      case "6":
        print("Exiting system. Goodbye!");
        running = false; // Flags the while loop to terminate naturally
        break;

      // DEFAULT FALLBACK FOR UNRECOGNIZED INPUTS
      default:
        print("❌ Invalid menu option. Please select 1 through 6.");
    }
  }
}
