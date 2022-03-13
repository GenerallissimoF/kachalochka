//
//  Model.swift
//  kachalochka
//
//  Created by Ivan Adoniev on 31.12.2021.
//

import Foundation

struct Training: Codable {
    
    var chest: [ChestExcersise]
    var legs: [LegsExcersise]
    var back: [BackExcersise]
    
    mutating func setDumbbellBenchPress(set: Int, reps: Int, weight: Float) {
        let newExcersise = Excersise(set: set, reps: reps, weight: weight)
        
        save(training: self)
    }
    
    mutating func addDumbbellBenchPress(set: Int) {
        
    }
    
    mutating func removeDumbbellBenchPress(set: Int) {
        
    }
    
    mutating func setBarbellBenchPress(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setInclineBenchPress(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setSquat(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setFrontSquat(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setRomanianDedlifts(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setDeadlift(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setPullUps(set: Int, reps: Int, weight: Float) {
        
    }
    
    mutating func setBarbelRow(set: Int, reps: Int, weight: Float) {
        
    }
}

struct Excersise: Codable {
    var set: Int
    var reps: Int
    var weight: Float
}

enum ChestExcersise: Codable {
    case dumbbellBenchPress([Excersise])
    case barbellBenchPress([Excersise])
    case inclineBenchPress([Excersise])
   
}

enum LegsExcersise: Codable {
    case squat([Excersise])
    case frontSquat([Excersise])
    case romanianDedlifts([Excersise])
    
}

enum BackExcersise: Codable {
    case deadlift([Excersise])
    case pullUps([Excersise])
    case barbelRow([Excersise])
}

func initTraining() {
    if let trainingData = UserDefaults.standard.object(forKey: "training") as? Data {
        let decoder = JSONDecoder()
        if let loadedTraining = try? decoder.decode(Training.self, from: trainingData) {
            training = loadedTraining
        }
    }
}

func save(training: Training) {
    let encoder = JSONEncoder()
    if let encoded = try? encoder.encode(training) {
        UserDefaults.standard.set(encoded, forKey: "training")
    }
}

var training = Training(
    chest: [
        ChestExcersise.barbellBenchPress([Excersise(set: 1, reps: 0, weight: 0)]),
        ChestExcersise.dumbbellBenchPress([Excersise.init(set: 1, reps: 0, weight: 0)]),
        ChestExcersise.inclineBenchPress([Excersise.init(set: 1, reps: 0, weight: 0)])
    ],
    legs: [
        LegsExcersise.squat([Excersise.init(set: 1, reps: 0, weight: 0)]),
        LegsExcersise.frontSquat([Excersise.init(set: 1, reps: 0, weight: 0)]),
        LegsExcersise.romanianDedlifts([Excersise.init(set: 1, reps: 0, weight: 0)])
    ],
    back: [
        BackExcersise.barbelRow([Excersise.init(set: 1, reps: 0, weight: 0)]),
        BackExcersise.deadlift([Excersise.init(set: 1, reps: 0, weight: 0)]),
        BackExcersise.pullUps([Excersise.init(set: 1, reps: 0, weight: 0)])
    ]
)
//Training.setChestExcersise(extecise: .barbellBenchPress(Excersise.init(set: 1, reps: 1, weight: //123.4)))
