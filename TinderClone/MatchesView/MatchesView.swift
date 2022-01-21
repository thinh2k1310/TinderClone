//
//  MatchesView.swift
//  TinderClone
//
//  Created by Truong Thinh on 20/01/2022.
//

import SwiftUI

struct MatchesView: View {
    // MARK: - PROPERTIES
    @EnvironmentObject var userMng : UserManager
    @EnvironmentObject var appState : AppStateManager
    @State var selectedTab : MatchesTab = .likes
    enum MatchesTab{
        case likes
        case topPicks
    }
    private var buttonText : String{
        if selectedTab == .likes{
            return "SEE WHO LIKED YOU"
        }else{
            return "UNLOCK TOP PICKS"
        }
    }
    // MARK: - FUNCTION
    private func buttonAction(){
        appState.showPurchaseScreen()
    }
    // MARK: - BODY
    
    var body: some View {
        VStack(spacing : 0){
            HStack{
                Spacer()
                Button(action: {
                    selectedTab = .likes
                }, label: {
                    Text("\(userMng.matches.count) Likes")
                        .font(.system(size: 20, weight: .semibold))
                        .if(selectedTab == .topPicks, transform: {
                            $0.foregroundColor(.textPrimary)
                        })
                })
                    .buttonStyle(PlainButtonStyle())
                    .frame(width : 120)
                Spacer()
                Button(action: {
                    selectedTab = .topPicks
                }, label: {
                    Text("\(userMng.topPicks.count) Top Picks")
                        .font(.system(size: 20, weight: .semibold))
                        .if(selectedTab == .likes, transform: {
                            $0.foregroundColor(.textPrimary)
                        })
                })
                    .buttonStyle(PlainButtonStyle())
                    .frame(width : 120)
                Spacer()
            }//:HSTACK
            Divider()
                .padding(.vertical,15)
            if(selectedTab == .likes){
                LikesView()
            }else{
                TopPicksView()
            }
            Spacer()
        }//:VSTACK
        .overlay(
            Button(action: {
                buttonAction()
            }, label: {
                Text(buttonText)
                    .frame(width:230)
                    .padding(.vertical,15)
                    .padding(.horizontal,30)
                    .font(.system(size: 22,weight: .bold))
                    .foregroundColor(.white)
                    .background(Color.yellow)
                    .cornerRadius(30)
            })
                .buttonStyle(PlainButtonStyle())
                .padding(.bottom,30)
            ,alignment: .bottom
        )
    }
}

struct MatchesView_Previews: PreviewProvider {
    static var previews: some View {
        MatchesView()
            .environmentObject(UserManager())
            .environmentObject(AppStateManager())
    }
}
