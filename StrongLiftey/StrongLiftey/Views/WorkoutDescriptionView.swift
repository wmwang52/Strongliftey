//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import SwiftUI

struct DescriptionView: View {
    @State var workout: Workout
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color(red: 255/255, green: 255/255, blue: 255/255)
                    .ignoresSafeArea()
                
                    .navigationTitle("\(workout.title)")
                    .navigationBarTitleDisplayMode(.inline)
                VStack{
                    ForEach(workout.exercises.indices){ item in
                        
                        VStack(alignment: .leading){
                            HStack{
                                Text(workout.exercises[item].description)
                                    .font(.title3)
                                    .padding(.bottom,5)
                                
                                Spacer()
                                Text("\(workout.exercises[item].sets)x\(workout.exercises[item].reps) \(workout.exercises[item].weight) lbs")
                                    .font(.title3)
                                    .padding(.bottom,5)
                            }
                            HStack{
                        
                             
                                   
                                    Button{
                                        if workout.exercises[item].button > 0{
                                            workout.exercises[item].button -= 1
                                        }
                                    }label: {
                                        ZStack{
                                            
                                            Rectangle()
                                                .frame(width: .infinity,height: 70)
                                                .foregroundColor(Color(red: 75/255, green: 156/255, blue: 211/255))
                                                .cornerRadius(20)
                                                .opacity(Double(workout.exercises[item].button)/Double(workout.exercises[item].sets))
                                            if workout.exercises[item].button > 0{
                                                Text("Sets left \(workout.exercises[item].button)")
                                                
                                                    .foregroundColor(.black)
                                                    .font(.system( size: 25.0))
                                            } else{
                                                Text("You're done!")
                                                    .foregroundColor(.black)
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
    @State static var vm = WorkoutViewModel()
    static var previews: some View {
        DescriptionView(workout: Workout(title: "Lower Split", Duration: "2 Hours", exercises: [Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4)]))
    }
}
