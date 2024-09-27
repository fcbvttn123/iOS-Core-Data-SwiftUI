//
//  ContentView.swift
//  w4-core-data
//
//  Created by Default User on 9/25/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @State var name : String = UserDefaults.standard.string(forKey: "lastName") ?? "No name saved"
    @State var email : String = UserDefaults.standard.string(forKey: "lastEmail") ?? "No email saved"
    @State var food : String = UserDefaults.standard.string(forKey: "lastFood") ?? "No food saved"
    
    var body: some View {
        NavigationView {
            VStack{
                Text("My core data app").padding(20)
                Text("Name: \(name)")
                Text("Email: \(email)")
                Text("Food: \(food)")
                NavigationLink(destination: EntryListView()) {
                    Text("Go to entry list")
                }.padding(10)
                NavigationLink(destination: AddEntryView()) {
                    Text("Add entry")
                }.padding(10)
            }
        }
    }
    
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
