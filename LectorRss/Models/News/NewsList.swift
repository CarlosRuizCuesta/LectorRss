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
    var newsListBackup : [News] = [] // Backup List for the search bar Copy of the news list
    
    func append(news : News) {
        newsList.append(news)
        newsListBackup.append(news)
    }
    
    func count() -> Int {
        return newsList.count
    }
    
    func get(pos : Int) -> News {
        return newsList[pos]
    }
    
    func getList() -> [News] {
        return newsList
    }
    
    /**
     Save all the news list into the data base
     */
    func saveNews(delegate : RealmProtocols) {
        
        let realmUsage = RealmUsage(delegate: delegate)
        
        for news in self.newsList {
            realmUsage.saveNews(news: news)
        }
    }
}
