//
//  CalculatorButtonsView.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import SwiftUI

struct CalculatorButtonsView: View {
    
    @Binding var currentComputation: String
    @Binding var mainResult: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct CalculatorButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorButtonsView(currentComputation: .constant("5 + 5"), mainResult: .constant("10"))
    }
}
