import Foundation.NSString

let puzzleInput = [13,47,64,52,60,69,80,85,57,1,2,6,30,81,86,40,27,26,97,77,70,92,43,94,8,78,3,88,93,17,55,49,32,59,51,28,33,41,83,67,11,91,53,36,96,7,34,79,98,72,39,56,31,75,82,62,99,66,29,58,9,50,54,12,45,68,4,46,38,21,24,18,44,48,16,61,19,0,90,35,65,37,73,20,22,89,42,23,15,87,74,10,71,25,14,76,84,5,63,95]

// Dokument einlesen
func parseInput () -> [String] {
    do {
        guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else {fatalError()}
        let input = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
        return input.components(separatedBy: "\n")
    } catch {
        print(error)
        return ["Keine Ahnung wie ich das umgehen soll. Es gibt einen Input, vertraue mir!"]
    }
}

let bingoBoards = parseInput().split(separator: "")


var cleanBoards = [String?]()


for board in bingoBoards {
    for row in board {
        var cleanRow:[String] = []
        let bingoRow = row.components(separatedBy: " ").filter { $0 != ""}
        cleanRow.append(contentsOf: bingoRow)
    }
}

