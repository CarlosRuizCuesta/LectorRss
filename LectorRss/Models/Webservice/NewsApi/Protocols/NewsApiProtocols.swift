//
//  NewsapiProtocols.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


protocol NewsApiProtocols {
    func newsApiResult(newsList : NewsList)
    func newsApiError(error : NewsApiErrorsEnum)
}
