//
//  PasswordSelection.swift
//  Pr2503
//
//  Created by Вячеслав Онучин on 15.02.2023.
//

import Foundation

final class PasswordSelection {

    private var isRuning = true

    func bruteForce(passwordToUnlock: String) {
        let allowedCharacters = String.printable.map { String($0) }

        isRuning = true
        var password = ""

        // Will strangely ends at 0000 instead of ~~~
        while password != passwordToUnlock { // Increase MAXIMUM_PASSWORD_SIZE value for more
            password = generateBruteForce(password, fromArray: allowedCharacters)
            //             Your stuff here
            print(password)
            // Your stuff here
        }

        print(password)
    }

    func stopGenerating() {
        isRuning = false
    }

    func indexOf(character: Character, _ array: [String]) -> Int {
        array.firstIndex(of: String(character))!
    }

    func characterAt(index: Int, _ array: [String]) -> Character {
        index < array.count ? Character(array[index]) : Character("")
    }

    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string

        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        } else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

            if indexOf(character: str.last!, array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
            }
        }

        return str
    }
}
