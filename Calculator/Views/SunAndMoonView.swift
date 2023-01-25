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
                .foregroundColor(lightMode ? sunOrMoonSelected : sunOrMoonNotSelected)
            
            
            Image(systemName: lightMode ? Symbols.moon.rawValue : Symbols.moonFilled.rawValue)
                .foregroundColor(lightMode ? sunOrMoonNotSelected : sunOrMoonSelected)
                
        }
        .imageScale(.large)
        .font(UIDevice.isIPad ? .title : .body)
        .fontWeight(UIDevice.isIPad ? .semibold : .regular)
        .padding()
        .background(SecondaryBackground)
        .cornerRadius(UIDevice.isIPad ? 50 : 20)
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
