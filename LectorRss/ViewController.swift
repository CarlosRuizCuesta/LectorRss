//
//  ViewController.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var newsList : NewsList! // @TODO: GEstionate the news table

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.path {
            print("Documents directory \(documentPath)")
        }
        
        Webservice(delegate: self).start()
    }
}

extension ViewController {
    
    /**
     set the newList and reliad the table
     */
    func setNewsList(newsList : NewsList) {
        self.newsList = newsList
        print("")
        // tlbreload
    }
}


extension ViewController : NewsApiProtocols {
    
    
    func newsApiResult(newsList: NewsList) {
        newsList.saveNews() // Save the news into database
        setNewsList(newsList: newsList)
    }
    
    func newsApiError(error: NewsApiErrorsEnum) {
        
        switch error {
        case NewsApiErrorsEnum.http:
            print("fdsfds")
            break
        case NewsApiErrorsEnum.networking:
            setNewsList(newsList: RealmGet.getNewsList()) // from the database the news list
            break
        case NewsApiErrorsEnum.data:
            print("fdsfds")
            break
        case NewsApiErrorsEnum.zero:
            print("fdsfds")
            break
        }
    }
}

