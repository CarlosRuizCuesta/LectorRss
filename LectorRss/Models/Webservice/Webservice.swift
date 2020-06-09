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
    var newsApiProtocols : NewsApiProtocols!
    
    convenience init(delegate : Any) {
        self.init()
        self.newsApiProtocols = delegate as! NewsApiProtocols
        newsApi = NewsApi()
    }
    
    /**
     Run the web service with the newsapi parameters already configured
     */
    func start() {
        // Preparing the request
        var request = URLRequest(url: (self.newsApi.url?.url)!)
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        // Prepare and execute the task
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data,
                let response = response as? HTTPURLResponse,
                error == nil else {
                    self.newsApiProtocols.newsApiError(error: NewsApiErrorsEnum.networking) // Delegate error NetWorkError
                    return
            }
            
            guard (200 ... 299) ~= response.statusCode else {
                self.newsApiProtocols.newsApiError(error: NewsApiErrorsEnum.http) // Delegate error HttpError
                return
            }
            
            // Decoding JSON using the struct ApiNewsResponse
            do {
                let result = try JSONDecoder().decode(NewsApiResponse.self, from: data)
                self.newsApiProtocols.newsApiResult(data : result) // Delegate result as NewsAPIResponse
            } catch let _ as NSError {
                self.newsApiProtocols.newsApiError(error: NewsApiErrorsEnum.data) // Delegate error decoding JSON
            }
        }
        
        task.resume()
    }
}
