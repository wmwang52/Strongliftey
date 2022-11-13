//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import Foundation

struct Workout: Identifiable {
    
    let id = UUID()
    
    var title: String
    
    var Duration:String
    
    
    var exercises: [Exercise]
    
}

extension Workout {
    
    static var example: [Workout] {
        [Workout(title: "Chest/tri", Duration: "2 Hours", exercises:
                    [Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4),
                                                            
                     Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4),
                                                           
                     Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4)])]
    }
    
}
