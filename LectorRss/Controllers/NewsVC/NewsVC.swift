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
        lblDesc.text = news.content
        
        // Check if the url in the image is empty
        if let urlImage = news.urlToImg {
            if !urlImage.isEmpty {
                imgNews!.pin_setImage(from: URL(string:  urlImage)!)
            } else {
                imgNews!.pin_setImage(from: URL(string:  TableCellNews.imgImageDefault)!) // Set Default image
            }
        }
    }
    
    @IBAction func btn_newsClick(_ sender : Any) {
        guard let url = URL(string: news.url) else { return }
        UIApplication.shared.open(url)
    }
    
    @IBAction func btn_back (_ sender : Any) {
        dismiss(animated: true, completion: nil)
    }
}
