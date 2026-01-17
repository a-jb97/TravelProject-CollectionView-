//
//  ChatRoomViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/17/26.
//

import UIKit

class ChatRoomViewController: UIViewController {
    @IBOutlet var chatTableView: UITableView!
    @IBOutlet var chatTextView: UITextView!
    
    var selectedChatRoom: ChatRoom = mockChatRooms[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
    }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    private func configTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.rowHeight = UITableView.automaticDimension
        
        let friendMessageXib = UINib(nibName: FriendMessageTableViewCell.identifier, bundle: nil)
        let myMessageXib = UINib(nibName: MyMessageTableViewCell.identifier, bundle: nil)
        
        chatTableView.register(friendMessageXib, forCellReuseIdentifier: FriendMessageTableViewCell.identifier)
        chatTableView.register(myMessageXib, forCellReuseIdentifier: MyMessageTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedChatRoom.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendMessageTableViewCell.identifier) as! FriendMessageTableViewCell
        let myCell = tableView.dequeueReusableCell(withIdentifier: MyMessageTableViewCell.identifier) as! MyMessageTableViewCell
        
        if selectedChatRoom.messages[indexPath.row].senderId == 1 {
            friendCell.configUI(id: selectedChatRoom.participantIds[1], row: selectedChatRoom.messages[indexPath.row])
            
            return friendCell
        } else {
            myCell.configUI(row: selectedChatRoom.messages[indexPath.row])
            
            return myCell
        }
    }
}
