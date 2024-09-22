//
//  RetryView.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import SwiftUI

struct RetryView: View {
    let text: String
    let retryActino: () -> ()
    
    var body: some View {
        VStack(spacing: 8) {
            Text(text)
                .font(.callout)
                .multilineTextAlignment(.center)
            
            Button(action: retryActino) {
                Text("Versuche es nochmal")
            }
        }
    }
}

#Preview {
    RetryView(text: "An error occurred.") {
        
    }
}
