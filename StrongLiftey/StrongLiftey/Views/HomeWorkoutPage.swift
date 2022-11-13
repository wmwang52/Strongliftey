//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//


//rgba(242,241,247,255)
import SwiftUI

struct HomeWorkoutPage: View {
    
    var weekdays = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    var examples = Workout.example
    @State var showWorkout = false
    
    @StateObject var vm = WorkoutViewModel()
    
    @State var showSheet = false
    
    var body: some View {
        NavigationStack {
            
            ZStack {
                
                Color(red: 222/255, green: 221/255, blue: 227/255)
                    .ignoresSafeArea()
                
                ScrollView {
                    
                    ZStack{
                        Color(red: 255/255, green: 255/255, blue: 255/255)

                    }.frame(height: 110)
                        .cornerRadius(20)
                        .padding(.horizontal, 10)
                    
                    VStack{
                        ForEach(examples, id: \.id) { workout in
                            
                            NavigationLink {
                                DescriptionView(workout: workout)
                            } label: {
                                
                                CellView(workout: workout)
                                    .foregroundColor(.black)
                            }
                            .cornerRadius(20)
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
                                .foregroundColor(.white)
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

//            List(vm.workouts, id: \.id) { workout in
//
//                NavigationLink {
//                    DescriptionView(workout: workout)
//
//                } label: {
//
//                    CellView(workout: workout)
//                }.ignoresSafeArea()
//
//            }
//            .listStyle(.inset)
//            .sheet(isPresented: $showSheet) {
//                AddWorkoutView(vm: vm, showSheet: $showSheet, exercises: [])
//            }.toolbar{
//                Button{
//                    showSheet.toggle()
//                }label: {
//                    Image(systemName: "plus")
//                        .bold()
//                }
//
//            }

