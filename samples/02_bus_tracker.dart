import 'dart:io';

void main() {
  // Parallel lists mapping Bus Routes to specific Stops and minutes remaining (ETA)
  List<String> busNumbers = ["Line 42", "Line 101", "Line 42", "Line 7B", "Line 101"];
  List<String> stopNames = ["Downtown", "Central Station", "West Suburbs", "Downtown", "Downtown"];
  List<int> arrivalTimes =; // ETA in minutes

  bool active = true;

  print("=== Welcome to the City Bus Stop Tracker ===");

  // Primary loop to keep the console interface alive
  while (active) {
    print("\n--- BUS TRACKER MENU ---");
    print("1. View All Active Buses");
    print("2. Search Buses by Stop Name");
    print("3. Update Bus Arrival Times (Simulate Time Progress)");
    print("4. Add a Bus to a Stop Schedule");
    print("5. Check Next Closest Bus (Any Stop)");
    print("6. Exit");
    stdout.write("Enter your choice (1-6): ");

    String? menuChoice = stdin.readLineSync();

    switch (menuChoice) {
      
      // 1. VIEW ALL SCHEDULES
      case "1":
        print("\n--- Current Bus Schedule Matrix ---");
        if (busNumbers.isEmpty) {
          print("No buses are currently scheduled.");
        } else {
          // Classic loop iterating over list length
          for (int i = 0; i < busNumbers.length; i++) {
            print("${busNumbers[i]} | Stop: ${stopNames[i]} | Arriving in: ${arrivalTimes[i]} mins");
          }
        }
        break;

      // 2. SEARCH BUSES BY STOP NAME
      case "2":
        stdout.write("Enter Stop Name to look up (e.g., Downtown): ");
        String? searchStop = stdin.readLineSync()?.trim();

        if (searchStop == null || searchStop.isEmpty) {
          print("❌ Invalid input. Stop name cannot be blank.");
        } else {
          bool stopFound = false;
          print("\n🚏 Live Board for stop: '$searchStop'");
          
          for (int i = 0; i < stopNames.length; i++) {
            // Relational operator case-insensitive check
            if (stopNames[i].toLowerCase() == searchStop.toLowerCase()) {
              print(" - ${busNumbers[i]} arriving in ${arrivalTimes[i]} minutes.");
              stopFound = true;
            }
          }
          
          if (!stopFound) {
            print("No buses are currently heading to '$searchStop'.");
          }
        }
        break;

      // 3. SIMULATE TIME PROGRESSION (UPDATE ETAs)
      case "3":
        stdout.write("How many minutes have passed? ");
        int? minutesPassed = int.tryParse(stdin.readLineSync() ?? "");

        if (minutesPassed == null || minutesPassed <= 0) {
          print("❌ Invalid value. Please enter a positive number of minutes.");
        } else {
          print("\n⏱️ Advancing time by $minutesPassed minutes...");
          
          // Loop backward to allow safe modification/removal if a bus reaches 0
          for (int i = busNumbers.length - 1; i >= 0; i--) {
            // Shorthand subtraction arithmetic operator
            arrivalTimes[i] -= minutesPassed;

            // Conditional testing if the bus already passed the stop
            if (arrivalTimes[i] <= 0) {
              print("🚌 ${busNumbers[i]} has departed from ${stopNames[i]}.");
              // Remove records across all lists to preserve index alignment
              busNumbers.removeAt(i);
              stopNames.removeAt(i);
              arrivalTimes.removeAt(i);
            }
          }
          print("✅ Schedules updated.");
        }
        break;

      // 4. ADD NEW BUS TO ROUTE
      case "4":
        stdout.write("Enter Bus Line Code (e.g., Line 14): ");
        String? newBus = stdin.readLineSync();

        stdout.write("Enter Target Stop Name: ");
        String? newStop = stdin.readLineSync();

        stdout.write("Enter ETA (Minutes until arrival): ");
        int? newEta = int.tryParse(stdin.readLineSync() ?? "");

        // Logical verification block using operator structures
        if (newBus != null && newBus.isNotEmpty && 
            newStop != null && newStop.isNotEmpty && 
            newEta != null && newEta > 0) {
          
          busNumbers.add(newBus);
          stopNames.add(newStop);
          arrivalTimes.add(newEta);
          print("✅ Successfully scheduled $newBus to stop at '$newStop'.");
        } else {
          print("❌ Input validation failed. Bus route not saved.");
        }
        break;

      // 5. FIND NEXT CLOSEST BUS
      case "5":
        if (arrivalTimes.isEmpty) {
          print("No active buses on the grid.");
        } else {
          int minIndex = 0;
          
          // Standard tracking logic loops to identify minimum value
          for (int i = 1; i < arrivalTimes.length; i++) {
            if (arrivalTimes[i] < arrivalTimes[minIndex]) {
              minIndex = i;
            }
          }
          print("\n🚨 Next upcoming arrival:");
          print("Bus: ${busNumbers[minIndex]} at Stop: ${stopNames[minIndex]} (${arrivalTimes[minIndex]} mins away)");
        }
        break;

      // 6. QUIT
      case "6":
        print("Shutting down tracker. Safe travels!");
        active = false; // Breaks out of while condition loop execution
        break;

      default:
        print("❌ Invalid menu choice. Enter a number between 1 and 6.");
    }
  }
}
