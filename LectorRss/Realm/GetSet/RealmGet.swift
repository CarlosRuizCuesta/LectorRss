//
//  RealmGet.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift


class RealmGet {
    
    /**
     Get all the news of the database
     */
    class func getNewsList() -> NewsList {
        var newsList = NewsList()
        
        do {
            let realm = try Realm()
            let newsListEntity : Results<NewsEntity> = realm.objects(NewsEntity.self)
            
            for newsEntity in newsListEntity {
                newsList.append(news: newsEntity.toModel())
            }
            
        } catch let error as NSError {
            print("fdsfdsa") // @TODO: Handler error
        }
        
        return newsList
    }
    
    
    /**
     Get a new for the database
     */
    class func getNews(news : News) {
        
    }
}
