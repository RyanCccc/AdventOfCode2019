//
//  Day2.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/2/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

struct Day2 : Solution {
  typealias InputType = [Int]
  typealias OutputType = Int

  func solve(_ inputs: [[Int]]) -> Int {
    assert(inputs.count == 1)
    var input = inputs[0]
    for i in stride(from: 0, to: input.count, by: 4) {
      let opcode = input[i]
      if opcode == 99 {
        print(input)
        return input[0]
      }
      assert(input.count > i+3)
      let num1Index = input[i+1]
      let num2Index = input[i+2]
      let num3Index = input[i+3]
      assert(input.count > num1Index)
      assert(input.count > num2Index)
      assert(input.count > num3Index)
      let num1 = input[num1Index]
      let num2 = input[num2Index]
      switch opcode {
      case 1:
        input[num3Index] = num1 + num2
      case 2:
        input[num3Index] = num1 * num2
      default:
        assert(false, "Bad input");
      }
    }
    return input[0]
  }

  func convertStringToInput(_ str: String) -> [Int] {
    var input = str.split(separator: ",").map { (substr) -> Int in
      return Int(substr)!
    }
    assert(input.count > 2)
    input[1] = 12
    input[2] = 2
    return input
  }
}
