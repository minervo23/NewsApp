//
//  SearchTabView.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 22.09.24.
//

import SwiftUI

struct SearchTabView: View {
    @StateObject var searchVM = ArticleSearchViewModel.shared
    
    
    var body: some View {
        NavigationStack {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .navigationTitle("Search")
        }
        .searchable(text: $searchVM.searchQuery) {
            suggestionsView
        }
        .onChange(of: searchVM.searchQuery) { _, newValue in
            if newValue.isEmpty {
                searchVM.phase = .empty
            }
        }
        .onSubmit(of: .search, search)
    }
    
    private var articles: [Article] {
        if case .success(let articles) = searchVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch searchVM.phase {
        case .empty:
            if !searchVM.searchQuery.isEmpty {
                ProgressView()
            } else if !searchVM.history.isEmpty {
                SearchHistoryListView(searchVM: searchVM) { newValue in
                    searchVM.searchQuery = newValue
                }
            } else {
                EmptyPlaceholderView(text: "Type your query to search from NewsAPI", image: Image(systemName: "magnifyingglass"))
            }
            
        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                search()
            }
            
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "No search results found", image: Image(systemName: "magnifyingglass"))

        default: EmptyView()
        }
    }
    
    @ViewBuilder
    private var suggestionsView: some View {
        ForEach(["BTC", "Apple", "PS5", "Mindest"], id: \.self){ text in
            Button {
                searchVM.searchQuery = text
            } label: {
                Text(text)
            }
        }
    }
    
    private func search() {
        let searchQuery = searchVM.searchQuery.trimmingCharacters(in: .whitespacesAndNewlines)
        if !searchQuery.isEmpty {
            searchVM.addHistory(searchQuery)
        }
    
        Task.init {
            await searchVM.searchArticles()
        }
    }
}

#Preview {
    SearchTabView()
}
