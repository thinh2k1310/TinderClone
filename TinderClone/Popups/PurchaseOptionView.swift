//
//  PurchaseOptionView.swift
//  TinderClone
//
//  Created by Truong Thinh on 21/01/2022.
//

import SwiftUI

struct PurchaseOptionView: View {
    // MARK: - PROPERTIES
    var sub : Subcription
    var isSelected : Bool
    // MARK: - BODY
    var body: some View {
        VStack(spacing : 0) {
            Text("\(sub.month)")
                .font(.system(size: 44,weight: .light))
            Spacer().frame(height:2)
            Text("month\(sub.month > 1 ? "s" : "")")
                .if(isSelected){
                    $0.fontWeight(.bold)
                }
            Spacer().frame(height:2)
            Text("$\(String(format : "%.2f",sub.monthlyCost))/mo")
                .foregroundColor(.textPrimary)
            Spacer().frame(height:10)
            if sub.savePercent != nil {
                Text("SAVE \(sub.savePercent ?? 0)%")
                    .foregroundColor(.yellow)
                    .font(.system(size: 14,weight: .bold))
                    .frame(height : 22)
            }
            else{
                Spacer().frame(height : 22)
            }
            Text("$\(String(format : "%.2f",sub.totalCost))")
                .font(.system(size: 20,weight: .bold ))
        }
        .padding(.horizontal,12)
        .padding(.vertical,18)
        .if(!isSelected){
            $0.foregroundColor(.textPrimary)
        }
        .if(isSelected && sub.tagLine == .none){
            $0.background(
                RoundedRectangle(cornerRadius: 10,style: .continuous)
                    .strokeBorder(.yellow,lineWidth: 1.5)
            )
        }
        .if(isSelected && sub.tagLine != .none){
            $0.overlay(
                ZStack(alignment: .top){
                    Rectangle()
                        .foregroundColor(.yellow)
                        .frame(height : 20)
                        .cornerRadius(10, corners: [.topLeft,.topRight])
                    Text("\(sub.tagLine.rawValue)")
                        .foregroundColor(.white)
                        .font(.system(size: 12,weight: .bold))
                        .lineLimit(1)
                        .padding(.top,2)
                        .padding(.horizontal,6)
                        .minimumScaleFactor(0.1)
                    RoundedRectangle(cornerRadius: 10,style: .continuous)
                        .strokeBorder(.yellow,lineWidth: 1.5)
                }
            )
        }
    }
}

struct PurchaseOptionView_Previews: PreviewProvider {
    static var previews: some View{
        HStack{
            PurchaseOptionView(sub: Subcription.example,isSelected: true)
            PurchaseOptionView(sub: Subcription.example1,isSelected: false)
            PurchaseOptionView(sub: Subcription.example2,isSelected: true)
        }
    }
}
