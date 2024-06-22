//
//  ToDo_ListApp.swift
//  ToDo List
//
//  Created by Kabir Soni  on 21/03/24.
//

import SwiftUI

/*
 
 MVVM Architecher
 
 */



@main
struct ToDo_ListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle()) // for ipad
            .environmentObject(listViewModel)
        }
    }
}
