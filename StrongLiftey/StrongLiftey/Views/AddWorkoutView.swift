//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import SwiftUI

struct AddWorkoutView: View {
    
    @ObservedObject var vm: WorkoutViewModel
    
    @Binding var showSheet: Bool
    
    @State var exercises: [Exercise]
    
    @State var title: String = ""
    
    @State var workoutTitle: String = ""
    @State var sets: String = ""
    @State var reps: String = ""
    @State var weight: String = ""
    
    @State var duration:String = ""
    
    var body: some View {
        NavigationStack{
            List{
                Section{
                    TextField("Enter title", text: $title)
                    TextField("Enter duration", text: $duration)
                }
                Section{
                    TextField("Workout", text: $workoutTitle)
                    TextField("Sets", text: $sets)
                    TextField("Reps", text: $reps)
                    TextField("Weight", text: $weight)
                    
                }
                Section{
                    
                    if !(title.isEmpty || workoutTitle.isEmpty || sets.isEmpty || reps.isEmpty || weight.isEmpty){
                        Button{
                            exercises.append(Exercise(description: workoutTitle, reps: Int(reps)!, sets: Int(sets)!, weight: Int(weight)!, button: Int(sets)!))
                            
                            workoutTitle = ""
                            sets = ""
                            reps = ""
                            weight = ""
                        }label: {
                            Text("Add Exercise")
                        }
                    } else{
                        Text("Add Exercise")
                            .foregroundColor(.gray)
                    }
                }
                Section{
                    ForEach(exercises) { exercise in
                        VStack{
                            Text(exercise.description)
                            
                            Text("Sets: \(exercise.sets)")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("Reps: \(exercise.reps)")
                                .frame(maxWidth:.infinity, alignment:.leading)
                            Text("Weight: \(exercise.weight)")
                                .frame(maxWidth:.infinity, alignment:.leading)
                        }
                        
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button{
                        
                        
                        showSheet.toggle()
                        
                    }label: {
                        Text("Cancel")
                    }
                }
            }
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    if exercises.count > 0{
                        
                    Button{
                        vm.workouts.append(Workout(title: title, Duration: duration, exercises: exercises))
                        title = ""
                        showSheet.toggle()

                        }label: {
                            Text("Add")
                        }
                        
                    } else{
                        Text("Add")
                            .foregroundColor(.gray)
                    }
                    
                }
            }
            
        }
        .navigationTitle("Add workout")
        .navigationBarTitleDisplayMode(.inline)
    }
    
}




struct ExerciseInfo: View {
    
    var exercise: Exercise
    
    var body: some View {
        
        VStack() {
            
        }
        
    }
}

struct AddWorkoutView_Previews: PreviewProvider {
    
    @State static var exercises = [Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4), Exercise(description: "Chest press", reps: 4, sets: 4, weight: 80, button: 4)]
    
    @State static var value = false
    
    @State static var vm = WorkoutViewModel()
    
    
    static var previews: some View {
        AddWorkoutView(vm: vm, showSheet: $value, exercises: exercises)
    }
}
