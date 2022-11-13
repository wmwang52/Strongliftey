//
//  StrongLifteyApp.swift
//  StrongLiftey
//
//  Created by William Wang on 11/10/22.
//

import SwiftUI

struct StrongLifteyTabView: View {
    var body: some View {
        TabView {
            HomeWorkoutPage()
                .tabItem {
                    Label("Menu", systemImage: "list.dash")
                }   
        }
    }
}

struct StrongLifteyTabView_Previews: PreviewProvider {
    static var previews: some View {
        StrongLifteyTabView()
    }
}
