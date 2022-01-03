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

enum ChestExcersise {
    case dumbbellBenchPress(sets: Int, reps: Int)
    case barbellBenchPress(sets: Int, reps: Int)
    case inclineBenchPress(sets: Int, reps: Int)
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
let training = Training(chest: [ChestExcersise.barbellBenchPress(sets: 0, reps: 0), ChestExcersise.dumbbellBenchPress(sets: 0, reps: 0), ChestExcersise.inclineBenchPress(sets: 0, reps: 0)],  legs: [LegsExcersise.squat(sets: 0, reps: 0), LegsExcersise.frontSquat(sets: 0, reps: 0), LegsExcersise.romanianDedlifts(sets: 0, reps: 0)] , back: [BackExcersise.barbelRow(sets: 0, reps: 0), BackExcersise.deadlift(sets: 0, reps: 0), BackExcersise.pullUps(sets: 0, reps: 0)])


    
