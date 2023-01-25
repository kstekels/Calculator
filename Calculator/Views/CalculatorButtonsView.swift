//
//  CalculatorButtonsView.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import SwiftUI

struct CalculatorButtonModel: Identifiable {
    let id = UUID()
    let calcButton: CalcButton
    var color: Color = foregroundDigits
}

struct RowOfcalculatorButtonModel: Identifiable {
    let id = UUID()
    let row: [CalculatorButtonModel]
}

struct CalculatorButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    let buttonData: [RowOfcalculatorButtonModel] = [
        RowOfcalculatorButtonModel(row: [
            CalculatorButtonModel(calcButton: .clear, color: ForegroundTopButtons),
            CalculatorButtonModel(calcButton: .negative, color: ForegroundTopButtons),
            CalculatorButtonModel(calcButton: .percent, color: ForegroundTopButtons),
            CalculatorButtonModel(calcButton: .divide, color: foregroundRightButtons)
        ]),
        RowOfcalculatorButtonModel(row: [
            CalculatorButtonModel(calcButton: .seven),
            CalculatorButtonModel(calcButton: .eight),
            CalculatorButtonModel(calcButton: .nine),
            CalculatorButtonModel(calcButton: .multiply, color: foregroundRightButtons),
        ]),
        RowOfcalculatorButtonModel(row: [
            CalculatorButtonModel(calcButton: .four),
            CalculatorButtonModel(calcButton: .five),
            CalculatorButtonModel(calcButton: .six),
            CalculatorButtonModel(calcButton: .substract, color: foregroundRightButtons),
        ]),
        RowOfcalculatorButtonModel(row: [
            CalculatorButtonModel(calcButton: .one),
            CalculatorButtonModel(calcButton: .two),
            CalculatorButtonModel(calcButton: .three),
            CalculatorButtonModel(calcButton: .add, color: foregroundRightButtons),
        ]),
        RowOfcalculatorButtonModel(row: [
            CalculatorButtonModel(calcButton: .undo),
            CalculatorButtonModel(calcButton: .zero),
            CalculatorButtonModel(calcButton: .decimal),
            CalculatorButtonModel(calcButton: .equal, color: foregroundRightButtons),
        ])
    ]
    
    var body: some View {
        Grid() {
            ForEach(buttonData) { rowOfcalculatorButtonModel in
                GridRow {
                    ForEach(rowOfcalculatorButtonModel.row) { calcButtonModel in
                        Button {
                            print("Button pressed")
                            buttonPressed(calcButton: calcButtonModel.calcButton)
                        } label: {
                            ButtonView(
                                calcButton: calcButtonModel.calcButton,
                                fgColor: calcButtonModel.color,
                                bgColor: buttonBackground)
                        }
                        
                    }
                }
            }
        }
        .padding()
        .background(SecondaryBackground.cornerRadius(UIDevice.isIPad ? 30 : 20))
    }
    
    /// Implements the actual computatuin
    func calculateResults() -> Double {
        let visibleWorkings: String = currentComputation
        var workings = visibleWorkings.replacingOccurrences(
            of: "%", with: "*0.01")
        workings = workings.replacingOccurrences(
            of: multiplySymbol, with: "*")
        workings = workings.replacingOccurrences(
            of: divisionSymbol, with: "/")
        if getLastChar(str: visibleWorkings) == "." {
            workings += "0"
        }
        
        // Key point !
        // Actual computation
        let expression = NSExpression(format: workings)
        let expressionVal = expression.expressionValue(with: nil, context: nil) as! Double
        return expressionVal
    }
    
    func buttonPressed(calcButton: CalcButton) {
        switch calcButton {
        case .clear:
            currentComputation = ""
            mainResult = "0"
        case .equal, .negative:
            if !currentComputation.isEmpty {
                if !lastCharacterIsAnOperator(str: currentComputation) {
                    let sign = calcButton == .negative ? -1.0 : 1.0
                    mainResult = formatResult(val: sign * calculateResults())
                    if calcButton == .negative {
                        currentComputation = mainResult
                    }
                }
            }
        case .decimal:
            if let lastOccurenceOfDecimal = currentComputation.lastIndex(of: ".") {
                if lastCharIsDigit(str: currentComputation) {
                    let startIndex = currentComputation.index(lastOccurenceOfDecimal, offsetBy: 1)
                    let endIndex = currentComputation.endIndex
                    let range = startIndex..<endIndex
                    let rightSubString = String(currentComputation[range])
                    // Only have digits to the right "."
                    // that means do not add another "."
                    // Otherwise we can add another
                    // decimal point
                    
                    // 23.37+108 -> 23.37+108.
                    if Int(rightSubString) == nil && !rightSubString.isEmpty {
                        currentComputation += "."
                    }
                    
                }
                
            }
            else {
                if currentComputation.isEmpty {
                    currentComputation += "0."
                } else if lastCharIsDigit(str: currentComputation) {
                    currentComputation += "."
                }
            }
        case .percent:
            if lastCharIsDigit(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        case .undo:
            currentComputation = String(currentComputation.dropLast())
        case .add, .substract, .divide, .multiply:
            if lastCharIsDigitOrPercent(str: currentComputation) {
                appendToCurrentComputation(calcButton: calcButton)
            }
        default:
            appendToCurrentComputation(calcButton: calcButton)
        }
        
        func appendToCurrentComputation(calcButton: CalcButton) {
            currentComputation += calcButton.rawValue
        }
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(currentComputation: .constant("5 + 5"), mainResult: .constant("10"))
    }
}
