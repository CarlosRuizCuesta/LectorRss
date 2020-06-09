//
//  RealmErrorsEnum.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation



public enum RealmErrorsEnum : String {
    case get = "error getting news";
    case set = "error saving news";
    case zero = "no news into database";
}
