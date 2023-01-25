//
//  String Helper Functions.swift
//  Calculator
//
//  Created by karlis.stekels on 25/01/2023.
//

import Foundation

///
/// returns last char if exists
/// Otherwise return an empty string
func getLastChar(str: String) -> String {
    return str.isEmpty ? "" : String(str.last!)
}

/// Return true if last char of str is true
func lastCharacterISEqualTo(str: String, char: String) -> Bool {
    let last = getLastChar(str: str)
    return last == char
}

func formatResult(val: Double) -> String {
    let numberFormatter = NumberFormatter()
    numberFormatter.numberStyle = .decimal
    numberFormatter.maximumFractionDigits = 16
    let result = numberFormatter
        .string(from: NSNumber(value: val))
    return result ?? "0 "
}



func lastCharIsDigit(str: String) -> Bool {
    return "0123456789".contains(getLastChar(str: str))
}

func lastCharIsDigitOrPercent(str: String) -> Bool {
    return "0123456789%".contains(getLastChar(str: str))
}

func lastCharacterIsAnOperator(str: String) -> Bool {
    let last = getLastChar(str: str)
    return operators.contains(last)
}
