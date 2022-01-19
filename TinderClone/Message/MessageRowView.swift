//
//  MessageRowView.swift
//  TinderClone
//
//  Created by Truong Thinh on 19/01/2022.
//

import SwiftUI
import Kingfisher

struct MessageRowView: View {
    // MARK: - PROPERTIES
    var preview : MessagePreview
    // MARK: - BODY
    var body: some View {
        HStack {
            RoundedImage(url: preview.person.imageURLS.first)
                .frame(height : 100)
            Spacer()
                .frame(width:15)
            VStack(alignment: .leading, spacing: 8) {
                Text(preview.person.name)
                    .font(.system(size: 25,weight: .semibold))
                Text(preview.lastMessage)
                    .foregroundColor(.textPrimary)
                    .lineLimit(1)
                
            }
        }
    }
}

struct MessageRowView_Previews: PreviewProvider {
    static var previews: some View {
        MessageRowView(preview: MessagePreview.example)
    }
}
