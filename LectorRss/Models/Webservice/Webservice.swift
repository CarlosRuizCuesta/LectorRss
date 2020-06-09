//
//  Webservice.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

class Webservice {
    
    var newsApi : NewsApi!
    
    convenience init(delegate : Any) {
        self.init()
        newsApi = NewsApi()
    }
    
    /**
     
     */
    func start() {
        // Hago la request
        var request = URLRequest(url: (self.newsApi.url?.url)!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                    return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                return
            }
            
            print("end no errors")
        }
        
        task.resume()
    }
}
