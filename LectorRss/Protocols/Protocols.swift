//
//  Protocols.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 10/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


protocol WebserviceProtocols {
    func webserviceResult(newsList : NewsList)
    func webserviceError(error : WebserviceErrorsEnum)
}

protocol RealmProtocols {
    func realmResult(newsList : NewsList)
    func realmError(error : RealmErrorsEnum)
}
