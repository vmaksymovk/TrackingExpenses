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
            .scaleEffect(configuration.isPressed ? 0.8 : 1.0)
            .background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
    }
}

