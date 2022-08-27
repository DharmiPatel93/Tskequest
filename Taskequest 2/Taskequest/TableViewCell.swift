//
//  TableViewCell.swift
//  Taskequest
//
//  Created by Dharmi Patel on 27/08/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var imgcell: UIImageView!
    
    @IBOutlet weak var lblcell2: UILabel!
    @IBOutlet weak var lblcell1: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
