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

        
    }
    
    
}
