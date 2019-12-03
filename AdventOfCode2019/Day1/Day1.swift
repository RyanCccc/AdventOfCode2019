//
//  File.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/2/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

struct Day1 : Solution {
  typealias InputType = Int
  typealias OutputType = Int

  func convertStringToInput(_ str: String) -> Int {
    return Int(str)!
  }

  func solve(_ inputs: [Int]) -> Int {
    var total = 0
    for mass in inputs {
      let cur = getTotoalFuelFromFuel(mass)
      total += cur
    }
    return total
  }

  func getTotoalFuelFromFuel(_ fuel: Int) -> Int {
    let cur = fuel / 3 - 2
    if (cur < 0) {
      return 0
    }
    return cur + getTotoalFuelFromFuel(cur)
  }
}
