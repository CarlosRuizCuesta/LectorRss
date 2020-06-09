//
//  NewsList.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class NewsList {
    
    var newsList : [News] = []
    
    func append(news : News) {
        newsList.append(news)
    }
    
    func count() -> Int {
        return newsList.count
    }
    
    func get(pos : Int) -> News {
        return newsList[pos]
    }
    
    /**
     Save all the news list into the data base
     */
    func saveNews() {
        for news in self.newsList {
            RealmSet.saveNewsList(news: news)
        }
    }
}
