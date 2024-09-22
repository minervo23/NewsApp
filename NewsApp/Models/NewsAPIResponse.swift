//
//  NewsAPIResponse.swift
//  NewsApp
//
//  Created by Batuhan Kabaktepe on 21.09.24.
//

import Foundation

struct NewsAPIResponse: Decodable {
    let status: String
    let totalResults: Int?
    let articles: [Article]?
    
    let code: String?
    let message: String?
}
