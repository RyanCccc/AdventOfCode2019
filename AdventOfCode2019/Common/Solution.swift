//
//  Solution.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/2/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

enum Part {
  case part1, part2
}

protocol Solution : UserInputHandler {
  associatedtype OutputType : LosslessStringConvertible
  func part1(_ inputs: [InputType]) -> OutputType;
  func part2(_ inputs: [InputType]) -> OutputType;
}

extension Solution {
  func solution(part: Part) {
    let inputs = getInputs()
    solution(inputs, part: part)
  }

  func solution(_ str: String, part: Part) {
    let inputs = getInputs(str.components(separatedBy: "\n"))
    solution(inputs, part: part)
  }

  private func solution(_ inputs: [InputType], part: Part) {
    print(String(solve(inputs, part: part)))
  }

  private func solve(_ inputs: [InputType], part: Part) -> OutputType {
    switch part {
    case .part1:
      return part1(inputs)
    case .part2:
      return part2(inputs)
    }
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
    getInputs(readLines())
  }

  func getInputs(_ strs: [String]) -> [InputType] {
    var inputs = [InputType]()
    for line in strs {
      inputs.append(convertStringToInput(line))
    }
    return inputs
  }
}
