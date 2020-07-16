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
        [
            ChatMessage(text: "Here's my very first message", isIncoming: true,date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false,date:  Date.dateFromCustomString(customString: "08/03/2018"))
        
    ],
    [
        ChatMessage(text:   "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap,I'm going to message another long message that will word wrap", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "yeah, of Course", isIncoming: false,date:Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text:"today is hard tomorrow will be worse", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018"))
    ],
    [
        ChatMessage(text: "How's it going ", isIncoming: true,date:Date.dateFromCustomString(customString: "09/16/2018")),
        ChatMessage(text: "Yeah! Everything's ok", isIncoming: false,date:Date.dateFromCustomString(customString: "09/16/2018"))
        ]
    
    ]
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.backgroundColor = UIColor(white: 0.95, alpha: 1 )
        
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        tableView.separatorStyle = .none
        tableView.backgroundColor = UIColor(white: 0.95, alpha: 1)

    }
    
    // section
    override func numberOfSections(in tableView: UITableView) -> Int {
        return chatMessages.count
    }
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        if let firstMessageInSection = chatMessages[section].first{
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MM/dd/yyyy"
            let dateString = dateFormatter.string(from: firstMessageInSection.date)
            
            return dateString }
        
        return "Section: \(Date())"
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return chatMessages[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! ChatMessageCell

//        let chatMessage = chatMessages[indexPath.row]
        let chatMessage = chatMessages[indexPath.section][indexPath.row]
        
        cell.chatMessage = chatMessage
        return cell
    }

}

