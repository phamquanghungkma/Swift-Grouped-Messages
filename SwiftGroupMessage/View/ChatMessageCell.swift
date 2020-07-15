//
//  ChatMessageCell.swift
//  SwiftGroupMessage
//
//  Created by Apple on 7/15/20.
//  Copyright © 2020 Tofu. All rights reserved.
//

import UIKit

class ChatMessageCell: UITableViewCell {
    
    let messageLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        addSubview(messageLabel)
        messageLabel.backgroundColor = .green
        messageLabel.text = "“It’s about” is a way to highlight the importance of something. For example, “It’s about doing a good job” means what’s important is to do a good job."
        messageLabel.numberOfLines = 0
      // mesageLabel.frame = CGRect(x: 0, y: 0, width: 100, height:100)
        
        
        // lets set up some constraints for our label
        NSLayoutConstraint.activate([ messageLabel.topAnchor.constraint(equalTo: topAnchor),
               messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
               messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
               messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20)
        
            ])
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
