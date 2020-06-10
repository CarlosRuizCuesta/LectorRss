//
//  NewsApi.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class NewsApi {
    static var PARAM_SEARCH : String = "q"
    static var PARAM_SORT : String = "sortBy"
    static var PARAM_API : String = "apiKey"
    static var URL : String = "https://newsapi.org/v2/everything"
    static var API = "619e89b805954fcf8cbbe753b221bcf2"
    
    var search : String = "ios"
    var sortBy : String = "publishedAt"
    var url = URLComponents(string: URL)
    var parameters: [String: Any]!
    
    
    init() {
        
        url?.queryItems = [
            URLQueryItem(name: NewsApi.PARAM_SEARCH, value: search),
            URLQueryItem(name: NewsApi.PARAM_SORT, value: sortBy),
            URLQueryItem(name: NewsApi.PARAM_API, value: NewsApi.API)
        ]
    }
}
