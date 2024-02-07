
import SwiftUI

struct ContentView: View {
    @StateObject var realmManager = RealmManager()

    var body: some View {
        TabView {
            Expenses(expenses: realmManager.expenses)
                .environmentObject(realmManager)
                .tabItem {
                    Label("Expenses", systemImage: "list.bullet.clipboard")
                }
            
            Analyses()
                .environmentObject(realmManager)
                .tabItem {
                    Label("Analyses", systemImage: "chart.bar.fill")
                }
            
            Add()
                .environmentObject(realmManager)
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            Settings()
                .environmentObject(realmManager)
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
