//
//  EmptyPlaceholderView.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import SwiftUI

struct EmptyPlaceholderView: View {
    let text: String
    let image: Image?
        
    var body: some View {
        VStack(spacing: 8) {
            Spacer()
            if let image {
                image
                    .imageScale(.large)
                    .font(.system(size: 50))
                    
            }
            Text(text)
            Spacer()
        }
    }
}

#Preview {
    EmptyPlaceholderView(text: "No Bookmarks", image: Image(systemName: "bookmark"))
}
