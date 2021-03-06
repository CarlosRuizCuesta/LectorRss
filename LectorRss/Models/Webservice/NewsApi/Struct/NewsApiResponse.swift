//
//  NewsApiResponse.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class NewsApiResponse : Codable {
    
    var status : String!
    var articles : [NewsApiNews]!
    var totalResults : Int!
}

