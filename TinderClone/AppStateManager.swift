//
//  AppStateManager.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import Foundation

class AppStateManager : ObservableObject {
    @Published var selectedTab : TabBarButtonType = .fire
    @Published var showPersonalProfile : Person? = nil
    @Published var showPurchasePopup : Bool = false
    
    func showPersonalProfile (_ person : Person){
        showPersonalProfile = person
    }
    func showPurchaseScreen(){
        showPurchasePopup = true
    }
}
