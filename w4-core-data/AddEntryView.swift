//
//  AddEntryView.swift
//  w4-core-data
//
//  Created by Default User on 9/25/24.
//

import SwiftUI

struct AddEntryView: View {
    @State var name : String = ""
    @State var email : String = ""
    @State var food : String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("New User")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                    TextField("Food", text: $food)
                }
                Section(header: Text("Save")) {
                    Button("Submit") {
                        print("Saving...")
                        addNewPerson()
                        rememberEnteredData()
                    }
                }
            }.navigationTitle("Add new person")
        }
    }
    
    func rememberEnteredData() {
        let defaults = UserDefaults.standard
        defaults.set(name, forKey: "lastName")
        defaults.set(email, forKey: "lastEmail")
        defaults.set(food, forKey: "lastFood")
        defaults.synchronize()
    }
    
    func addNewPerson() {
        let pers = PersistenceController.shared
        pers.saveEntry(name: name, email: email, food: food)
    }
}

#Preview {
    AddEntryView()
}
