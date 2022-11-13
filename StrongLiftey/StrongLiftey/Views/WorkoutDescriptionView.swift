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
                    
                    ForEach(workout.exercises){ item in
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text(item.description)
                                    .font(.title3)
                                    .padding(.bottom,5)
                                
                                Spacer()
                                Text("\(item.sets)x\(item.reps) \(item.weight) lbs")
                                    .font(.title3)
                                    .padding(.bottom,5)
                            }
                            HStack{
                                ForEach(0..<item.sets){_ in
                                     
                                    Button{
                                        Text("HEllo")
                                    }label: {
                                        ZStack{
                                            
                                            Circle()
                                                .frame(width: 50,height: 50)
                                            Text("\(item.reps)")
                                                .foregroundColor(.white)
                                                .font(.system( size: 25.0))
                                        }
                                        
                                    }
                                }
                            }
                        }
                        .padding(.horizontal,20)
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
