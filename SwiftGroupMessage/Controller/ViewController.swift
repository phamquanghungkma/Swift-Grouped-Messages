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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Messages"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.register(ChatMessageCell.self, forCellReuseIdentifier: cellId)
        

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
//        cell.textLabel?.text = "“It’s about” is a way to highlight the importance of something. For example, “It’s about doing a good job” means what’s important is to do a good job."
        cell.textLabel?.numberOfLines = 0
        return cell
    }

}

