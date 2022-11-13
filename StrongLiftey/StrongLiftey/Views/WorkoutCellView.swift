//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import SwiftUI

struct CellView: View {
    var workout: Workout
    @State var finished:Bool = false
    
    var body: some View {
        
        
        ZStack {
            Color(red: 255/255, green: 255/255, blue: 255/255)
            VStack{
                HStack{
                    Text("\(workout.title)")
                        .foregroundColor(.secondary)
                    Spacer()
                    Text("INPUT DATE")
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal,20)
                    VStack(spacing: 04){
                        ForEach(workout.exercises) {item in
                            HStack{
                                Text("\(item.description)")
                                    .font(.title3)
                                    .padding(.top,5)
                                Spacer()
                                Text("\(item.sets)x\(item.reps) \(item.weight) lbs")
                                    .font(.title3)
                                    .padding(.top,5)
                        }.padding(.horizontal,20)
                        Divider()
                    }
                }
            }
            .padding(.vertical)
        }
    }
}

struct CellView_Previews: PreviewProvider {
    static var previews: some View {
        CellView(workout: Workout(title: "Lower Split", Duration: "2 Hours", exercises: [Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80)]))
    }
}
