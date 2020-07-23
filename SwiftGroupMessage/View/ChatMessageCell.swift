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
    let bubblebackgroundView = UIView()
    
    
    var leadingConstraint: NSLayoutConstraint!
    var trailConstraint: NSLayoutConstraint!
    
    
    var chatMessage: ChatMessage! {
        didSet{
            bubblebackgroundView.backgroundColor = chatMessage.isIncoming ? .white: .darkGray
            messageLabel.textColor = chatMessage.isIncoming ? .black : .white
            messageLabel.text = chatMessage.text
            
            if chatMessage.isIncoming {
                leadingConstraint.isActive = true
                trailConstraint.isActive = false
            } else{
                leadingConstraint.isActive = false
                trailConstraint.isActive = true
            }
        }
        
    }

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style:style, reuseIdentifier: reuseIdentifier)
        
        
        backgroundColor = .clear
        
        bubblebackgroundView.translatesAutoresizingMaskIntoConstraints = false
        bubblebackgroundView.layer.cornerRadius = 16
        bubblebackgroundView.backgroundColor = .yellow
        addSubview(bubblebackgroundView)
        
        addSubview(messageLabel)
        messageLabel.numberOfLines = 0
        
        
        // lets set up some constraints for our label
        NSLayoutConstraint.activate([
               messageLabel.topAnchor.constraint(equalTo: topAnchor,constant: 16),
               messageLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -32),
               messageLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 250),
               
               bubblebackgroundView.topAnchor.constraint(equalTo: messageLabel.topAnchor, constant: -16),
               bubblebackgroundView.leadingAnchor.constraint(equalTo: messageLabel.leadingAnchor, constant: -16),
               bubblebackgroundView.trailingAnchor.constraint(equalTo: messageLabel.trailingAnchor, constant: 16),
               bubblebackgroundView.bottomAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 16)
            
            ])
         leadingConstraint =  messageLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 32)
         leadingConstraint.isActive = false
        
         trailConstraint = messageLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32)
         trailConstraint.isActive = true

        
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
       
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
