//
//  EntryListView.swift
//  w4-core-data
//
//  Created by Default User on 9/25/24.
//

import SwiftUI

struct EntryRow : View {
    var person : Entries
    var body : some View {
        VStack {
            Text(person.name ?? "No name given").frame(width: 300, height: 30, alignment: .leading)
            Text(person.email ?? "No email given").frame(width: 300, height: 30, alignment: .leading)
            Text(person.food ?? "No food given").frame(width: 300, height: 30, alignment: .leading)
            Text(person.id?.uuidString ?? "No id given").frame(width: 300, height: 30, alignment: .leading)
            
        }
    }
}

struct EntryListView: View {
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(
        entity: Entries.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Entries.name, ascending: true)]
    ) var people : FetchedResults<Entries>
    
    var body: some View {
        List(people) { p in
            EntryRow(person: p)
                .swipeActions(edge: .trailing) {
                    Button {
                        context.delete(p)
                        try? context.save()
                    } label: {
                        Label("Delete", systemImage: "trash")
                    }.tint(.red)
                }
        }.navigationTitle("Entry List")
    }
    
}

#Preview {
    EntryListView()
}
