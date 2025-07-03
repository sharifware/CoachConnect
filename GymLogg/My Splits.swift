//
//  My Splits.swift
//  GymLogg
//
//  Created by Muhammed-Sharif Adepetu on 7/2/25.
//

import SwiftUI



struct MySplits: View{
 
    @State var searchString = ""
    @State var selectedtab: Int = 0
    var mySplits = GroupSplits()
    
    /*
     var filteredSplits: [[Workout]]{
     guard !searchString.isEmpty else {return splits}
     return splits.filter {$0.splits.localizedCaseInsensitiveContains(searchString)}
     }*/
    var body: some View {
        Form {
            Section {
                ForEach(mySplits.keys.sorted(), id: \.self) { key in
                    HStack {
                        Text("Check:")
                        Text("\(mySplits[key]!)")
                        
                    }
                    
                    
                }
            }
            
        }
    }
}

func GroupSplits() -> [String: [Workout]] {
    let workouts = loadCSV(from: "Excercise Database")
    var splits = [String: [Workout]]()
    splits["one"] =  workouts
    return splits
    }

#Preview {
    MySplits()
}
