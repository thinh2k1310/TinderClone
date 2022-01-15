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
    // MARK: - FUNCTION
    func correctViewForState() -> some View {
        switch appState.selectedTab{
        case .fire:
            let view = Text("fire")
            return AnyView(view)
        case .star:
            let view = Text("star")
            return AnyView(view)
        case .message:
            let view = Text("message")
            return AnyView(view)
        case .profile:
            let view = Text("profile")
            return AnyView(view)
        }
    }
    var body: some View {
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
            
        }//:ZSTACK
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(AppStateManager())
    }
}
