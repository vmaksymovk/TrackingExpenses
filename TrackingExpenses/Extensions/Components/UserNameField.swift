//File for changings
// Please doesn't use this file
import SwiftUI

struct UserNameField: View {
    @State private var name: String
    @State private var savedName: String
    @FocusState private var isTextFieldFocused

    init() {
        let storedName = UserDefaults.standard.string(forKey: "userName")
        _name = State(initialValue: storedName ?? "")
        _savedName = State(initialValue: storedName ?? "")
    }

    var body: some View {
        HStack {
            TextField("Enter your name", text: $name)
                .focused($isTextFieldFocused)
                .onSubmit {
                    saveUserName()
                }
                .padding()
                .background(Color.white)
                .cornerRadius(8)

            Button(action: {
                saveUserName()
                isTextFieldFocused = false // hide keyboard
            }) {
                Text("Save")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
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
