//
//  NewsApiErros.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import Foundation


public enum NewsApiErrorsEnum : String {
    case networking = "networking error";
    case http = "http error";
    case data = "error decoding JSON";
    case zero = "No results for the search";
}
