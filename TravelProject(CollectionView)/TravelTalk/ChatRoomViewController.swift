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
        
        // MARK: 키보드가 올라오면 chatTextView도 키보드 높이만큼 올라가기
        chatTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([chatTextView.bottomAnchor.constraint(equalTo: view.keyboardLayoutGuide.topAnchor)])
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // MARK: 테이블뷰 스크롤 가장 하단으로 내린 상태로 표시
        let messages = selectedChatRoom.messages
        let index = IndexPath(row: messages.isEmpty ? 0 : messages.count - 1, section: 0)
        
        chatTableView.scrollToRow(at: index, at: .bottom, animated: false)
    }
    
    // MARK: 메시지 전송
    @objc private func messageSendButtonTapped() {
        let newMessageData = Message(messageId: (selectedChatRoom.messages.last?.messageId ?? selectedChatRoom.chatRoomId * 100) + 1, senderId: 0, content: chatTextView.text, timestamp: Date())
        
        selectedChatRoom.messages.append(newMessageData)
        mockChatRooms[selectedChatRoom.chatRoomId - 1].messages.append(newMessageData)
        
        let messages = selectedChatRoom.messages
        let index = IndexPath(row: messages.isEmpty ? 0 : messages.count - 1, section: 0)
        
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
        // MARK: 상대와 나의 메시지를 구분하여 각자 다른 셀 표시
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
