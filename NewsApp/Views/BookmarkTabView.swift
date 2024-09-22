//
//  BookmarkTabView.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 22.09.24.
//

import SwiftUI

struct BookmarkTabView: View {
    @EnvironmentObject var articleBookmarkVM: ArticleBookmarkViewModel
    @State var searchText = ""
    
    var body: some View {
        let articles = self.articles
        NavigationStack {
            ArticleListView(articles: articles)
                .overlay(overlayView(isEmpty: articles.isEmpty))
                .navigationTitle("Saved Articles")

        }
        .searchable(text: $searchText)
    }
    
    private var articles: [Article] {
        if searchText.isEmpty {
            return articleBookmarkVM.bookmarks
        }
        return articleBookmarkVM.bookmarks
            .filter{
                $0.title.lowercased().contains(searchText.lowercased()) ||
                $0.desciprionText.lowercased().contains(searchText.lowercased())
            }
    }
    
    @ViewBuilder
    func overlayView(isEmpty: Bool) -> some View {
        if isEmpty {
            EmptyPlaceholderView(text: "No saved articles", image: Image(systemName: "bookmark"))
        }
    }
}

#Preview {
    @Previewable var articleBookmarkVM = ArticleBookmarkViewModel.shared

    BookmarkTabView()
        .environmentObject(articleBookmarkVM)
    
}
