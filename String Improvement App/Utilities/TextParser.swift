//
//  TextParser.swift
//  String Improvement App
//
//  Created by Nomad on 10/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import Foundation

func parseText(text: String) -> String {
    let textToWork: String = text.lowercased()
print(textToWork)
    var resultTxt: String = ""
    
    var isFirstLetter: Bool = true
    var needUpper: Bool = false
    var inWord: Bool = false
    var hyphen: Bool = false
    var isLetter: Bool = false
    var apostrophe: Bool = false
    var needSpaсe: Bool = false
    var word: String = ""
    
    for Character in textToWork {
        isLetter = isLetterFunc(symbol: Character)
        
        if isLetter {
            if hyphen {
                word.append("-")
                needSpaсe = false
            }
            if apostrophe {
                word.append("\'")
                needSpaсe = false
            }
            if needSpaсe {
                word.append(" ")
            }

            if needUpper || isFirstLetter {
                word += String(Character).uppercased()
                inWord = true
            } else {
                word += String(Character)
                inWord = true
            }
            inWord = true
            isLetter = false
            needUpper = false
            needSpaсe = false
            apostrophe = false
            isFirstLetter = false
            
        } else if Character == "-" {
            if inWord {
                hyphen = true
            } else {
                resultTxt.write(word)
                word = ""
                resultTxt.append("-")
                hyphen = false
                inWord = false
                needSpaсe = false
                apostrophe = false
            }
        } else if Character == "\'"{
            if inWord {
                apostrophe = true
            } else {
                resultTxt.write(word)
                word = ""
                resultTxt.append("\'")
                inWord = false
                hyphen = false
                needSpaсe = false
                apostrophe = false
            }
        } else if Character == " " {
            needSpaсe = true
        } else if Character == "," {
                resultTxt.write(word)
                word = ""
                resultTxt.append(",")
                needSpaсe = true
                hyphen = false
                inWord = false
                apostrophe = false
        } else if Character == "." || Character == "!" || Character == "?"  {
            resultTxt.write(word)
            word = ""
            resultTxt += String(Character)
            inWord = false
            needSpaсe = true
            needUpper = true
        } else {
            resultTxt.write(word)
            inWord = false
            hyphen = false
            needSpaсe = false
            apostrophe = false
            
            resultTxt += String(Character)
            word = ""
        }
    }
    resultTxt.write(word)
    if !resultTxt.hasSuffix(".") {
        resultTxt.append(".")
    }
    print(resultTxt)
    return resultTxt
}

func isLetterFunc(symbol: Character) -> Bool {
    return ( symbol >= "a" && symbol <= "z" )
}

