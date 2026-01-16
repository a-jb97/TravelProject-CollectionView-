//
//  ChatListViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/16/26.
//

import UIKit

class ChatListViewController: UIViewController {
    @IBOutlet var userSearchBar: UISearchBar!
    @IBOutlet var chatListCollectionView: UICollectionView!
    
    var searchedChatRooms = mockChatRooms
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
    }
    
    // MARK: 유저 검색 로직
    private func searchLogic(text: String) {
        let searchedText = text.uppercased()
        
        if searchedText.isEmpty {
            searchedChatRooms = mockChatRooms
        } else {
            let matchedUserIds = mockUsers.filter {
                $0.userName.uppercased().contains(searchedText)
            }.map {
                $0.userId
            }
            
            searchedChatRooms = mockChatRooms.filter {
                matchedUserIds.contains($0.participantIds[1])
            }
        }
        
        chatListCollectionView.reloadData()
    }
}

// MARK: CollectionView Extension
extension ChatListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    private func configCollectionView() {
        chatListCollectionView.delegate = self
        chatListCollectionView.dataSource = self
        
        let xib = UINib(nibName: ChatListCollectionViewCell.identifier, bundle: nil)
        
        chatListCollectionView.register(xib, forCellWithReuseIdentifier: ChatListCollectionViewCell.identifier)
        
        let layout = UICollectionViewFlowLayout()
        let deviceWidth = UIScreen.main.bounds.width
        
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: deviceWidth, height: 65)
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        layout.minimumLineSpacing = 30
        layout.minimumInteritemSpacing = 30
        
        chatListCollectionView.collectionViewLayout = layout
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searchedChatRooms.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: ChatListCollectionViewCell.identifier, for: indexPath) as! ChatListCollectionViewCell
        
        item.configUI(row: searchedChatRooms[indexPath.row])
        
        return item
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        <#code#>
//    }
}

// MARK: SearchBar Extension
extension ChatListViewController: UISearchBarDelegate {
    private func configSearchBar() {
        userSearchBar.delegate = self
    }
    
    // MARK: SearchBar에 아무 텍스트도 없으면 모든 유저 표시
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchLogic(text: searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchLogic(text: searchBar.text!)
        
        view.endEditing(true)
    }
}
