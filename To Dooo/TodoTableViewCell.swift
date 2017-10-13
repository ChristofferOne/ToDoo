//
//  TodoTableViewCell.swift
//  To Dooo
//
//  Created by Christoffer Lundberg on 2017-10-13.
//  Copyright © 2017 christofferlundberg. All rights reserved.
//

import UIKit

class TodoTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setText(text: String) {
        self.itemLabel.text = text
    }
    
    func getText() -> String {
        return self.itemLabel.text!
    }

}
