//
//  SearchResultsCell.swift
//  PickerViewTest
//
//  Created by 劉坤昶 on 2016/4/3.
//  Copyright © 2016年 JohnnyKetchup. All rights reserved.
//

import UIKit

class SearchResultsCell: UITableViewCell {

    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        
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
