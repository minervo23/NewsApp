//
//  Article.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import Foundation

fileprivate let releaseDateFormatter = RelativeDateTimeFormatter()

struct Article {
    let source: Source
    let title: String
    let url: String
    let publishedAt: Date

    let author: String?
    let description: String?
    let urlToImage: String?
    
    var authorText: String {
        author ?? ""
    }
    
    var desciprionText: String {
        description ?? ""
    }
    
    var captionText: String {
        "\(source.name) • \(releaseDateFormatter.localizedString(for: publishedAt, relativeTo: Date()))"
    }
    
    var articleUrl: URL {
        URL(string: url)!
    }
    
    var imageUrl: URL? {
        guard let urlToImage = urlToImage else { return nil }
        return URL(string: urlToImage)
    }
}

extension Article: Codable {}
extension Article: Equatable {}
extension Article: Identifiable {
    var id: String { url }
}

extension Article {
    
    static var previewData: [Article] {
        let previewDataURL = Bundle.main.url(forResource: "news", withExtension: "json")!
        let data = try! Data(contentsOf: previewDataURL)
        
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601
        
        let apiRespone = try! jsonDecoder.decode(NewsAPIResponse.self, from: data)
        return apiRespone.articles ?? []
    }
}

struct Source {
    let name: String
}

extension Source: Codable {}
extension Source: Equatable {}

