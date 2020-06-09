//
//  ViewController.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Webservice(delegate: self).start()
    }
}


extension ViewController : NewsApiProtocols {
    
    
    func newsApiResult(newsList: NewsList) {
        print("fdsafdsaf")
    }
    
    func newsApiError(error: NewsApiErrorsEnum) {
        
        switch error {
        case NewsApiErrorsEnum.http:
            print("fdsfds")
            break
        case NewsApiErrorsEnum.networking:
            print("fdsfds")
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

