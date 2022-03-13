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
    
    mutating func setChestExcersise(extecise: ChestExcersise) {
    
    }

    mutating func setLegsExcersise(extecise: LegsExcersise, set: Int, reps: Int, weight: Float) {

    }

    mutating func setBackExcersise(extecise: BackExcersise, set: Int, reps: Int, weight: Float) {

    }
}

struct Excersise {
    var set: Int
    var reps: Int
    var weight: Float
}

enum ChestExcersise {
    case dumbbellBenchPress(Excersise)
    case barbellBenchPress(Excersise)
    case inclineBenchPress(Excersise)
   
}

enum LegsExcersise {
    case squat(Excersise)
    case frontSquat(Excersise)
    case romanianDedlifts(Excersise)
    
}

enum BackExcersise {
    case deadlift(Excersise)
    case pullUps(Excersise)
    case barbelRow(Excersise)
    
}

var training = Training(
    chest: [
        ChestExcersise.barbellBenchPress(Excersise(set: 1, reps: 0, weight: 0)),
        ChestExcersise.dumbbellBenchPress(Excersise.init(set: 1, reps: 0, weight: 0)),
        ChestExcersise.inclineBenchPress(Excersise.init(set: 1, reps: 0, weight: 0))
    ],
    legs: [
        LegsExcersise.squat(Excersise.init(set: 1, reps: 0, weight: 0)),
        LegsExcersise.frontSquat(Excersise.init(set: 1, reps: 0, weight: 0)),
        LegsExcersise.romanianDedlifts(Excersise.init(set: 1, reps: 0, weight: 0))
    ],
    back: [
        BackExcersise.barbelRow(Excersise.init(set: 1, reps: 0, weight: 0)),
        BackExcersise.deadlift(Excersise.init(set: 1, reps: 0, weight: 0)),
        BackExcersise.pullUps(Excersise.init(set: 1, reps: 0, weight: 0))
    ]
)
//Training.setChestExcersise(extecise: .barbellBenchPress(Excersise.init(set: 1, reps: 1, weight: //123.4)))
