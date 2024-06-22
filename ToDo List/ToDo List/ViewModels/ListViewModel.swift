//
//  ListViewModel.swift
//  ToDo List
//
//  Created by Kabir Soni  on 26/03/24.
//

import Foundation



class ListViewModel: ObservableObject {
    
    @Published var item: [ItemModel] = [] {
        didSet {
            saveItem()
        }
    }
    let itemsKey: String = "item_list"
    init(){
        getItem()
    }
    
    func getItem() {
        guard
            let data = UserDefaults.standard.data(forKey: itemsKey),
            let savedItems = try? JSONDecoder().decode([ItemModel].self, from: data)
        else {return}
        
        self.item = savedItems
    }
    
    func deleteItem(indexSet: IndexSet){
        item.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        item.move(fromOffsets: from, toOffset: to)
        
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        item.append(newItem)
    }
    

        func updateItem(item: ItemModel) {
            if let index = self.item.firstIndex(where: { $0.id == item.id }) {
                self.item[index] = item.updateCompletion()
            }
        }
    
    func saveItem(){
        if let encodedData = try? JSONEncoder().encode(item){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }

        
    }
    
