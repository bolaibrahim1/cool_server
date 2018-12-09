//
//  DataTableViewCell.swift
//  MobileNocTask
//
//  Created by Bola Ibrahim on 12/8/18.
//  Copyright © 2018 BolaIbrahim. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet weak var serverName: UILabel!
    @IBOutlet weak var ipSubnetMask: UILabel!
    @IBOutlet weak var ipAddress: UILabel!

    @IBOutlet weak var status: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.status.layer.cornerRadius = self.status.frame.height / 2
        self.status.layer.masksToBounds = false
        self.status.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(with previewData: Content) {
        
        self.serverName.text = previewData.name
        self.ipAddress.text = previewData.ipAddress
        self.ipSubnetMask.text = previewData.ipSubnetMask
        
        switch previewData.status?.id {
        case 1:
            self.status.backgroundColor = .green
        case 2:
            self.status.backgroundColor = .orange
        case 3:
            self.status.backgroundColor = .yellow
        default:
            self.status.backgroundColor = .red
        }

    }
}
