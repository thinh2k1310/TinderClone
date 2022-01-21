//
//  SwiftUIView.swift
//  TinderClone
//
//  Created by Truong Thinh on 20/01/2022.
//

import SwiftUI

struct TopPicksView : View {
    // MARK: - PROPERTIES
    @EnvironmentObject var userMng : UserManager
    @EnvironmentObject var appState : AppStateManager
    private var user : User{
        return userMng.currentUser
    }
    // MARK: - FUNCTION
    func personTapped(_ person : Person){
        if user.goldSubcriber{
            appState.showPersonalProfile(person)
        }else{
            appState.showPurchaseScreen()
        }
    }
    
    // MARK: - BODY
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if !user.goldSubcriber {
                Text("Upgrade to Gold to see more top picks")
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .foregroundColor(.textTilte)
                    .font(.system(size: 16,weight: .medium))
                    .padding(.horizontal,40)
                    .padding(.vertical,25)
                    .frame(height:100)

            }
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible())],
                      alignment: .center,
                      spacing: 10,
                      pinnedViews: [],
                      content: {
                ForEach(userMng.matches){ person in
                    PersonSquare(person: person, blur: !user.goldSubcriber)
                        .frame(height : 240)
                        .onTapGesture {
                            personTapped(person)
                        }
                }
            })
                .padding(.horizontal,8)
        }
    }
}

struct TopPicksView_Previews: PreviewProvider {
    static var previews: some View {
        TopPicksView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}

