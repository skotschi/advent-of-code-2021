import Foundation

do {
    guard let fileUrl = Bundle.main.url(forResource: "input", withExtension: "txt") else {fatalError()}
    let text = try String(contentsOf: fileUrl, encoding: String.Encoding.utf8)
    let commands = text.components(separatedBy: "\n")
    
    var xPosition : Int = 0
    var zPosition : Int = 0
    var aim = 0
    
    for command in commands {
        var step = command.components(separatedBy: " ")
        step[1] =  step[1].filter {!$0.isWhitespace}
        switch step[0] {
        case "forward":
            xPosition = xPosition + Int(step[1])!
            zPosition = zPosition + (aim * Int(step[1])!)
        case "up":
            aim = aim - Int(step[1])!
        case "down":
            aim = aim + Int(step[1])!
        default:
            break
        }
        print("xPosition:\(xPosition), zPosition\(zPosition)")
        print("Solution 1: \(zPosition*xPosition)")
    }
}

