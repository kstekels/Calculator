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
        VStack(spacing: 10) {
            HStack {
                Spacer()
                Text(currentComputation)
                    .foregroundColor(foregroundDigits)
                    .font(UIDevice.isIPad ? .largeTitle : .body)
                .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
            
            HStack {
                Spacer()
                Text(mainResult)
                    .foregroundColor(foregroundDigits)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .lineLimit(1)
            }
            .minimumScaleFactor(0.1)
        }.padding(.horizontal)
    }
}

struct ComputationView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            Spacer()
            ComputationView(currentComputation: "12000+936", mainResult: "12936")
            Spacer()
            ComputationView(currentComputation: "76%", mainResult: "0.76")
            Spacer()
            ComputationView(currentComputation: "12*11", mainResult: "132")
            Spacer()
        }
    }
}
