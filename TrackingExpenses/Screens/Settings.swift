//
//  Settings.swift
//  TrackingExpenses
//
//  Created by Влад on 10/10/23.
//

import SwiftUI

struct Settings: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    Categories()
                } label: {
                    HStack {
                        Text("Categories")
                    }
                }
                
                Button(role: .destructive) {
                    
                } label: {
                    Text("Erase Data")
                }
            }.navigationTitle("Settings")
                .padding(.top, 16)
        }
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
