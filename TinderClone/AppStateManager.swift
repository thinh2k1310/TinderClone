//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import Foundation

class AppStateManager : ObservableObject {
    @Published var selectedTab : TabBarButtonType = .fire
}
