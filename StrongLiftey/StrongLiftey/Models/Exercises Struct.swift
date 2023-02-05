//
//  Exercises Struct.swift
//  StrongLiftey
//
//  Created by William Wang on 2/4/23.
//

struct Exercise: Identifiable, Hashable {
    
    let id = UUID()
    
    var description: String
    
    var reps: Int
    var sets: Int
    var weight: Int
    
    var button :Int
    
    var ButtonToggle:Bool = false
}
