//
//  Expenses.swift
//  TrackingExpenses
//
//  Created by Влад on 10/10/23.
//

import SwiftUI

struct Expenses: View {
    var body: some View {
        NavigationView {
            Text("Expenses")
            .navigationTitle("Expenses")
        }
    }
}

struct Expenses_Previews: PreviewProvider {
    static var previews: some View {
        Expenses()
    }
}
