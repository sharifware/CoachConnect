//
//  My Splits.swift
//  GymLogg
//
//  Created by Muhammed-Sharif Adepetu on 7/2/25.
//

import SwiftUI
import Foundation

struct Split: Identifiable{
    var name: String = "Test"
    var exercises: [Workout]
    var id = UUID()
    
    init(split_name: String, workouts: [Workout]){
        name = split_name
        exercises = workouts
    }
    
}
struct MySplits: View{
 
    @State var searchString = ""
    @State var selectedtab: Int = 0
    var mySplits = GroupSplits()
    var filteredSets: [Split]{
        guard !searchString.isEmpty else {return mySplits}
        return mySplits.filter {$0.name.localizedCaseInsensitiveContains(searchString)}
    }
    var body: some View {
        NavigationView {
            List(filteredSets){ split in
                HStack {
                    Text(split.name + ": \(split.exercises.count)" ).frame(alignment: .center)
                } // calls workoutview and passes the workout information in the sitch 
            }
        }.navigationTitle("Workouts")
            .searchable(text: $searchString)
    }
}

func GroupSplits() -> [Split] { // Call this function when we want a new split. use pluss to add to array and name the workout array
    var workouts = loadCSV(from: "Excercise Database")
    var splits = [Split]()
    let ThisSplit = Split.init(split_name: "All Workouts", workouts: workouts)
    
    splits.append(ThisSplit)
    return splits
    }

#Preview {
    MySplits()
}
