//
//  CustomButton.swift
//  TrackingExpenses
//
//  Created by Влад on 2/8/24.
//

import Foundation
import UIKit
import SwiftUI

struct CustomButton: ButtonStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: 200, height: 50)
            .background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
            .foregroundStyle(.white)
            .cornerRadius(15)
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .animation(.easeIn(duration: 0.1), value: configuration.isPressed)
            
            
            
    }
}

