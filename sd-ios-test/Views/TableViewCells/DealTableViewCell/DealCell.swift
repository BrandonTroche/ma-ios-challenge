//
//  DealCell.swift
//  sd-ios-test
//
//  Created by Brandon on 12/12/19.
//  Copyright © 2019 Slickdeals, LLC. All rights reserved.
//

import UIKit

class DealCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var extraLabel: UILabel!
    @IBOutlet weak var votesLabel: UILabel!
    @IBOutlet weak var commentsLabel: UILabel!

    func configure(dealSummary: DealSummary) {
        priceLabel.text = "\(dealSummary.price)"
        nameLabel.text = "\(dealSummary.title)"
        extraLabel.text = "\(dealSummary.extra)"
        votesLabel.text = "\(dealSummary.voteCount)"
        commentsLabel.text = "\(dealSummary.commentCount)"
    }
}
