import Foundation

// Import in array konvertieren

//var measurements : [Int]
//
//do {
//    guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }
//    let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
//    measurements = (text.components(separatedBy: "\n")).map {Int($0)!}
//    var lastMeasurement = 0
//    var result = 0
//    for value in measurements {
//        print("Value:\(value), lastMeasurement:\(lastMeasurement)")
//        if value > lastMeasurement{
//            result = result + 1
//        }
//        lastMeasurement = value
//    }
//    print(result)
//
//} catch {
//    print(error)
//}

// Text Datei in Array von Zahlen konvertieren
do {
    guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else { fatalError() }
    let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
    let measurements : [Int] = (text.components(separatedBy: "\n")).map {Int($0)!}

    // Wenn mein letzter Messwert größer war als der vorherige, erhöhe ich das Ergebnis um 1
    var result = 0
    var lastMeasurement = 0
    
    for measurement in measurements {
        print("measurement:\(measurement), lastMeasurement:\(lastMeasurement)")
        if measurement > lastMeasurement {
            result += 1
        }
        print("result:\(result)")
        lastMeasurement = measurement
    }
} catch {
    print(error)
}


