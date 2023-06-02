//
//  ButtonView.swift
//  ecommerce app in swift
//
//  Created by MacBook Pro on 27/05/R5.
//

import SwiftUI

struct ButtonView: View {
    var width: CGFloat
    var text: String
    var color: Color = Color("primaryColor")
    var height: CGFloat = 50
    
    
    var body: some View {
        Button(action: {
            // ...
        }) {
            Text("\(text)")
        }
        .frame(width: width, height: height)
        .foregroundColor(.white)
        .background(
            
            RoundedRectangle(
                cornerRadius: width / 2,
                style: .continuous
            ).fill(color)
        )
    }
}

