//  ContentView.swift
//  GymLogg
//  Created by Muhammed-Sharif Adepetu on 7/1/25.
//

import SwiftUI

struct HomeView: View {
    @State var searchString = ""
    @State var selectedtab: Int = 1

    var body: some View {

        TabView(selection: $selectedtab){
                SessionsView()
                    .tabItem{
                        Label("Sessions", systemImage: "stopwatch")
                    }
                    .tag(0)
                
                ContentView()
                    .tabItem{
                        Label("All Workouts", systemImage: "dumbbell")
                        Text("Home")
                    }
                    .tag(1)
                CalendarView()
                    .tabItem{
                        Label("Calendar", systemImage: "calendar")
                        Text("Home")
                    }
            MySplits()
                .tabItem{
                    Label("Client Splits", systemImage: "book")
                    Text("Home")
                }
                    .tag(2)
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
}
    #Preview {
        HomeView()
    }

