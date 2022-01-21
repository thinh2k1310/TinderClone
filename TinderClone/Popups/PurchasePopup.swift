//
//  PurchasePopup.swift
//  TinderClone
//
//  Created by Truong Thinh on 20/01/2022.
//

import SwiftUI

struct PurchasePopup: View {
    // MARK: - PROPERTIES
    let screen = UIScreen.main.bounds
    @Binding var isVisible : Bool
    let subs : [Subcription] = [
        Subcription.example,Subcription.example1,Subcription.example2
    ]
    @State private var selectedIndex : Int = 4
    
    // MARK: - FUNCTIONS
    func processPayment(){
        
    }
    // MARK: - BODY
    var body: some View {
        GeometryReader { geo in
            VStack {
                VStack{
                    Text("Get Tinder Gold")
                        .foregroundColor(.yellow)
                        .font(.system(size: 25,weight: .bold))
                    PurchaseSwipePromo()
                        .frame(height : geo.size.height/3)
                        .padding(.top,-35)
                    HStack{
                        ForEach(subs.indices){ index in
                            let sub = subs[index]
                            PurchaseOptionView(sub: sub, isSelected: index == selectedIndex)
                                .onTapGesture {
                                    selectedIndex = index
                                }
                        }
                    }
                    Spacer()
                    Button(action: {
                        processPayment()
                    }, label: {
                        ZStack {
                            Color.yellow
                                .cornerRadius(45)
                            Text("CONTINUE")
                                .foregroundColor(.white)
                            .font(.system(size: 20,weight: .heavy))
                        }
                    })
                        .frame(height : 50)
                        .padding(.top,12)
                        .padding(.horizontal,25)
                    Button(action: {
                        isVisible = false
                    }, label: {
                        Text("NO THANKS")
                            .foregroundColor(.textPrimary)
                            .font(.system(size: 20,weight: .heavy))
                    })
                        .padding(.vertical,18)
                }
                .frame(width : geo.size.width)
                .padding(.vertical,20)
                .background(RoundedRectangle(cornerRadius: 25,style: .continuous)
                                .foregroundColor(.white)
                )
                Spacer()
                VStack(spacing : 4){
                    Text("Title")
                        .font(.system(size: 15,weight: .semibold))
                        .foregroundColor(.white)
                    Text("Subtilte")
                        .font(.system(size: 15,weight: .medium))
                        .foregroundColor(.white.opacity(0.5))
                        .multilineTextAlignment(.center)
                }
                .padding(.horizontal,5)
                .padding(.bottom,20)
                Spacer()
            }
            .background(.black)
        }
    }
}

struct PurchasePopup_Previews: PreviewProvider {
    static var previews: some View {
        PurchasePopup(isVisible: .constant(true))
    }
}
