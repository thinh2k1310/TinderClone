//
//  PurchaseSwipePromo.swift
//  TinderClone
//
//  Created by Truong Thinh on 21/01/2022.
//

import SwiftUI

struct PurchaseSwipePromo: View {
    var body: some View {
        TabView {
            VStack {
                Image(systemName: "thermometer.sun.fill")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(height : 75)
                Text("25 people already liked you.")
                    .font(.system(size: 22,weight: .semibold))
                Text("Matches with them instantly")
            }
            VStack {
                Image(systemName: "calendar.badge.plus")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(height : 75)
                Text("25 people already liked you.")
                    .font(.system(size: 22,weight: .semibold))
                Text("Matches with them instantly")
            }
            VStack {
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
                    .frame(height : 75)
                Text("25 people already liked you.")
                    .font(.system(size: 22,weight: .semibold))
                Text("Matches with them instantly")
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct PurchaseSwipePromo_Previews: PreviewProvider {
    static var previews: some View {
        PurchaseSwipePromo()
            .frame(height : UIScreen.main.bounds.height/3)
    }
}
