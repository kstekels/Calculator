//
//  ComputationView.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import SwiftUI

struct ComputationView: View {
    
    let currentComputation: String
    let mainResult: String
    
    var body: some View {
        VStack {
            Text(currentComputation)
            Text(mainResult)
        }
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        ComputationView(currentComputation: "9 + 9", mainResult: "18")
    }
}
