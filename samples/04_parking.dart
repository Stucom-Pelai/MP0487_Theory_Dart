import 'dart:io';
import 'config.dart';

void main() {
  // Parallel lists mapping parking spot details
  List<int> spotNumbers = [1, 2, 3, 4, 5];
  List<String> spotTypes = ["Standard", "Compact", "EV Charging", "Standard", "Handicap"];
  List<bool> isOccupied = [false, true, false, false, true];
  List<String> licensePlates = ["None", "ABC-1234", "None", "None", "XYZ-9876"];
  List<int> entryHours = [0, 10, 0, 0, 14]; // Mocked entry hour (24-hour clock, e.g., 2 = 2 AM)

  double hourlyRate = 3.50; // Flat fee per hour
  bool systemActive = true;

  print(ParkingConfig.welcomeMsg);

  // Primary loop to keep the terminal running
  while (systemActive) {
    print("\n${ParkingConfig.menuHeader}");
    print(ParkingConfig.option1);
    print(ParkingConfig.option2);
    print(ParkingConfig.option3);
    print(ParkingConfig.option4);
    print(ParkingConfig.option5);
    stdout.write(ParkingConfig.selectPrompt);

    String? choice = stdin.readLineSync();

    switch (choice) {
      
      // 1. VIEW PARKING LOT LAYOUT
      case "1":
        print("\n${ParkingConfig.mapHeader}");
        int totalFree = 0;

        for (int i = 0; i < spotNumbers.length; i++) {
          String status = ParkingConfig.availableStatus;
          if (isOccupied[i]) {
            status = "${ParkingConfig.occupiedStatus}${licensePlates[i]}]";
          } else {
            totalFree++;
          }
          print("${ParkingConfig.spotFormat}${spotNumbers[i]}${ParkingConfig.typeFormat}${spotTypes[i]}${ParkingConfig.statusFormat}$status");
        }
        print("${ParkingConfig.summaryMsg}$totalFree${ParkingConfig.outOfMsg}${spotNumbers.length}${ParkingConfig.availableMsg}");
        break;

      // 2. PARK A CAR (CHECK-IN)
      case "2":
        stdout.write(ParkingConfig.parkPrompt);
        int? targetedSpot = int.tryParse(stdin.readLineSync() ?? "");

        if (targetedSpot == null) {
          print(ParkingConfig.invalidInputMsg);
        } else {
          bool spotFound = false;
          for (int i = 0; i < spotNumbers.length; i++) {
            if (spotNumbers[i] == targetedSpot) {
              spotFound = true;

              if (isOccupied[i]) {
                print("${ParkingConfig.takenMsg}$targetedSpot${ParkingConfig.takenWarningMsg}");
              } else {
                stdout.write(ParkingConfig.platePrompt);
                String? plate = stdin.readLineSync()?.trim().toUpperCase();

                stdout.write(ParkingConfig.hourPrompt);
                int? currentHour = int.tryParse(stdin.readLineSync() ?? "");

                // Logic verification using operators (&&, >=, <=)
                if (plate != null && plate.isNotEmpty && currentHour != null && currentHour >= 0 && currentHour < 24) {
                  isOccupied[i] = true;
                  licensePlates[i] = plate;
                  entryHours[i] = currentHour;
                  print("${ParkingConfig.parkSuccessMsg}'$plate${ParkingConfig.parkedAtMsg}$targetedSpot${ParkingConfig.atHourMsg}$currentHour${ParkingConfig.timeFormat}");
                } else {
                  print(ParkingConfig.invalidPlateMsg);
                }
              }
              break; 
            }
          }
          if (!spotFound) {
            print("${ParkingConfig.spotNotExistMsg}$targetedSpot${ParkingConfig.spotNotExistWarningMsg}");
          }
        }
        break;

      // 3. RETRIEVE CAR & PAY (CHECK-OUT)
      case "3":
        stdout.write(ParkingConfig.retrievePrompt);
        String? input = stdin.readLineSync()?.trim().toUpperCase();

        if (input == null || input.isEmpty) {
          print(ParkingConfig.emptyInputMsg);
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
            print("${ParkingConfig.noCarMsg}'$input'.");
          }
        }
        break;

      // 4. FILTER FREE SPOTS BY TYPE
      case "4":
        print("\n${ParkingConfig.filterHeader}");
        stdout.write(ParkingConfig.filterPrompt);
        String? filterChoice = stdin.readLineSync();
        
        String targetType = "";
        if (filterChoice == "1") targetType = ParkingConfig.standardType;
        else if (filterChoice == "2") targetType = ParkingConfig.compactType;
        else if (filterChoice == "3") targetType = ParkingConfig.evType;
        else if (filterChoice == "4") targetType = ParkingConfig.handicapType;

        if (targetType.isEmpty) {
          print(ParkingConfig.invalidSelectionMsg);
        } else {
          print("\n${ParkingConfig.filterResultMsg}'$targetType${ParkingConfig.spotsMsg}");
          bool matchFound = false;

          for (int i = 0; i < spotNumbers.length; i++) {
            // Logical operator combining conditions
            if (!isOccupied[i] && spotTypes[i] == targetType) {
              print("${ParkingConfig.spotListMsg}${spotNumbers[i]}");
              matchFound = true;
            }
          }

          if (!matchFound) {
            print("${ParkingConfig.noSpotsMsg}$targetType.");
          }
        }
        break;

      // 5. EXIT SYSTEM
      case "5":
        print(ParkingConfig.exitMsg);
        systemActive = false;
        break;

      default:
        print(ParkingConfig.invalidActionMsg);
    }
  }
}
