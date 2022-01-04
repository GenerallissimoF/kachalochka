//
//  Model.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 31.12.2021.
//

import Foundation

struct Training {
    

    
    var chest: [ChestExcersise]
    var legs: [LegsExcersise]
    var back: [BackExcersise]
  
   
}

struct Excersise {
    var set: Int
    var reps: Int
    var weight: Int
}

enum ChestExcersise: String {
    case dumbbellBenchPress = "жим гантелями"
    case barbellBenchPress = "жим штанги"
    case inclineBenchPress = "жим под наклоном"
}

enum LegsExcersise {
    case squat(sets: Int, reps: Int)
    case frontSquat(sets: Int, reps: Int)
    case romanianDedlifts(sets: Int, reps: Int)
}

enum BackExcersise {
    case deadlift(sets: Int, reps: Int)
    case pullUps(sets: Int, reps: Int)
    case barbelRow(sets: Int, reps: Int)
    
}
let training = Training(chest: [ChestExcersise.barbellBenchPress, ChestExcersise.dumbbellBenchPress, ChestExcersise.inclineBenchPress],  legs: [LegsExcersise.squat(sets: 0, reps: 0), LegsExcersise.frontSquat(sets: 0, reps: 0), LegsExcersise.romanianDedlifts(sets: 0, reps: 0)] , back: [BackExcersise.barbelRow(sets: 0, reps: 0), BackExcersise.deadlift(sets: 0, reps: 0), BackExcersise.pullUps(sets: 0, reps: 0)])


    
