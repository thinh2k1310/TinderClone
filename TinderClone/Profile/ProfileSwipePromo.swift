//
//  ProfileSwipePromo.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI

struct ProfileSwipePromo: View {
    var body: some View {
        VStack(spacing : 0){
            TabView{
                VStack(spacing : 9){
                    Spacer()
                    Text("Get Tinder Gold")
                        .font(.system(size: 26,weight: .semibold))
                    Text("See who likes you and more !")
                    
                }
                .padding(.bottom,64)
                VStack(spacing : 9){
                    Spacer()
                    Text("Get Matches Faster")
                        .font(.system(size: 26,weight: .semibold))
                    Text("Boost your profile once a month !")
                    
                }
                .padding(.bottom,64)
                VStack(spacing : 9){
                    Spacer()
                    Text("Increase Your Chance")
                        .font(.system(size: 26,weight: .semibold))
                    Text("Boost your profile once a month !")
                    
                }
                .padding(.bottom,64)
            }
            .tabViewStyle(PageTabViewStyle())
            Button(action: {
                
            }, label: {
                Text("My tinder plus".uppercased())
                    .foregroundColor(.red)
                    .font(.system(size: 18,weight: .semibold))
                    .padding(.vertical,20)
                    .padding(.horizontal,50)
                    .background(Color.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.5), radius: 10)
                    .padding(.bottom,30)
            })
        }
    }
}

struct ProfileSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            ProfileSwipePromo()
        }
        .frame(height : 400)
    }
}
