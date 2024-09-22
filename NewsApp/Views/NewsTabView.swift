//
//  NewsTabView.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import SwiftUI

struct NewsTabView: View {
    @StateObject var articleNewsVM = ArticleNewsViewModel()
    
    var body: some View {
        NavigationStack {
            ArticleListView(articles: articles)
                .overlay(overlayView)
                .task(id: articleNewsVM.fetchTaskToken) {
                    await loadTask()
                }
                .refreshable {
                    refreshTask()
                }
                .navigationTitle(articleNewsVM.fetchTaskToken.category.text)
                .navigationBarItems(trailing: menu)
        }
    }
    
    @ViewBuilder
    private var overlayView: some View {
        switch articleNewsVM.phase {
        case .empty: ProgressView()
        case .success(let articles) where articles.isEmpty:
            EmptyPlaceholderView(text: "Keine Artikel gefunden", image: nil)
        case .failure(let error):
            RetryView(text: error.localizedDescription) {
                refreshTask()
            }
            
        default: EmptyView()
        }
    }
    
    private var articles: [Article] {
        if case let .success(articles) = articleNewsVM.phase {
            return articles
        } else {
            return []
        }
    }
    
    private func loadTask() async {
        do {
            try await articleNewsVM.loadArticles()
        } catch {
            print("Error fetching articles: \(error.localizedDescription)")
        }
    }
    
    private func refreshTask(){
        articleNewsVM.fetchTaskToken = FetchTaskToken(category: articleNewsVM.fetchTaskToken.category, token: Date())
    }
    
    private var menu: some View {
        Menu {
            Picker("Category", selection: $articleNewsVM.fetchTaskToken.category) {
                ForEach(Category.allCases) {
                    Text($0.text).tag(0)
                }
            }
        } label: {
            Image(systemName: "line.3.horizontal.decrease.circle")
                .imageScale(.large)
        }
    }
}

#Preview {
    @Previewable var articleBookmarkVM = ArticleBookmarkViewModel.shared

    NewsTabView(articleNewsVM: ArticleNewsViewModel(articles: Article.previewData))
        .environmentObject(articleBookmarkVM)
}
