//
//  ContentView.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var mng : AppStateManager = AppStateManager()
    @ObservedObject var userMng : UserManager = UserManager()
    var body: some View {
        MainView()
            .environmentObject(mng)
            .environmentObject(userMng)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
