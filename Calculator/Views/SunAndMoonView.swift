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
        Text("Sun Moon View")
    }
}

struct SunAndMoonView_Previews: PreviewProvider {
    static var previews: some View {
        SunAndMoonView(lightMode: true)
    }
}
