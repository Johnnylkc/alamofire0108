//
//  MainCell.swift
//  alamofire0108
//
//  Created by 劉坤昶 on 2016/1/8.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    var nameLabel = UILabel()
    var idLabel = UILabel()
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: "reuseIdentifier")
        
        nameLabel.frame = CGRectMake(20, 0, 150, 30)
        nameLabel.font = UIFont.boldSystemFontOfSize(20)
        contentView.addSubview(nameLabel)
        
        idLabel.frame = CGRectMake(20, 30, 150, 30)
        idLabel.font = UIFont.boldSystemFontOfSize(20)
        contentView.addSubview(idLabel)
        
        
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
