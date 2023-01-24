//
//  ContentView.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import SwiftUI

struct MainCalculatorView: View {
    
    @State var lightMode: Bool = true
    @State var currentComputation: String = ""
    @State var mainResult: String = "0"
    
    var body: some View {
        ZStack {
            PrimaryBg
                .ignoresSafeArea()
            VStack {
                SunAndMoonView(lightMode: lightMode)
                    .onTapGesture {
                        withAnimation {
                            lightMode.toggle()
                        }
                    }
                Spacer()
                
                ComputationView(currentComputation: currentComputation, mainResult: mainResult)
                
                Spacer()
                
                CalculatorButtonsView(currentComputation: $currentComputation, mainResult: $mainResult)
            }
        }
        .environment(\.colorScheme, lightMode ? .light : .dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainCalculatorView()
    }
}
