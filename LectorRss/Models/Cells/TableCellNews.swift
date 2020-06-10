//
//  TableCellNews.swift
//  LectorRss
//
//  Created by MIGUEL PEREZ SUBIAS on 09/06/2020.
//  Copyright © 2020 Carlos Ruiz Cuesta. All rights reserved.
//

import UIKit

class TableCellNews: UITableViewCell {
    
    @IBOutlet var lblTitle : UILabel!
    @IBOutlet var lblDescription : UILabel!
    @IBOutlet var imgImage : UIImageView!
    
    static var imgImageDefault : String = "https://increasify.com.au/wp-content/uploads/2016/08/default-image.png"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
