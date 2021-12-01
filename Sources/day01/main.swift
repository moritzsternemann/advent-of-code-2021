import Foundation

let inputURL = Bundle.module.url(forResource: "input", withExtension: "txt")!
let input = try Data(contentsOf: inputURL)

let numbers = String(decoding: input, as: UTF8.self)
    .split(separator: "\n")
    .compactMap { Int($0) }

// MARK: - Part 1

let result1 = numbers.reduce((0, Int.max)) { result, number in
    if number > result.1 {
        return (result.0 + 1, number)
    }
    return (result.0, number)
}

print("Part 1:", result1.0)

// MARK: - Part 2

var result2 = 0
for index in 0..<numbers.count - 3 {
    let sumA = numbers[index..<(index + 3)].reduce(0, +)
    let sumB = numbers[(index + 1)..<(index + 4)].reduce(0, +)
    if sumB > sumA {
        result2 += 1
    }
}

print("Part 2:", result2)

