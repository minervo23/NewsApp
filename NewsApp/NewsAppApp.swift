//
//  NewsAppApp.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import SwiftUI

@main
struct NewsAppApp: App {
    @StateObject var articleBookmarkVM = ArticleBookmarkViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(articleBookmarkVM)
        }
    }
}
