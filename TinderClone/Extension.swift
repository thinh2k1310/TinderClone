//
//  Extension.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI

extension View {
    @ViewBuilder
    func `if`<Transform : View>(
        _ condition : Bool, transform : (Self) -> Transform
    ) -> some View {
        if condition{
            transform(self)
        }else{
            self
        }
    }
}
