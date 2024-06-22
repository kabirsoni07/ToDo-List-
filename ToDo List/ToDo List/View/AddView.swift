//
//  AddView.swift
//  ToDo List
//
//  Created by Kabir Soni  on 21/03/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textFieldText: String = ""
    @State var alerttitle: String = ""
    @State var showAlert: Bool = false
    @State private var selectedTime = Date()
    
    
    
    func formattedTime(_ date: Date) -> String {
          let formatter = DateFormatter()
          formatter.timeStyle = .short
          return formatter.string(from: date)
      }
    
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type Something Here...", text: $textFieldText)
                    .bold()
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .border(Color.black)
                    .cornerRadius(2.0)
              
                Button(action: saveButtonPressed, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .padding(14)
        }
        .navigationTitle("Add an Item")
        .alert(isPresented: $showAlert, content: getAlert)
       
    }
    func saveButtonPressed() {
        if textIsAppropriate() {
            listViewModel.addItem(title: textFieldText)
            presentationMode.wrappedValue.dismiss()
        }
      
    }
    
    func textIsAppropriate() -> Bool{
        if textFieldText.count < 3 {
            alerttitle = "Your New Todo Item must be at least 3 Char long!!!"
            showAlert.toggle()
            return false
        }
        return true
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alerttitle))
    }
    
}

#Preview {
    
    NavigationView{
        AddView()
    }
    .environmentObject(ListViewModel())
}
