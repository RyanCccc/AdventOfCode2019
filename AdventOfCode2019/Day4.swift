//
//  Day4.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/4/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

struct Day4 : Solution {
  func part1(_ inputs: [(Int, Int)]) -> Int {
    assert(inputs.count == 1)
    let (num1, num2) = inputs[0]
    var total = 0
    for num in num1...num2 {
      if isValid(num) {
        total += 1
      }
    }
    return total
  }

  func part2(_ inputs: [(Int, Int)]) -> Int {
    assert(inputs.count == 1)
    let (num1, num2) = inputs[0]
    var total = 0
    for num in num1...num2 {
      if isValidForPart2(num) {
        total += 1
      }
    }
    return total
  }

  func convertStringToInput(_ str: String) -> (Int, Int) {
    let strs = str.components(separatedBy: "-")
    assert(strs.count == 2)
    return (Int(strs[0])!, Int(strs[1])!)
  }

  typealias InputType = (Int, Int)
  typealias OutputType = Int

  // MARK: Private

  private func isValid(_ input: Int) -> Bool {
    let str = String(input)
    var prevChar : String.Element?
    var dup = false
    for char in str {
      if let preChar = prevChar {
        if prevChar == char {
          dup = true
        }
        if preChar > char {
          return false
        }
      }
      prevChar = char
    }
    return dup
  }

  private func isValidForPart2(_ input: Int) -> Bool {
    let str = String(input)
    var prevChar : String.Element?
    var dup = false
    var dupLength = 1
    for char in str {
      if let preChar = prevChar {
        if preChar > char {
          return false
        }
        if prevChar == char {
          dupLength += 1
        } else {
          if dupLength == 2 {
            dup = true
          }
          dupLength = 1
        }
      }
      prevChar = char
    }
    return dup || (dupLength == 2)
  }
}
