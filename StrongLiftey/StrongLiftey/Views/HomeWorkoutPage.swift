//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//


//rgba(242,241,247,255)
import SwiftUI

struct HomeWorkoutPage: View {
    
    var examples = Workout.example
    @State var showWorkout = false
    
    @StateObject var vm = WorkoutViewModel()
    
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color(red: 242/255, green: 241/255, blue: 247/255)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    VStack{
                        ForEach(vm.workouts, id: \.id) { workout in
                            
                            NavigationLink {
                                DescriptionView(workout: workout)
                            } label: {
                                
                                CellView(workout: workout)
                                    .foregroundColor(.black)
                            }
                            .cornerRadius(10)
                            .padding([.horizontal,.top], 10)
                            
                            
                        }
                        
                    }
                    .sheet(isPresented: $showSheet) {
                        AddWorkoutView(vm: vm, showSheet: $showSheet, exercises: [])
                    }
                    .toolbar{
                        Button{
                            showSheet.toggle()
                        }label: {
                            Image(systemName: "plus")
                                .bold()
                                .foregroundColor(.blue)
                        }
                    }
                    .navigationTitle("Workouts")
                    .navigationBarTitleDisplayMode(.inline)
                }
               
            }
            
        }
        
    }
    
}



struct HomeWorkoutPage_Previews: PreviewProvider {
    static var previews: some View {
        HomeWorkoutPage()
    }
}
