//
//  TinderCloneApp.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI

@main
struct TinderCloneApp: App {
    @ObservedObject var userMng : UserManager = UserManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
