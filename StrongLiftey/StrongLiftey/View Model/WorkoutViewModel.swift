//
//  WorkoutViewModel.swift
//  StrongLiftey
//
//  Created by William Wang on 11/12/22.
//

import Foundation

class WorkoutViewModel: ObservableObject {
    
    @Published var workouts: [Workout] = []
    
}
