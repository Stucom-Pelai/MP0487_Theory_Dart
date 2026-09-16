import 'dart:io';

void main() {
  // Parallel lists mapping Room properties to their current booking status
  List<int> roomNumbers =;
  List<String> roomTypes = ["Single", "Double", "Suite", "Double", "Penthouse"];
  List<double> nightlyRates = [75.0, 120.0, 250.0, 130.0, 500.0];
  List<bool> isOccupied = [false, true, false, false, true];
  List<String> guestNames = ["None", "Alice Smith", "None", "None", "Bob Jones"];

  bool operational = true;

  print("=== Welcome to the Grand Horizon Hotel Management System ===");

  // Primary loop to maintain the administrative dashboard
  while (operational) {
    print("\n--- FRONT DESK MENU ---");
    print("1. View All Rooms Status");
    print("2. Book/Check-In a Guest");
    print("3. Check-Out a Guest (Generate Bill)");
    print("4. Filter Available Rooms by Budget");
    print("5. Calculate Current Total Revenue Potential");
    print("6. Exit");
    stdout.write("Enter command (1-6): ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      
      // 1. VIEW ALL ROOMS STATUS
      case "1":
        print("\n--- Room Status Directory ---");
        for (int i = 0; i < roomNumbers.length; i++) {
          // Conditional ternary logic simulated via standard if/else
          String status = "AVAILABLE";
          if (isOccupied[i]) {
            status = "OCCUPIED (Guest: ${guestNames[i]})";
          }
          print("Room ${roomNumbers[i]} [${roomTypes[i]}] - \$${nightlyRates[i]}/night | Status: $status");
        }
        break;

      // 2. CHECK-IN A GUEST
      case "2":
        stdout.write("Enter Room Number to book: ");
        int? targetRoom = int.tryParse(stdin.readLineSync() ?? "");

        if (targetRoom == null) {
          print("❌ Invalid entry. Room must be a number.");
        } else {
          bool roomFound = false;
          for (int i = 0; i < roomNumbers.length; i++) {
            if (roomNumbers[i] == targetRoom) {
              roomFound = true;
              
              // Relational operator checking if the room is taken
              if (isOccupied[i]) {
                print("❌ Sorry, Room $targetRoom is already occupied by ${guestNames[i]}.");
              } else {
                stdout.write("Enter Guest Name: ");
                String? clientName = stdin.readLineSync()?.trim();
                
                if (clientName != null && clientName.isNotEmpty) {
                  isOccupied[i] = true;
                  guestNames[i] = clientName;
                  print("✅ Success! Room $targetRoom is now checked-in to $clientName.");
                } else {
                  print("❌ Guest name cannot be empty.");
                }
              }
              break; // Stop looking through the list
            }
          }
          if (!roomFound) {
            print("❌ Room number $targetRoom does not exist in our hotel.");
          }
        }
        break;

      // 3. CHECK-OUT A GUEST & COMPUTE BILL
      case "3":
        stdout.write("Enter Room Number checking out: ");
        int? checkoutRoom = int.tryParse(stdin.readLineSync() ?? "");

        if (checkoutRoom == null) {
          print("❌ Invalid room configuration.");
        } else {
          bool roomFound = false;
          for (int i = 0; i < roomNumbers.length; i++) {
            if (roomNumbers[i] == checkoutRoom) {
              roomFound = true;

              if (!isOccupied[i]) {
                print("⚠️ Room $checkoutRoom is already empty. No checkout needed.");
              } else {
                stdout.write("How many nights did they stay? ");
                int? nights = int.tryParse(stdin.readLineSync() ?? "");

                if (nights != null && nights > 0) {
                  // Arithmetic multiplication operator to calculate invoice total
                  double totalBill = nightlyRates[i] * nights;
                  
                  print("\n🧾 --- INVOICE ---");
                  print("Guest: ${guestNames[i]}");
                  print("Room: ${roomNumbers[i]} (${roomTypes[i]})");
                  print("Total Stay: $nights nights x \$${nightlyRates[i]}");
                  print("Amount Due: \$${totalBill.toStringAsFixed(2)}");
                  print("-------------------");

                  // Reset room parameters to baseline empty state
                  isOccupied[i] = false;
                  guestNames[i] = "None";
                  print("✅ Checkout complete. Room $checkoutRoom is now clean and available.");
                } else {
                  print("❌ Invalid number of nights. Checkout canceled.");
                }
              }
              break;
            }
          }
          if (!roomFound) {
            print("❌ Room $checkoutRoom not found.");
          }
        }
        break;

      // 4. FILTER AVAILABLE ROOMS BY BUDGET
      case "4":
        stdout.write("Enter maximum nightly price comfort limit (\$): ");
        double? maxBudget = double.tryParse(stdin.readLineSync() ?? "");

        if (maxBudget == null || maxBudget <= 0) {
          print("❌ Please enter a realistic budget figure.");
        } else {
          print("\n💸 Matches under \$${maxBudget.toStringAsFixed(2)} that are currently open:");
          bool matchFound = false;

          for (int i = 0; i < roomNumbers.length; i++) {
            // Logical operator AND (&&) to evaluate status and price thresholds simultaneously
            if (!isOccupied[i] && nightlyRates[i] <= maxBudget) {
              print(" - Room ${roomNumbers[i]} (${roomTypes[i]}) at \$${nightlyRates[i]}/night");
              matchFound = true;
            }
          }

          if (!matchFound) {
            print("No matching available rooms found within your budget range.");
          }
        }
        break;

      // 5. CALCULATE TOTAL POTENTIAL OVERNIGHT REVENUE
      case "5":
        double totalHotelValue = 0.0;
        double activeRevenue = 0.0;

        for (int i = 0; i < roomNumbers.length; i++) {
          totalHotelValue += nightlyRates[i];
          if (isOccupied[i]) {
            activeRevenue += nightlyRates[i];
          }
        }

        print("\n💰 --- Financial State ---");
        print("Live Nightly Revenue (Occupied Rooms): \$${activeRevenue.toStringAsFixed(2)}");
        print("Maximum Potential Value (All Rooms Booked): \$${totalHotelValue.toStringAsFixed(2)}");
        break;

      // 6. QUIT
      case "6":
        print("Closing the reception terminal... Good night.");
        operational = false;
        break;

      default:
        print("❌ Unknown command selection. Retrying menu pipeline.");
    }
  }
}
