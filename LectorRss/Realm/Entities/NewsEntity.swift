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
    
    
    @objc dynamic var title : String!
    @objc dynamic var desc : String!
    @objc dynamic var content : String!
    @objc dynamic var urlToImg : String!
    @objc dynamic var url : String!
    @objc dynamic var date : Date!
    
    override static func primaryKey() -> String? {
        return "title"
    }
    
    
    /**
      cast the entity into news model
     */
    func toModel() -> News {
        
        let news = News()
        
        news.title = self.title
        news.desc = self.desc
        news.urlToImg = self.urlToImg
        news.url = self.url
        news.date = self.date
        news.content = self.content
        
        return news
    }
}
