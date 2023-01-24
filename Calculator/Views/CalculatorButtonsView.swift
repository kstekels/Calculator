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
            CalculatorButtonModel(calcButton: .divide, color: foregroundRightButtons),
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
                            // Logic takes place
                            print("Button pressed")
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
        .background(SecondaryBackground.cornerRadius(20))
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(currentComputation: .constant("5 + 5"), mainResult: .constant("10"))
    }
}
