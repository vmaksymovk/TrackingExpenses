//
//  ContentView.swift
//  TrackingExpenses
//
//  Created by Влад on 10/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Expenses()
            .tabItem {
                    Label("Expenses", systemImage: "tray.and.arrow.up.fill")
                }
            
            Reports()
            
                .tabItem {
                    Label("Reports", systemImage: "chart.bar.fill")
                }
            
            Add()
                
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            Settings()
                
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
