//
//  Realm.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUsage {
    
    static var PAGINATIONSIZE : Int = 20
    var delegate : RealmProtocols!
    
    init(delegate : RealmProtocols) {
        self.delegate = delegate
    }
    
    /**
     Save a news into database
     */
    func saveNews(news : News) {
        
        do {
            let realm = try Realm()
            try  realm.write {
                realm.add(news.toEntity(), update: .all)
            }
        } catch _ as NSError {
            delegate.realmError(error : RealmErrorsEnum.set)
        }
    }
    
    /**
     Search all the news from the database
     */
    func getNewsList() {
        let newsList = NewsList()
        
        do {
            let realm = try Realm()
            let newsListEntity : Results<NewsEntity> = realm.objects(NewsEntity.self).sorted(byKeyPath: "date", ascending: false)
            
            // read the entities recived from database
            for newsEntity in newsListEntity {
                if newsList.count() <= RealmUsage.PAGINATIONSIZE { // Pagination
                    newsList.append(news: newsEntity.toModel()) // add the news model to the newsList
                } else {
                    break
                }
            }
            
            // Check if the list is empty
            if newsList.count() > 0 {
                delegate.realmResult(newsList: newsList) // delegate newsList
            } else {
                delegate.realmError(error : RealmErrorsEnum.zero) // delegate error zero
            }
        } catch _ as NSError {
            delegate.realmError(error : RealmErrorsEnum.set)
        }
    }
}
