//  ContentView.swift
//  GymLogg
//  Created by Muhammed-Sharif Adepetu on 7/1/25.
//

import SwiftUI

struct ContentView: View {
    @State var searchString = ""
    @State var selectedtab: Int = 0
    var workouts = loadCSV(from: "Excercise Database")
    var filteredWorkouts: [Workout]{
        guard !searchString.isEmpty else {return workouts}
        return workouts.filter {$0.Exercise.localizedCaseInsensitiveContains(searchString)}
    }
    var body: some View {
        NavigationView {
            List(filteredWorkouts){ workout in
                HStack {
                    Image(workout.TargetMuscleGroup)
                        .resizable()
                        .frame(width: 60, height: 60)
                    Text(workout.Exercise + " " + workout.Difficulty) // we want to change the color of the list with the difficulty
                }
            }
        }.navigationTitle("Workouts")
            .searchable(text: $searchString)
        
        
    }
    
    
}
// we want to be able to
func GroupWorkouts(workouts: [Workout]) -> Void {
    for workout in workouts{
        if workout.TargetMuscleGroup == "Abdominals"{
            // Group workouts
        }
    }
}
#Preview {
    HomeView()
}

// Things we need. database of exciercises
