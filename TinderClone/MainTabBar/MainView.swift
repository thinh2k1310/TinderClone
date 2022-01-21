//
//  MainView.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var appState : AppStateManager
    @EnvironmentObject var userMng : UserManager
    // MARK: - FUNCTION
    func correctViewForState() -> some View {
        switch appState.selectedTab{
        case .fire:
            let view = Text("fire")
            return AnyView(view)
        case .star:
            let view = MatchesView()
            return AnyView(view)
        case .message:
            let view = MessageListView()
            return AnyView(view)
        case .profile:
            let view = ProfileView()
            return AnyView(view)
        }
    }
    var body: some View {
        NavigationView {
            ZStack{
                Color(.systemGray6)
                    .opacity(0.35)
                    .edgesIgnoringSafeArea(.vertical)
                VStack{
                    HStack{
                        Spacer()
                        TabBarButtonView(type : .fire)
                        Spacer()
                        TabBarButtonView(type : .star)
                        Spacer()
                        TabBarButtonView(type : .message)
                        Spacer()
                        TabBarButtonView(type : .profile)
                        Spacer()
                    }//:HSTACK
                    .padding(.top,30)
                    .frame(height : 100)
                    correctViewForState()
                    Spacer()
                }//:VSTACK
                .edgesIgnoringSafeArea(.vertical)
                
                if (appState.showPurchasePopup){
                    PurchasePopup(isVisible: $appState.showPurchasePopup)
                        .animation(.spring(response: 0.3, dampingFraction: 0.75, blendDuration: 0.5))
                        .transition(.offset(y : 800))
                        
                }
                
            }
            .navigationBarHidden(true)
        }//:ZSTACK
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
            .environmentObject(UserManager())
    }
}
