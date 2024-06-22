//
//  ListView.swift
//  ToDo List
//
//  Created by Kabir Soni  on 21/03/24.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            
            if listViewModel.item.isEmpty{
                NoItemsView()
            }else{
                List {
                    ForEach(listViewModel.item) { item in
                        ListRowView(item: item)
                        
                            .onTapGesture {
                                
                                withAnimation(.linear){
                                    listViewModel.updateItem(item: item)
                                }
                            }
                         }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(.inset)
        .navigationTitle("Todo List 📝")
        .navigationBarItems(
        leading: EditButton(),
        trailing:
            NavigationLink("Add", destination: AddView())
        )
    }
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel()) 
}

