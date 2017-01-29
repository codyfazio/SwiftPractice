//
//  Panagram.swift
//  Panagram
//
//  Created by Cody Fazio on 1/29/17.
//  Copyright © 2017 Cody Fazio. All rights reserved.
//

import Foundation

class Panagram {
    
    let consoleIO = ConsoleIO()
    func staticMode() {
        let argCount = CommandLine.argc
        let argument = CommandLine.arguments[1]
        
        let (option,value) = consoleIO.getOption(argument.substring(from: argument.characters.index(argument.startIndex, offsetBy: 1)))
        
        switch option {
        case .anagram:
            if argCount != 4 {
                if argCount > 4 {
                    consoleIO.writemessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                    consoleIO.writemessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
                ConsoleIO.printUsage()
            } else {
                let first = CommandLine.arguments[2]
                let second = CommandLine.arguments[3]
                
                if first.isAnagramOfString(second) {
                    consoleIO.writemessage("\(second) is and anagram of \(first)")
                } else {
                    consoleIO.writemessage("\(second) is not an anagram of \(first)")
                }
            }
        case .palindrome:
            if argCount != 3 {
                if argCount > 3 {
                    consoleIO.writemessage("Too many arguments for option \(option.rawValue)", to: .error)
                } else {
                     consoleIO.writemessage("Too few arguments for option \(option.rawValue)", to: .error)
                }
            } else {
                let s = CommandLine.arguments[2]
                let isPalindrome = s.isPalindrome()
                consoleIO.writemessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            }
        case .help:
            ConsoleIO.printUsage()
        case .unknown, .quit:
            consoleIO.writemessage("Unknown option \(value)", to: .error)
            ConsoleIO.printUsage()
        
            
        }
    }
    
    func interactiveMode() {
        consoleIO.writemessage("Welcome to Panagram. this program checks if an input string is an anagram or palindrome.")
        var shouldQuit = false
        while !shouldQuit {
            consoleIO.writemessage("Type 'a' to check for anangrams or 'p' for palindromes type 'q' to quit.")
            let (option, value) = consoleIO.getOption(consoleIO.getInput())
            
            switch option {
            case .anagram:
                consoleIO.writemessage("Type the first string:")
                let first = consoleIO.getInput()
                consoleIO.writemessage("Type the second string:")
                let second = consoleIO.getInput()
                
                if first.isAnagramOfString(second) {
                    consoleIO.writemessage("\(second) is an anagram of \(first)")
                } else {
                    consoleIO.writemessage("\(second) is an anagram of \(first)")
                }
            case .palindrome:
                consoleIO.writemessage("Type a word or sentence:")
                let s = consoleIO.getInput()
                let isPalindrome = s.isPalindrome()
                consoleIO.writemessage("\(s) is \(isPalindrome ? "" : "not ")a palindrome")
            case .quit:
                shouldQuit = true 
            default:
                consoleIO.writemessage("Unknown option \(value)", to: .error)
            }
        }
    }
}
