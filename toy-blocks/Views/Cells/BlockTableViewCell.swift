//
//  BlockTableViewCell.swift
//  toy-blocks
//
//  Created by Siroson on 2021-10-10.
//  Copyright © 2021 James Rhodes. All rights reserved.
//

import UIKit

class BlockTableViewCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var indexLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.backgroundColor = UIColorTheme.CellContentBackgroundColor
        
        indexLabel.textColor = UIColorTheme.TertiaryFontColor
        indexLabel.textAlignment = .left
        indexLabel.font = UIFontTheme.Bold(.xTiny)
        
        contentLabel.textColor = UIColorTheme.PrimaryFontColor
        contentLabel.textAlignment = .left
        contentLabel.font = UIFontTheme.Regular()
        contentLabel.numberOfLines = 0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
