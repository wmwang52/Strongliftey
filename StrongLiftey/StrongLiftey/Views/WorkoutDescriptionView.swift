//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import SwiftUI

struct DescriptionView: View {
    var workout: Workout
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 255/255, green: 255/255, blue: 255/255)
                    .ignoresSafeArea()
                VStack{
                    Text("\(workout.title)")
                        .font(.largeTitle)
                    .overlay{
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray, lineWidth: 4)
                    }
                    
                    ForEach(workout.exercises,id:\.self){ item in
                        
                        VStack(alignment: .leading){
                            Text(item.description)
                            HStack{
                                Text("Sets: \(item.sets)")
                                    .foregroundColor(.gray)
                                Text("Weight: \(item.weight) lbs")
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(.gray)
                                Text("Reps: \(item.reps)")
                                    .foregroundColor(.gray)
                            }
                            .padding(.top,10)
                        }
                        .padding(20)
                    }
                    Spacer()
                }
            }
        }
    }
}

func returnVolume(item:Workout) -> Int{
    var temp = 0
    for value in item.exercises{
        temp += value.weight * value.reps * value.sets
    }
    return temp
}

struct DescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        DescriptionView(workout: Workout(title: "Lower Split", Duration: "2 Hours", exercises: [Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80)]))
    }
}
