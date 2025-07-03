//
//  Import.swift
//  GymLogg
//
//  Created by Muhammed-Sharif Adepetu on 7/1/25.
//

import Foundation

struct Workout:  Identifiable {
    var Exercise: String = ""
    var Difficulty: String = ""
    var TargetMuscleGroup: String = ""
    var PrimeMoverMuscle: String = ""
    var SecondaryMuscle: String = ""
    var Equipment: String = ""
    var Mechanics: String = ""
    var id = UUID()
    
    var Sets: [Int] = [0]
    var Reps: [Int] = [0]
    var Weight: [Int] = [0]
    
    init(raw: [String]){
        Exercise =  raw[0]
        Difficulty = raw[3]
        TargetMuscleGroup = raw[4]
    }
}
 
func loadCSV(from csvName: String) -> [Workout]{
    var csvToStruct = [Workout]()
    
    guard let filePath = Bundle.main.path(forResource: csvName, ofType: "csv") else {
        return []
    }
    
    var data = ""
    do{
        data = try String(contentsOfFile: filePath)
    } catch { print(error)
        return []
    }
    // remove header rows
    
    var rows = data.components(separatedBy: "\n")
    let columnCount = rows.first?.components(separatedBy: ",").count
    rows.removeFirst()
    
    for row in rows {
        let columns = row.components(separatedBy: ",")
        let workoutStruct = Workout.init(raw: columns)
        csvToStruct.append(workoutStruct)
    }
    
    return csvToStruct
}
