import 'dart:io';
import 'config.dart';

void main() {
  // Parallel lists mapping Room properties to their current booking status
  List<int> roomNumbers = [101, 102, 103, 104, 105];
  List<String> roomTypes = ["Single", "Double", "Suite", "Double", "Penthouse"];
  List<double> nightlyRates = [75.0, 120.0, 250.0, 130.0, 500.0];
  List<bool> isOccupied = [false, true, false, false, true];
  List<String> guestNames = ["None", "Alice Smith", "None", "None", "Bob Jones"];

  bool operational = true;

  print(HotelConfig.welcomeMsg);

  // Primary loop to maintain the administrative dashboard
  while (operational) {
    print("\n${HotelConfig.menuHeader}");
    print(HotelConfig.option1);
    print(HotelConfig.option2);
    print(HotelConfig.option3);
    print(HotelConfig.option4);
    print(HotelConfig.option5);
    print(HotelConfig.option6);
    stdout.write(HotelConfig.selectPrompt);

    String? choice = stdin.readLineSync();

    switch (choice) {
      
      // 1. VIEW ALL ROOMS STATUS
      case "1":
        print("\n${HotelConfig.roomHeader}");
        for (int i = 0; i < roomNumbers.length; i++) {
          // Conditional ternary logic simulated via standard if/else
          String status = HotelConfig.availableStatus;
          if (isOccupied[i]) {
            status = "${HotelConfig.occupiedStatus}${guestNames[i]})";}
          print("${HotelConfig.roomFormat}${roomNumbers[i]}${HotelConfig.roomTypeFormat}${roomTypes[i]}${HotelConfig.rateFormat}${nightlyRates[i]}${HotelConfig.nightLabel}$status");
        }
        break;

      // 2. CHECK-IN A GUEST
      case "2":
        stdout.write(HotelConfig.bookPrompt);
        int? targetRoom = int.tryParse(stdin.readLineSync() ?? "");

        if (targetRoom == null) {
          print(HotelConfig.invalidInputMsg);
        } else {
          bool roomFound = false;
          for (int i = 0; i < roomNumbers.length; i++) {
            if (roomNumbers[i] == targetRoom) {
              roomFound = true;
              
              // Relational operator checking if the room is taken
              if (isOccupied[i]) {
                print("${HotelConfig.occupiedMsg}$targetRoom${HotelConfig.occupiedByMsg}${guestNames[i]}.");
              } else {
                stdout.write(HotelConfig.guestPrompt);
                String? clientName = stdin.readLineSync()?.trim();
                
                if (clientName != null && clientName.isNotEmpty) {
                  isOccupied[i] = true;
                  guestNames[i] = clientName;
                  print("${HotelConfig.checkInSuccessMsg}$targetRoom${HotelConfig.checkInToMsg}$clientName.");
                } else {
                  print(HotelConfig.emptyNameMsg);
                }
              }
              break; // Stop looking through the list
            }
          }
          if (!roomFound) {
            print("${HotelConfig.roomNotFoundMsg}$targetRoom${HotelConfig.doesNotExistMsg}");
          }
        }
        break;

      // 3. CHECK-OUT A GUEST & COMPUTE BILL
      case "3":
        stdout.write(HotelConfig.checkoutPrompt);
        int? checkoutRoom = int.tryParse(stdin.readLineSync() ?? "");

        if (checkoutRoom == null) {
          print(HotelConfig.invalidConfigMsg);
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
            print("${HotelConfig.notFoundMsg}$checkoutRoom${HotelConfig.roomNotExistMsg}");
          }
        }
        break;

      // 4. FILTER AVAILABLE ROOMS BY BUDGET
      case "4":
        stdout.write(HotelConfig.budgetPrompt);
        double? maxBudget = double.tryParse(stdin.readLineSync() ?? "");

        if (maxBudget == null || maxBudget <= 0) {
          print(HotelConfig.budgetErrorMsg);
        } else {
          print("\n${HotelConfig.budgetResultMsg}${maxBudget.toStringAsFixed(2)}${HotelConfig.openMsg}");
          bool matchFound = false;

          for (int i = 0; i < roomNumbers.length; i++) {
            // Logical operator AND (&&) to evaluate status and price thresholds simultaneously
            if (!isOccupied[i] && nightlyRates[i] <= maxBudget) {
              print("${HotelConfig.roomResultFormat}${roomNumbers[i]}${HotelConfig.roomTypeResultMsg}${roomTypes[i]}${HotelConfig.rateResultMsg}${nightlyRates[i]}/night");
              matchFound = true;
            }
          }

          if (!matchFound) {
            print(HotelConfig.noMatchMsg);
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

        print("\n${HotelConfig.financialHeader}");
        print("${HotelConfig.occupiedRevenueMsg}${activeRevenue.toStringAsFixed(2)}");
        print("${HotelConfig.maxRevenueMsg}${totalHotelValue.toStringAsFixed(2)}");
        break;

      // 6. QUIT
      case "6":
        print(HotelConfig.exitMsg);
        operational = false;
        break;

      default:
        print(HotelConfig.unknownCommandMsg);
    }
  }
}
