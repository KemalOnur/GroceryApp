//
//  ContentView.swift
//  GroceryApp
//
//  Created by Kemal Onur Güngör on 29.03.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @State private var newItemName: String = ""

    var body: some View {
        
        NavigationSplitView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item is \(item.grocery_Item)")
                    } label: {
                        Text(item.grocery_Item)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
               
            }
        }   detail: {
            Text("Select an item")
        }
        VStack{
            HStack{
                Text("")
                TextField("Item Name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .font(.callout)
                    .padding()
                    .frame(maxWidth: 300)
                    .cornerRadius(40)
                Button(action: addItem){
                    Text("Add")
                        .font(.callout)
                        .padding()
                        .frame(maxWidth: 80)
                        .shadow(radius: 40)
                        .frame(maxHeight: 40)
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(40)
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(grocery_Item: newItemName)
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
