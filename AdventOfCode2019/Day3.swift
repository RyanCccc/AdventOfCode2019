//
//  Day3.swift
//  AdventOfCode2019
//
//  Created by Rendong Chen on 12/3/19.
//  Copyright © 2019 Rendong Chen. All rights reserved.
//

import Foundation

struct Day3 : Solution {
  typealias InputType = [Direction]
  typealias OutputType = Int

  enum Direction {
    case left(Int)
    case right(Int)
    case up(Int)
    case down(Int)

    fileprivate func go(_ p: Point) -> [Point] {
      var points = [Point]()
      switch self {
      case .up(let val):
        for v in 0...val {
          points.append(Point(x: p.x, y: p.y + v))
        }
      case .down(let val):
        for v in 0...val {
          points.append(Point(x: p.x, y: p.y - v))
        }
      case .left(let val):
        for v in 0...val {
          points.append(Point(x: p.x - v, y: p.y))
        }
      case .right(let val):
        for v in 0...val {
          points.append(Point(x: p.x + v, y: p.y))
        }
      }
      return points
    }
  }

  fileprivate struct Point : Hashable {
    var x : Int
    var y : Int
  }

  func part1(_ inputs: [[Direction]]) -> Int {
    assert(inputs.count == 2)
    let wire1Input = inputs[0]
    let wire2Input = inputs[1]
    let wire1 = generateWire(wire1Input)
    let wire2 = generateWire(wire2Input)
    var intersections = wire1.intersection(wire2)
    intersections.remove(Point(x: 0, y: 0))
    var distance = Int.max
    for intersection in intersections {
      let cur = abs(intersection.x) + abs(intersection.y)
      distance = min(cur, distance)
    }
    return distance
  }

  func part2(_ inputs: [[Direction]]) -> Int {
    assert(inputs.count == 2)
    let wire1Input = inputs[0]
    let wire2Input = inputs[1]
    let wire1 = generateWireWithDistance(wire1Input)
    let wire2 = generateWireWithDistance(wire2Input)
    var distance = Int.max
    for (p1, d1) in wire1 {
      if let d2 = wire2[p1] {
        distance = min(d1+d2, distance)
      }
    }
    return distance
  }

  private func generateWire(_ input: [Direction]) -> Set<Point> {
    var wire = Set<Point>()
    var cur = Point(x: 0, y: 0)
    for d in input {
      let route = d.go(cur)
      route.forEach { (p) in
        wire.insert(p)
      }
      cur = route.last!
    }
    return wire
  }

  private func generateWireWithDistance(_ input: [Direction]) -> [Point:Int] {
    var wire = [Point:Int]()
    var cur = Point(x: 0, y: 0)
    var curDistance = 0
    for d in input {
      let route = d.go(cur)
      route.forEach { (p) in
        if (wire[p] == nil) {
          wire[p] = curDistance
        }
        curDistance += 1
      }
      curDistance -= 1
      cur = route.last!
    }
    wire[Point(x: 0,y: 0)] = nil
    return wire
  }

  func convertStringToInput(_ str: String) -> [Direction] {
    var directions = [Direction]()
    let inputs = str.split(separator: ",")
    for input in inputs {
      let rawD = input.prefix(1)
      let val = Int(input.suffix(from: input.index(input.startIndex, offsetBy: 1)))!
      switch rawD {
      case "U":
        directions.append(Direction.up(val))
      case "D":
        directions.append(Direction.down(val))
      case "L":
        directions.append(Direction.left(val))
      case "R":
        directions.append(Direction.right(val))
      default:
        assert(false, "unkown direction")
      }
    }
    return directions
  }
}
