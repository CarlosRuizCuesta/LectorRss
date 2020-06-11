//
//  NewsApiNews.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class NewsApiNews : Codable {
    
    var source : NewsApiSource!
    var author : String!
    var title : String!
    var description : String!
    var url : String!
    var urlToImage: String!
    var publishedAt : String!
    var content : String!
    
    
    /**
     Cast NewsApiNews as News Model 
     */
    func toNewsModel() -> News? {
        
        if (title == nil) || (description == nil) || (url == nil) || (urlToImage == nil)  || (publishedAt == nil) || (content == nil) { return nil} // Only add news entity when has all properties
        
        let news = News()
        
        news.title = title
        news.desc = description
        news.url = url
        news.urlToImg = urlToImage
        news.content = content
        news.date = generateDate()
        
        return news
    }
    
    /**
     Cast the self string date into Date Type
     */
    func generateDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        return dateFormatter.date(from:self.publishedAt)!
    }
}
