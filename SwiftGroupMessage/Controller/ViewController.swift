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
    
//    let chatMessages = [
//        [
//            ChatMessage(text: "Here's my very first message", isIncoming: true,date: Date.dateFromCustomString(customString: "08/03/2018")),
//        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false,date:  Date.dateFromCustomString(customString: "08/03/2018"))
//
//    ],
//    [
//        ChatMessage(text:   "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap,I'm going to message another long message that will word wrap", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018")),
//        ChatMessage(text: "yeah, of Course", isIncoming: false,date:Date.dateFromCustomString(customString: "09/15/2018")),
//        ChatMessage(text:"today is hard tomorrow will be worse", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018"))
//    ],
//    [
//        ChatMessage(text: "How's it going ", isIncoming: true,date:Date.dateFromCustomString(customString: "09/16/2018")),
//        ChatMessage(text: "Yeah! Everything's ok", isIncoming: false,date:Date.dateFromCustomString(customString: "09/16/2018"))
//        ],
//    [
//        ChatMessage(text: "Hello! my guy ", isIncoming: false,date:Date.dateFromCustomString(customString: "08/26/2018")),
//        ChatMessage(text: "What's up man?", isIncoming: true,date:Date.dateFromCustomString(customString: "08/26/2018")),
//
//        ]
//
//    ]
    let messagesFromServer = [
        ChatMessage(text: "Here's my very first message", isIncoming: true,date: Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text: "I'm going to message another long message that will word wrap", isIncoming: false,date:  Date.dateFromCustomString(customString: "08/03/2018")),
        ChatMessage(text:   "I'm going to message another long message that will word wrap, I'm going to message another long message that will word wrap,I'm going to message another long message that will word wrap", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "yeah, of Course", isIncoming: false,date:Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text:"today is hard tomorrow will be worse", isIncoming: true,date:  Date.dateFromCustomString(customString: "09/15/2018")),
        ChatMessage(text: "How's it going ", isIncoming: true,date:Date.dateFromCustomString(customString: "09/16/2018")),
               ChatMessage(text: "Yeah! Everything's ok", isIncoming: false,date:Date.dateFromCustomString(customString: "09/16/2018")),
        ChatMessage(text: "Hello! my guy ", isIncoming: false,date:Date.dateFromCustomString(customString: "08/26/2018")),
        ChatMessage(text: "What's up man?", isIncoming: true,date:Date.dateFromCustomString(customString: "08/26/2018"))
        

    ]
    fileprivate func attempToAssembleGroupedMessages(){
        print("Attemp to group our messages together")
        
        let groupedMessages =   Dictionary(grouping: messagesFromServer) { (element) ->  Date in
            return element.date
        }
        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted();
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            chatMessages.append(values ?? [] )
            
        }

    }
     
    
    var chatMessages = [[ChatMessage]]()
    
   

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        attempToAssembleGroupedMessages()
        
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

    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
         if let firstMessageInSection = chatMessages[section].first{
            // lay phan tu dau tien trong section
                    let dateFormatter = DateFormatter()
                    dateFormatter.dateFormat = "MM/dd/yyyy"
                    let dateString = dateFormatter.string(from: firstMessageInSection.date)// lay date cua ptu do
            
                    print("section :\(chatMessages[section].first!)")
                      let label = DateHeaderLabel()
                        label.text = dateString
                         let containerView = UIView()

                       
                         containerView.addSubview(label)

                         label.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
                         label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
                         return  containerView
        
                }
            return nil
     
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
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
    
    class DateHeaderLabel:UILabel{
        
       override init(frame: CGRect) {
            super.init(frame: frame)
        
           backgroundColor = .black
           textColor  = .white
            textAlignment = .center
            translatesAutoresizingMaskIntoConstraints = false
            font = UIFont.boldSystemFont(ofSize: 14)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override var intrinsicContentSize: CGSize{
            let originalContentSize = super.intrinsicContentSize
            let height = originalContentSize.height + 12
            layer.cornerRadius = height / 2
            layer.masksToBounds = true
            
            return CGSize(width: originalContentSize.width + 16, height: height )
        }
    }

}



