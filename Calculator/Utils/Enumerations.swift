//
//  Enumerations.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import Foundation

enum Operation {
    case add, substract, multiply, divide, equal, none
}

enum CalcButton: String {
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case zero = "0"
    case add = "+"
    case substract = "-"
    case divide = "÷"
    case multiply = "×"
    case equal = "="
    case clear = "AC"
    case decimal = "."
    case percent = "%"
    case negative = "IMGplus.slash.minus"
    case undo = "IMGarrow.counterclockwise"
}

let enumOperators: [CalcButton] = [
    .substract, .add, .divide, .multiply
]

let plusSymbol: String = CalcButton.add.rawValue
let substractSymbol: String = CalcButton.substract.rawValue
let multiplySymbol: String = CalcButton.multiply.rawValue
let divisionSymbol: String = CalcButton.divide.rawValue


let operators: String = "\(plusSymbol)\(substractSymbol)\(multiplySymbol)\(divisionSymbol)"
