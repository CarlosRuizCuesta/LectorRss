//
//  RealmSet.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation
import RealmSwift

class  RealmSet {
    
    /**
     Save a news into database
     */
    class func saveNewsList(news : News) {
        
        do {
            let realm = try Realm()
            try  realm.write {
                realm.add(news.toEntity(), update: .all)
            }
        } catch let error as NSError {
            print("") // @TODO: Handler error
        }
    }
}
