import Foundation
import os

// Dokument einlesen
func parseInput () -> [String] {
    do {
        guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else {fatalError()}
        let input = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        return input.components(separatedBy: "\n").dropLast()
    } catch {
        print(error)
        return ["Keine Ahnung wie ich das umgehen soll. Es gibt einen Input, vertraue mir!"]
    }
}

let input = parseInput()

struct Point: Hashable {
    let x: Int
    let y: Int
}

struct Line {
    let start: Point
    let end: Point
}


let lines = input.map { line -> Line in
    let numbers = line
        .split { "0123456789".contains($0) == false }
        .map { Int($0)! }
    print(numbers)
    return Line(
        start: Point(x: numbers[0], y: numbers[1]),
        end: Point(x: numbers[2], y: numbers[3])
    )
}

print(lines)
