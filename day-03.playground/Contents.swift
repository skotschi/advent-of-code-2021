import Foundation

//Datei einlesen

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

let input = parseInput()

var gammaRate  : [String] = Array(repeating: "0", count: input[0].count)
var epsilonRate : [String] = Array(repeating: "0", count: input[0].count)

// Gamme Rate: Die häufigste Zahl an der jeweiligen Stelle im Array
// Epsilon Rate: Die seltenere Zahl an der jeweiligen Stelle
//1er an der jeweiligen Stelle zählen
var count = Array(repeating: 0, count: input[0].count)
for value in input {
    for (index, checkValue) in value.enumerated(){
        switch checkValue {
        case "1":
            count[index] += 1
        default:
            break
        }
    }
    print(count)
}

//Kommt die 1 an der Stelle häufiger als die Gesamtlänge des Arrays vor? Wenn ja, muss Gamma eine 1 sein und umgekehrt.
for (index, value) in count.enumerated() {
    (value > (input.count / 2)) ? (gammaRate[index] = "1") : (gammaRate[index] = "0")
    (value > (input.count / 2)) ? (epsilonRate[index] = "0") : (epsilonRate[index] = "1")
}
print(gammaRate)
print(epsilonRate)

let powerConsumption = Int(gammaRate.joined(), radix: 2)! * Int(epsilonRate.joined(), radix: 2)!
print("Power Consumption:\(powerConsumption)")
