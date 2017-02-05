//
//  extensions.swift
//  Extensions
//
//  Created by Edmund Holderbaum on 2/4/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import Foundation

extension Int {
    func half () -> Int {
        return self/2
    }
    func isDivisible (by : Int ) -> Bool {
        return self % by == 0
    }
    var squared : Int {
        get { return self * self }
    }
    var halved: Int {
        get { return half() }
    }
}

extension String {
    
    func whisper () -> String {
        return self.lowercased()
    }
    func shout () -> String{
        return self.uppercased()
    }
    
    var points: Int {
        get{
            let myCharacters = Array (self.characters)
            var result = 0
            for thisCharacter in myCharacters{
                if vowels.contains(thisCharacter){
                    result += 2
                }
                else if consonants.contains(thisCharacter){
                    result += 1
                }
            }
            return result
        }
    }
    private func isLetter (_ input: Character)->Bool {
        return alphabet.contains(input) || ALPHABET.contains(input)
    }
    private func isCapital (_ input:Character)->Bool {
        return ALPHABET.contains(input)
    }
    
    var pigLatin: String {
        get {
            let myCharacters = Array(self.characters)
            var result: String = ""
            var myLetter: Character
            var wordIndex = 0
            var latinizer: String = ""
            while wordIndex < myCharacters.count {
                var letterIndex = wordIndex
                myLetter = myCharacters[letterIndex]
                var wordWasCapitalized = isCapital(myLetter)
                
                while letterIndex < myCharacters.count - 1 && isLetter(myLetter){
                    //scans for word groups
                    if letterIndex == wordIndex{
                        latinizer = "\(myLetter)ay".lowercased()
                        letterIndex += 1
                    }//latinizes first letter in sequence and does not append\
                    else {
                        if !wordWasCapitalized{
                            result.append(myLetter)
                        }
                        else {
                            result.append("\(myLetter)".uppercased())
                            wordWasCapitalized = false
                        }
                        letterIndex += 1
                    }//if word was capitalize, appends second letter capitalized else appends next letter
                    
                    myLetter = myCharacters[letterIndex]
                }
                wordIndex = letterIndex
                if wordIndex != myCharacters.count - 1 {result.append(latinizer + "\(myLetter)")} //appends nonletter character with latinizer
                wordIndex += 1
            }
            result.append (myCharacters[wordIndex-1])
            result.append (latinizer)
            return result
        }
    }
    var unicornLevel: String {
        get {
            var 🦄  = ""
            for myCharacter in self.characters {
                if isLetter(myCharacter){ 🦄.append("🦄")}
                else {🦄.append(" ")}
            }
            return 🦄
        }
    }
}


let alphabet: Set<Character> = ["a","b","c","d","e","f","g","h","i","j","k","l","m",
                                "n","o","p","q","r","s","t","u","v","w","x","y","z"]
let ALPHABET: Set<Character> = ["A","B","C","D","E","F","G","H","I","J","K","L","M",
                                "N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
let vowels: Set<Character> = ["a","A","e","E","i","I","o","O","u","U","y","Y"]

let consonants: Set = alphabet.union(ALPHABET).subtracting(vowels)
