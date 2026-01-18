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
    @IBOutlet var messageSendButton: UIButton!
    
    var selectedChatRoom: ChatRoom = mockChatRooms[0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configTableView()
        
        chatTextView.layer.cornerRadius = 10
        
        messageSendButton.addTarget(self, action: #selector(messageSendButtonTapped), for: .touchUpInside)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK: 테이블뷰 스크롤 가장 하단으로 내린 상태로 표시
        let index = IndexPath(row: self.selectedChatRoom.messages.count - 1, section: 0)
        
        chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
    }
    
    @objc private func messageSendButtonTapped() {
        selectedChatRoom.messages.append(Message(messageId: (selectedChatRoom.messages.last?.messageId ?? selectedChatRoom.chatRoomId * 100) + 1, senderId: 0, content: chatTextView.text, timestamp: Date()))
        
        let index = IndexPath(row: selectedChatRoom.messages.count - 1, section: 0)
        
        chatTableView.performBatchUpdates {
            chatTableView.insertRows(at: [index], with: .none)
        } completion: { _ in
            self.chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
        }
    }
}

extension ChatRoomViewController: UITableViewDelegate, UITableViewDataSource {
    private func configTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        chatTableView.rowHeight = UITableView.automaticDimension
        
        navigationItem.title = mockUsers[selectedChatRoom.participantIds[1]].userName
        
        let friendMessageXib = UINib(nibName: FriendMessageTableViewCell.identifier, bundle: nil)
        let myMessageXib = UINib(nibName: MyMessageTableViewCell.identifier, bundle: nil)
        
        chatTableView.register(friendMessageXib, forCellReuseIdentifier: FriendMessageTableViewCell.identifier)
        chatTableView.register(myMessageXib, forCellReuseIdentifier: MyMessageTableViewCell.identifier)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedChatRoom.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if selectedChatRoom.messages[indexPath.row].senderId == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: MyMessageTableViewCell.identifier, for: indexPath) as! MyMessageTableViewCell
            
            myCell.configUI(row: selectedChatRoom.messages[indexPath.row])
            
            return myCell
        } else {
            let friendCell = tableView.dequeueReusableCell(withIdentifier: FriendMessageTableViewCell.identifier, for: indexPath) as! FriendMessageTableViewCell
            
            friendCell.configUI(id: selectedChatRoom.participantIds[1], row: selectedChatRoom.messages[indexPath.row])
            
            return friendCell
        }
    }
}
