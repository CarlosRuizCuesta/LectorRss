//
//  News.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


class News {
    
    var title : String!
    var desc : String!
    var content : String!
    var urlToImg : String?
    var url : String!
    var date : Date!
    
    
    /**
     Cast the news model as news entity
     */
    func toEntity() -> NewsEntity {
        
        let newsEntity = NewsEntity()
        newsEntity.title = title
        newsEntity.desc = desc
        newsEntity.content = content
        newsEntity.url = url
        newsEntity.urlToImg = urlToImg
        newsEntity.date = date
        
        return newsEntity
    }
}
