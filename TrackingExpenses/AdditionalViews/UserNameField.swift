//File for changings
// Please doesn't use this file
import SwiftUI

struct UserNameField: View {
    @State private var name: String
    @State private var savedName: String
    @FocusState private var isTextFieldFocused
    @State private var isAnimated : Bool = false
    init() {
        let storedName = UserDefaults.standard.string(forKey: "userName")
        _name = State(initialValue: storedName ?? "")
        _savedName = State(initialValue: storedName ?? "")
    }

    var body: some View {
        HStack {
            TextField(isAnimated ? "Edit your name" : "Enter your name", text: $name)
                .focused($isTextFieldFocused)
                .onSubmit {
                    saveUserName()
                }
                .padding()
                /*.background(Color(UIColor.systemBackground))*/ // the same textField color as divice's interface
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isAnimated ? .clear : .blue, lineWidth: 1)
                )
                
                

            Button(action: {
                isAnimated = true
                saveUserName()
                isTextFieldFocused = false // hide keyboard
                
            }) {
                Text(isAnimated ? "Edit" : "Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                
            }
        }
        .onTapGesture {
            isTextFieldFocused = false // Hide keyboard when the user clicks on any place
        }
        .padding()
    }

    func saveUserName() {
        UserDefaults.standard.set(name, forKey: "userName")
        savedName = name
    }
}

struct UserNameField_Previews: PreviewProvider {
    static var previews: some View {
        UserNameField()
    }
}
