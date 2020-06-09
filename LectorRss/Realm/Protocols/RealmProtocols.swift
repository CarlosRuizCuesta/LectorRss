//
//  RealmProtocols.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation

protocol RealmProtocols {
    func realmResult(newsList : NewsList)
    func realmError(error : RealmErrorsEnum)
}

