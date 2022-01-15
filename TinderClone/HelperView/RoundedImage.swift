//
//  RoundedImage.swift
//  TinderClone
//
//  Created by Truong Thinh on 15/01/2022.
//

import SwiftUI
import Kingfisher

struct RoundedImage: View {
    // MARK: - PROPERTIES
    var url : URL?
    // MARK: - BODY
    var body: some View {
        KFImage(url)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
}

struct RoundedImage_Previews: PreviewProvider {
    static var previews: some View {
        RoundedImage(url : URL(string: "https://picsum.photos/400"))
    }
}
