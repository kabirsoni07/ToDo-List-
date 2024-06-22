//
//  ListRowView.swift
//  ToDo List
//
//  Created by Kabir Soni  on 21/03/24.
//

import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    @State var selectedTime = Date()
   
    
    func formattedTime(_ date: Date) -> String {
          let formatter = DateFormatter()
          formatter.timeStyle = .short
          return formatter.string(from: date)
      }
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle.fill" :
            "circle")
            
            .foregroundColor(item.isCompleted ? .green : .red)
            if item.isCompleted {
                Text(item.title)
                    .strikethrough() // Apply strikethrough if task is completed
               
                        } else {
                            Text(item.title)
                                .bold()
                        }
      //      Text(item.title)
           
            Spacer()
            DatePicker("Select a time:", selection: $selectedTime, displayedComponents: .hourAndMinute)
                .datePickerStyle(.automatic)
                            .labelsHidden()
                            .padding()
        }
        .font(.title2)
        .padding(.vertical,8)
    }
}
struct ListRowView_Previews: PreviewProvider {
    
    static  var item1 = ItemModel(title: "First item", isCompleted: false)
    static   var item2 = ItemModel(title: "second item", isCompleted: true)
    
    static var previews: some View{
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
        
    }
}
