//
//  NodeTableViewCell.swift
//  toy-blocks
//
//  Created by James Rhodes on 7/15/20.
//  Copyright © 2020 James Rhodes. All rights reserved.
//

import UIKit

class NodeTableViewCell: UITableViewCell {
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        nameLabel.textColor = UIColorTheme.PrimaryFontColor
        nameLabel.textAlignment = .left
        nameLabel.font = UIFontTheme.Regular()

        urlLabel.textColor = UIColorTheme.SecondaryFontColor
        urlLabel.textAlignment = .left
        urlLabel.font = UIFontTheme.Regular(.small)

        statusLabel.textColor = UIColorTheme.Primary
        statusLabel.textAlignment = .right
        statusLabel.font = UIFontTheme.Regular(.xTiny)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
