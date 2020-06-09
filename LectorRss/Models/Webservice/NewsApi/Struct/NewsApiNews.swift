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
}
