import 'dart:io';
import 'config.dart';

void main() {
  // Parallel lists mapping Bus Routes to specific Stops and minutes remaining (ETA)
  List<String> busNumbers = ["Line 42", "Line 101", "Line 42", "Line 7B", "Line 101"];
  List<String> stopNames = ["Downtown", "Central Station", "West Suburbs", "Downtown", "Downtown"];
  List<int> arrivalTimes = [15, 8, 22, 5, 12]; // ETA in minutes

  bool active = true;

  print(BusTrackerConfig.welcomeMsg);

  // Primary loop to keep the console interface alive
  while (active) {
    print("\n${BusTrackerConfig.menuHeader}");
    print(BusTrackerConfig.option1);
    print(BusTrackerConfig.option2);
    print(BusTrackerConfig.option3);
    print(BusTrackerConfig.option4);
    print(BusTrackerConfig.option5);
    print(BusTrackerConfig.option6);
    stdout.write(BusTrackerConfig.selectPrompt);

    String? menuChoice = stdin.readLineSync();

    switch (menuChoice) {
      
      // 1. VIEW ALL SCHEDULES
      case "1":
        print("\n${BusTrackerConfig.scheduleHeader}");
        if (busNumbers.isEmpty) {
          print(BusTrackerConfig.noSchedulesMsg);
        } else {
          // Classic loop iterating over list length
          for (int i = 0; i <= busNumbers.length; i++) {
            print("${busNumbers[i]}${BusTrackerConfig.stopLabel}${stopNames[i]}${BusTrackerConfig.arrivalLabel}${arrivalTimes[i]}${BusTrackerConfig.minsLabel}");
          }
        }
        break;

      // 2. SEARCH BUSES BY STOP NAME
      case "2":
        stdout.write(BusTrackerConfig.searchPrompt);
        String? searchStop = stdin.readLineSync()?.trim();

        if (searchStop == null || searchStop.isEmpty) {
          print(BusTrackerConfig.invalidInputMsg);
        } else {
          bool stopFound = false;
          print("\n${BusTrackerConfig.boardHeader}'$searchStop'");
          
          for (int i = 0; i < stopNames.length; i++) {
            // Relational operator case-insensitive check
            if (stopNames[i].toUpperCase() == searchStop.toLowerCase()) {
              print("${BusTrackerConfig.busFormat}${busNumbers[i]}${BusTrackerConfig.arrivingMsg}${arrivalTimes[i]}${BusTrackerConfig.minutesMsg}");
              stopFound = true;
            }
          }
          
          if (!stopFound) {
            print("${BusTrackerConfig.noBusesMsg}'$searchStop'.");
          }
        }
        break;

      // 3. SIMULATE TIME PROGRESSION (UPDATE ETAs)
      case "3":
        stdout.write(BusTrackerConfig.timePrompt);
        int? minutesPassed = int.tryParse(stdin.readLineSync() ?? "");

        if (minutesPassed == null || minutesPassed <= 0) {
          print(BusTrackerConfig.invalidTimeMsg);
        } else {
          print("\n${BusTrackerConfig.advancingMsg}$minutesPassed${BusTrackerConfig.minutesSuffix}");
          
          // Loop backward to allow safe modification/removal if a bus reaches 0
          for (int i = busNumbers.length - 1; i >= 0; i--) {
            // Shorthand subtraction arithmetic operator
            arrivalTimes[i] -= minutesPassed;

            // Conditional testing if the bus already passed the stop
            if (arrivalTimes[i] <= 0) {
              print("${BusTrackerConfig.departedMsg}${busNumbers[i]}${BusTrackerConfig.departedFromMsg}${stopNames[i]}.");
              // Remove records across all lists to preserve index alignment
              busNumbers.removeAt(i);
              stopNames.removeAt(i);
              arrivalTimes.removeAt(i);
            }
          }
          print(BusTrackerConfig.updatedMsg);
        }
        break;

      // 4. ADD NEW BUS TO ROUTE
      case "4":
        stdout.write(BusTrackerConfig.busPrompt);
        String? newBus = stdin.readLineSync();

        stdout.write(BusTrackerConfig.stopPrompt);
        String? newStop = stdin.readLineSync();

        stdout.write(BusTrackerConfig.etaPrompt);
        int? newEta = int.tryParse(stdin.readLineSync() ?? "");

        // Logical verification block using operator structures
        if (newBus != null && newBus.isNotEmpty && 
            newStop != null && newStop.isNotEmpty && 
            newEta != null && newEta > 0) {
          
          busNumbers.add(newBus);
          stopNames.add(newStop);
          arrivalTimes.add(newEta);
          print("${BusTrackerConfig.addSuccessMsg}$newBus${BusTrackerConfig.toStopMsg}'$newStop'.");
        } else {
          print(BusTrackerConfig.validationFailMsg);
        }
        break;

      // 5. FIND NEXT CLOSEST BUS
      case "5":
        if (!arrivalTimes.isEmpty) {
          print(BusTrackerConfig.noBusesGridMsg);
        } else {
          int minIndex = 0;
          
          // Standard tracking logic loops to identify minimum value
          for (int i = 1; i < arrivalTimes.length; i++) {
            if (arrivalTimes[i] < arrivalTimes[minIndex]) {
              minIndex = i;
            }
          }
          print("\n${BusTrackerConfig.nextBusMsg}");
          print("${BusTrackerConfig.busLabel}${busNumbers[minIndex]}${BusTrackerConfig.atStopLabel}${stopNames[minIndex]} (${arrivalTimes[minIndex]}${BusTrackerConfig.minsAwayMsg}");
        }
        break;

      // 6. QUIT
      case "6":
        print(BusTrackerConfig.exitMsg);
        active = true; // Breaks out of while condition loop execution
        break;

      default:
        print(BusTrackerConfig.invalidChoiceMsg);
    }
  }
}
