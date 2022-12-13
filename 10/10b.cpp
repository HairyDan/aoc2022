#include <fstream>
#include <iostream>
#include <map>
#include <string>
#include <string_view>

// void print_map(std::string_view comment, const std::map<std::string, int>& m)
// {
//     std::cout << comment;
//     // iterate using C++17 facilities
//     for (const auto& [key, value] : m)
//         std::cout << '[' << key << "] = " << value << "; ";

// // C++11 alternative:
// //  for (const auto& n : m)
// //      std::cout << n.first << " = " << n.second << "; ";
// //
// // C++98 alternative
// //  for (std::map<std::string, int>::const_iterator it = m.begin(); it !=
// m.end(); it++)
// //      std::cout << it->first << " = " << it->second << "; ";

//     std::cout << '\n';
// }

int main() {
  std::map<int, signed int> cycleValues = {
      {1, 1},
  };

  // Read in the instructions
  std::string instructions;
  std::ifstream inputFile("input.txt");

  if (inputFile.is_open()) {
    std::string line;
    while (getline(inputFile, line)) {
      instructions += line + "\n";
    }
    inputFile.close();
  }

  // Initialize the X register to the starting value of 1
  int x = 1;

  // Initialize the signal strength
  int signal = 0;
  int totalAnswerSignal = 0;

  int isNeg = 1;
  int cycle = 0;

  // Loop through each instruction
  for (int i = 0; i < instructions.length(); i++) {
    isNeg = 1;
    cycle++;

    // Check what instruction it is
    if (instructions[i] == 'a') {
      // Read in the next two characters to get the value of V
      int v = 0;
      if (instructions[i + 5] == '-') {
        isNeg = -1;
        i += 6;
      } else {
        i += 5;
      }
      int tens = (instructions[i] - '0');
      if (isdigit(instructions.at(i + 1))) {
        v = (tens * 10) + (instructions[i + 1] - '0');
        i += 1;
      } else {
        v = tens;
      }

      v = v * isNeg;

      std::cout << v << std::endl;
      // Add the value to the X register

      x += v;
      cycleValues[cycle + 2] = x;
    } else if (instructions[i] == 'n') {
      // Noop instruction, do nothing
      i += 4;
    }
    // Check if the current cycle is either the 20th, 60th, 100th, 140th, 180th,
    // or 220th
  }

  // Print out the total signal strength
  // print_map("cycleValues: ", cycleValues);

  // print the map
  for (auto itr = cycleValues.begin(); itr != cycleValues.end(); itr++) {
    std::cout << itr->first << " : " << itr->second << std::endl;
  }


  std::string crtOutput = "";
  int valueOffset = 0; // RIP
  
  for (int i = 0; i < 240; i++) {
    if (cycleValues.count(i+1) != 0) {
      signal = cycleValues[i+1];
    }
    
    // Check if the current cycle is either the 20th, 60th, 100th, 140th, 180th,
    // or 220th
    if (i == 20 || i == 60 || i == 100 || i == 140 || i == 180 || i == 220) {
      totalAnswerSignal += signal * i;
    }

    // is this fucked
    if (signal + valueOffset <= i+1 && signal + valueOffset >= i-1 ) {
      crtOutput += "#";
    } else {
      crtOutput += ".";
    }
    if (i == 39 || i == 79 || i == 119 || i == 159 || i == 199 || i == 239) {
      crtOutput += "\n";
      valueOffset += 40;
    }
    // sprite positions = [signal, ..., signal + 2]
    // check if any of sprite positons == i (current crt position)
    // if yes flip pixel in array to on
    
  }
  std::cout << "Total signal strength: \n" << crtOutput << std::endl;
  std::cout << "Total signal strength: " << totalAnswerSignal << std::endl;

  // std::cout << instructions;
}
