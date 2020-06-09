//
//  NewsEntity.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift


class NewsEntity : Object {
    
    
    @objc var title : String!
    @objc var desc : String!
    @objc var urlToImg : String!
    @objc var url : String!
    @objc var fecha : Date!
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
    
    /**
      cast the entity into news model
     */
    func toModel() -> News {
        
        var news = News()
        
        news.title = title
        news.desc = desc
        news.urlToImg = urlToImg
        news.url = url
        
        return news
    }
}
