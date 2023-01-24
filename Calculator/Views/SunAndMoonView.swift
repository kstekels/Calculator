//
//  SunAndMoonView.swift
//  Calculator
//
//  Created by karlis.stekels on 24/01/2023.
//

import SwiftUI

struct SunAndMoonView: View {
    
    var lightMode: Bool
    
    var body: some View {
        HStack(spacing: 30) {
            
            Image(systemName: !lightMode ? Symbols.sun.rawValue : Symbols.sunFilled.rawValue)
                .imageScale(.large)
                .foregroundColor(lightMode ? sunOrMoonSelected : sunOrMoonNotSelected)
            
            Image(systemName: lightMode ? Symbols.moon.rawValue : Symbols.moonFilled.rawValue)
                .imageScale(.large)
                .foregroundColor(lightMode ? sunOrMoonNotSelected : sunOrMoonSelected)
        }
        .padding()
        .background(SecondaryBackground)
        .cornerRadius(20)
    }
}

struct SunAndMoonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            SunAndMoonView(lightMode: true)
            SunAndMoonView(lightMode: false)
        }
        
    }
}
