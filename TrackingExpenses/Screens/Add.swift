
import SwiftUI
import RealmSwift
import AVKit

struct Add: View {
    @State private var showAlert = false
    @EnvironmentObject private var realmManager: RealmManager
    
    @State private var selectedCategory: Category = Category(name: "Create a category first", color: Color.clear)
    
    @State private var amount = ""
    @State private var recurrence = Recurrence.none
    @State private var date = Date()
    @State private var note = ""
    
    func onAppear() {
        if realmManager.categories.count > 0 {
            self.selectedCategory = realmManager.categories[0]
        }
    }
    
    var dateClosedRange: ClosedRange<Date> {
        let min = Calendar.current.date(byAdding: .year, value: -1, to: Date())!
        let max = Date()
        return min...max
    }
    
    func handleCreate() {
        guard let amount = Double(self.amount),
              amount > 0,
              !self.selectedCategory.name.isEmpty
        else {
            showAlert = true
            return
        }
        
        self.realmManager.submitExpense(Expense(
            amount: amount,
            category: self.selectedCategory,
            date: self.date,
            note: self.note,
            recurrence: self.recurrence
        ))
        
        self.amount = ""
        self.recurrence = Recurrence.none
        self.date = Date()
        self.note = ""
        hideKeyboard()
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    HStack {
                        Text("Amount")
                        Spacer()
                        TextField("Amount", text: $amount)
                            .multilineTextAlignment(.trailing)
                            .submitLabel(.done)
                            .keyboardType(.numberPad)
                    }
                    
                    HStack {
                        Text("Recurrence")
                        Spacer()
                        Picker(selection: $recurrence, label: Text(""), content: {
                            Text("None").tag(Recurrence.none)
                            Text("Daily").tag(Recurrence.daily)
                            Text("Weekly").tag(Recurrence.weekly)
                            Text("Monthly").tag(Recurrence.monthly)
                            Text("Yearly").tag(Recurrence.yearly)
                        })
                    }
                    
                    HStack {
                        Text("Date")
                        Spacer()
                        DatePicker(
                            selection: $date,
                            in: dateClosedRange,
                            displayedComponents: .date,
                            label: { Text("") }
                        )
                    }
                    
                    HStack {
                        Text("Note")
                        Spacer()
                        TextField("Note", text: $note)
                            .multilineTextAlignment(.trailing)
                            .submitLabel(.done)
                    }
                    
                    HStack {
                        Text("Category")
                        Spacer()
                        Picker(selection: $selectedCategory, label: Text(""), content: {
                            if realmManager.categories.count > 0 {
                                ForEach(realmManager.categories) { category in
                                    Text(category.name).tag(category)
                                }
                            } else {
                                Text(selectedCategory.name).tag(selectedCategory)
                            }
                        })
                    }
                }
                .scrollDisabled(true)
                .frame(height: 275)
                
                Button("Submit expense", systemImage: "paperplane") {
                    handleCreate()
                }
                .buttonStyle(CustomButton())
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Incomplete Fields"), message: Text("Please fill in all fields."), dismissButton: .default(Text("OK")))
                }
                
                Spacer()
            }
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button {
                        hideKeyboard()
                    } label: {
                        Label("Dismiss", systemImage: "keyboard.chevron.compact.down")
                    }
                }
            }
            .padding(.top, 16)
            .navigationTitle("Input an expense")
        }
        .onAppear {
            onAppear()
        }
    }
}

struct Add_Previews: PreviewProvider {
    static var previews: some View {
        Add()
            .environmentObject(RealmManager())
    }
}
