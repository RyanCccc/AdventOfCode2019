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
//    return solve1(inputs)
    return solve2(inputs)
  }

  func solve1(_ inputs: [[Int]]) -> Int {
    return getOutputByReplacing(inputs, noun: 12, verb: 02)
  }

  func solve2(_ inputs: [[Int]]) -> Int {
    for noun in 0...99 {
      for verb in 0...99 {
        let output = getOutputByReplacing(inputs, noun: noun, verb: verb)
        if output == 19690720 {
          return noun * 100 + verb
        }
      }
    }
    assert(false, "not found")
    return 0
  }

  func getOutputByReplacing(_ inputs: [[Int]], noun: Int, verb: Int) -> Int {
    assert(inputs.count == 1)
    var input = inputs[0]
    assert(input.count > 2)
    input[1] = noun
    input[2] = verb
    for i in stride(from: 0, to: input.count, by: 4) {
      let opcode = input[i]
      if opcode == 99 {
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
    assert(false, "Bad input");
    return input[0]
  }

  func convertStringToInput(_ str: String) -> [Int] {
    return str.split(separator: ",").map { (substr) -> Int in
      return Int(substr)!
    }
  }
}
