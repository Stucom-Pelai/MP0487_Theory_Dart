import 'dart:io';

void main() {
  // Parallel lists mapping parking spot details
  List<int> spotNumbers =;
  List<String> spotTypes = ["Standard", "Compact", "EV Charging", "Standard", "Handicap"];
  List<bool> isOccupied = [false, true, false, false, true];
  List<String> licensePlates = ["None", "ABC-1234", "None", "None", "XYZ-9876"];
  List<int> entryHours =; // Mocked entry hour (24-hour clock, e.g., 2 = 2 AM)

  double hourlyRate = 3.50; // Flat fee per hour
  bool systemActive = true;

  print("=== Welcome to the Smart Parking Lot Terminal ===");

  // Primary loop to keep the terminal running
  while (systemActive) {
    print("\n--- PARKING TERMINAL MENU ---");
    print("1. View Parking Lot Layout");
    print("2. Park a Car (Check-In)");
    print("3. Retrieve Car & Pay (Check-Out)");
    print("4. Find Free Spots by Type (EV, Handicap, etc.)");
    print("5. Exit System");
    stdout.write("Select an option (1-5): ");

    String? choice = stdin.readLineSync();

    switch (choice) {
      
      // 1. VIEW PARKING LOT LAYOUT
      case "1":
        print("\n--- Live Parking Map ---");
        int totalFree = 0;

        for (int i = 0; i < spotNumbers.length; i++) {
          String status = "🟢 AVAILABLE";
          if (isOccupied[i]) {
            status = "🔴 OCCUPIED [Car: ${licensePlates[i]}]";
          } else {
            totalFree++;
          }
          print("Spot ${spotNumbers[i]} (${spotTypes[i]}) -> $status");
        }
        print("Summary: $totalFree out of ${spotNumbers.length} spots are available.");
        break;

      // 2. PARK A CAR (CHECK-IN)
      case "2":
        stdout.write("Enter Spot Number to park in: ");
        int? targetedSpot = int.tryParse(stdin.readLineSync() ?? "");

        if (targetedSpot == null) {
          print("❌ Invalid entry. Spot must be a number.");
        } else {
          bool spotFound = false;
          for (int i = 0; i < spotNumbers.length; i++) {
            if (spotNumbers[i] == targetedSpot) {
              spotFound = true;

              if (isOccupied[i]) {
                print("❌ Spot $targetedSpot is already taken!");
              } else {
                stdout.write("Enter Car License Plate: ");
                String? plate = stdin.readLineSync()?.trim().toUpperCase();

                stdout.write("Enter Current Hour (0-23): ");
                int? currentHour = int.tryParse(stdin.readLineSync() ?? "");

                // Logic verification using operators (&&, >=, <=)
                if (plate != null && plate.isNotEmpty && currentHour != null && currentHour >= 0 && currentHour < 24) {
                  isOccupied[i] = true;
                  licensePlates[i] = plate;
                  entryHours[i] = currentHour;
                  print("✅ Car '$plate' successfully parked in Spot $targetedSpot at hour $currentHour:00.");
                } else {
                  print("❌ Invalid plate or invalid 24-hour timestamp.");
                }
              }
              break; 
            }
          }
          if (!spotFound) {
            print("❌ Parking Spot $targetedSpot does not exist.");
          }
        }
        break;

      // 3. RETRIEVE CAR & PAY (CHECK-OUT)
      case "3":
        stdout.write("Enter License Plate or Spot Number to leave: ");
        String? input = stdin.readLineSync()?.trim().toUpperCase();

        if (input == null || input.isEmpty) {
          print("❌ Input cannot be empty.");
        } else {
          bool carFound = false;
          int? inputAsSpot = int.tryParse(input);

          for (int i = 0; i < spotNumbers.length; i++) {
            // Check match via either spot number OR license plate
            if ((inputAsSpot != null && spotNumbers[i] == inputAsSpot) || (licensePlates[i].toUpperCase() == input)) {
              carFound = true;

              if (!isOccupied[i]) {
                print("⚠️ Spot ${spotNumbers[i]} is already empty.");
              } else {
                stdout.write("Enter Current Departure Hour (0-23): ");
                int? exitHour = int.tryParse(stdin.readLineSync() ?? "");

                if (exitHour != null && exitHour >= 0 && exitHour < 24) {
                  // Standard math tracking for duration
                  int hoursParked = exitHour - entryHours[i];

                  // Handle overnight edge cases if duration calculation dips negative
                  if (hoursParked <= 0) {
                    hoursParked += 24; 
                  }

                  // Arithmetic multiplication operator to determine total cost
                  double totalFee = hoursParked * hourlyRate;

                  print("\n🧾 --- PARKING RECEIPT ---");
                  print("Car Plate: ${licensePlates[i]}");
                  print("Spot Used: ${spotNumbers[i]} (${spotTypes[i]})");
                  print("Time Parked: From ${entryHours[i]}:00 to $exitHour:00 ($hoursParked hours)");
                  print("Rate: \$${hourlyRate.toStringAsFixed(2)} / hr");
                  print("Total Fee Due: \$${totalFee.toStringAsFixed(2)}");
                  print("--------------------------");

                  // Reset structural values back to factory default states
                  isOccupied[i] = false;
                  licensePlates[i] = "None";
                  entryHours[i] = 0;
                  print("✅ Payment processed. Spot ${spotNumbers[i]} is now vacant.");
                } else {
                  print("❌ Invalid exit hour. Transaction canceled.");
                }
              }
              break;
            }
          }
          if (!carFound) {
            print("❌ No active parked car matches standard identifier: '$input'.");
          }
        }
        break;

      // 4. FILTER FREE SPOTS BY TYPE
      case "4":
        print("\nSelect Type to Filter:\n1. Standard\n2. Compact\n3. EV Charging\n4. Handicap");
        stdout.write("Enter choice (1-4): ");
        String? filterChoice = stdin.readLineSync();
        
        String targetType = "";
        if (filterChoice == "1") targetType = "Standard";
        else if (filterChoice == "2") targetType = "Compact";
        else if (filterChoice == "3") targetType = "EV Charging";
        else if (filterChoice == "4") targetType = "Handicap";

        if (targetType.isEmpty) {
          print("❌ Invalid selection choice.");
        } else {
          print("\n🔍 Available '$targetType' spots:");
          bool matchFound = false;

          for (int i = 0; i < spotNumbers.length; i++) {
            // Logical operator combining conditions
            if (!isOccupied[i] && spotTypes[i] == targetType) {
              print(" - Spot ${spotNumbers[i]}");
              matchFound = true;
            }
          }

          if (!matchFound) {
            print("No open slots found for category: $targetType.");
          }
        }
        break;

      // 5. EXIT SYSTEM
      case "5":
        print("Shutting down the parking grid database. Goodbye!");
        systemActive = false;
        break;

      default:
        print("❌ Invalid action item. Use keys 1 through 5.");
    }
  }
}
