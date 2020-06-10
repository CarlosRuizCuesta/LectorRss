//
//  NewsVC.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 10/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit
import PINRemoteImage


class NewsVC : UIViewController {
    
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblDesc : UILabel!
    @IBOutlet var imgNews : UIImageView!
    
    var news : News!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    
    func setUI() {
        lblTitle.text = news.title
        lblDesc.text = news.desc
        imgNews.pin_setImage(from: URL(string:  news.urlToImg!)!)
    }
    
    @IBAction func btn_newsClick(_ sender : Any) {
        
    }
}
