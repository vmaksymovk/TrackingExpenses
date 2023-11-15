import SwiftUI
import RealmSwift

struct Settings: View {
    @State private var showEraseConfirmation = false
    @State private var chooseLanguage : Language = .English
    
    
    
    
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                
                AccountImage() // View with account's image
                UserNameField()
                List {
                    
                    
                    Picker("Language:", selection: $chooseLanguage) {
                        ForEach(Language.allCases) { value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                    
                    NavigationLink {
                        Categories()
                    } label: {
                        HStack {
                            Text("Categories")
                        }
                    }
                    
                    
                    
                    Button(role: .destructive) {
                        showEraseConfirmation = true
                    } label: {
                        Text("Erase Data")
                    }
                    .foregroundColor(.red)
                    .alert(isPresented: $showEraseConfirmation) {
                        Alert(
                            title: Text("Are you sure?"),
                            message: Text("This action cannot be undone."),
                            primaryButton: .destructive(Text("Erase data")) {
                                let realm = try! Realm()
                                realm.beginWrite()
                                realm.deleteAll()
                                try! realm.commitWrite()
                            },
                            secondaryButton: .cancel()
                        )
                    }
                }
                .navigationTitle("Settings")
            .padding(.top, 16)
            }
        }
        
    }
}

struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings()
    }
}
