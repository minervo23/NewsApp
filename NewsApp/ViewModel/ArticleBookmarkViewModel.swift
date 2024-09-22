//
//  ArticleBookmarkViewModel.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 22.09.24.
//

import SwiftUI

@MainActor
class ArticleBookmarkViewModel: ObservableObject {
    @Published private(set) var bookmarks: [Article] = []
    private let bookmarkStore = PlistDataStore<[Article]>(filename: "bookmarks")
    
    static var shared = ArticleBookmarkViewModel()
    
    private init() {
        Task.init {
            await load()
        }
    }
    
    private func load() async {
        bookmarks = await bookmarkStore.load() ?? []
    }
    
    func isBookmarked(for article: Article) -> Bool {
        bookmarks.first(where: { $0.id == article.id }) != nil
    }
    
    func addBookmark(for article: Article) {
        guard !isBookmarked(for: article) else {
            return
        }
        
        bookmarks.insert(article, at: 0)
        bookmarkUpdated()
    }
    
    func removeBookmark(for article: Article) {
        guard let index = bookmarks.firstIndex(of: article) else {
            return
        }
        
        bookmarks.remove(at: index)
        bookmarkUpdated()
    }
    
    private func bookmarkUpdated() {
        let bookmark = self.bookmarks
        Task.init {
            await bookmarkStore.save(bookmark)
        }
    }
}
