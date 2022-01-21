//
//  Subcription.swift
//  TinderClone
//
//  Created by Truong Thinh on 21/01/2022.
//

import Foundation
struct Subcription : Identifiable {
    let id = UUID()
    var month : Int
    var monthlyCost : Double
    var totalCost : Double
    var savePercent : Int?
    var tagLine : TagLine = .none
    enum TagLine : String{
        case mostPopular = "MOST POPULAR"
        case bestValue = "BEST VALUE"
        case none
    }
}
extension Subcription{
    static let example = Subcription(month: 6, monthlyCost: 15.00, totalCost: 89.99, savePercent: 50,tagLine: .bestValue)
    static let example1 = Subcription(month: 3, monthlyCost: 20.00 , totalCost: 59.99, savePercent: 30,tagLine: .mostPopular)
    static let example2 = Subcription(month: 1, monthlyCost: 29.00, totalCost: 29.00)
}
