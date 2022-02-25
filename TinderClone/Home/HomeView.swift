//
//  HomeView.swift
//  TinderClone
//
//  Created by Truong Thinh on 07/02/2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject var userMng : UserManager
    @EnvironmentObject var appState : AppStateManager
    
    var body: some View {
        VStack{
            CardStack(people : userMng.cardPeople)
            Spacer()
            HStack{
                CircleButtonView(type: .back, action: {
                    appState.showPurchaseScreen()
                })
                Spacer()
                CircleButtonView(type: .no, action: {
                    if let person = userMng.cardPeople.last{
                        userMng.swipe(person, .no)
                    }
                })
                Spacer()
                CircleButtonView(type: .star, action: {
                    if let person = userMng.cardPeople.last{
                        if userMng.currentUser.goldSubcriber{
                            userMng.supperLike(person)
                        }else{
                            appState.showPurchaseScreen()
                        }
                    }
                })
                Spacer()
                CircleButtonView(type: .heart, action: {
                    if let person = userMng.cardPeople.last{
                        userMng.swipe(person, .like)
                    }
                })
                Spacer()
                CircleButtonView(type: .lightning, action: {
                    appState.showPurchaseScreen()
                })
            }
            .frame(height : 50)
            .padding(.horizontal)
            .padding(.vertical,25)
            Spacer()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
