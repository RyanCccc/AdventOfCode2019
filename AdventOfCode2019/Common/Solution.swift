//
//  Solution.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/2/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

protocol Solution : UserInputHandler {
  associatedtype OutputType : LosslessStringConvertible
  func solve(_ inputs: [InputType]) -> OutputType;
}

extension Solution {
  func solution() {
    let inputs = getInputs()
    print(String(solve(inputs)))
  }
}

protocol UserInputHandler {
  associatedtype InputType
  func convertStringToInput(_ str: String) -> InputType;
}

extension UserInputHandler {
  private func readLines() -> [String] {
    var strs = [String]()
    while let str = readLine(), str != "" {
      strs.append(str)
    }
    return strs
  }

  func getInputs() -> [InputType] {
    var inputs = [InputType]()
    for line in readLines() {
      inputs.append(convertStringToInput(line))
    }
    return inputs
  }
}
