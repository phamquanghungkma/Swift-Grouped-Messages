//
//  ViewController.swift
//  SwiftGroupMessage
//
//  Created by Apple on 7/13/20.
//  Copyright © 2020 Tofu. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    let cellId = "id"
    
    let chatMessages = [
        ChatMessage(text: "Here's my very first message", isIncoming: true),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false),
        ChatMessage(text:   "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap,I'm going to message another long message that will word wrap", isIncoming: true),
        ChatMessage(text: "yeah, of Course", isIncoming: false)
    ]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(white: 0.95, alpha: 1 )
//        navigationController?.navigationBar.backgroundColor = .gray
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell

        let chatMessage = chatMessages[indexPath.row]
        
//        cell.messageLabel.text = chatMessage.text
//    
        cell.chatMessage = chatMessage
        return cell
    }

}

