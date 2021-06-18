//
//  TableViewCell.swift
//  millionaire
//
//  Created by Mergen Sanzhiyev on 15.06.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var result: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
