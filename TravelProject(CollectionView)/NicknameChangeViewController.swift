//
//  NicknameChangeViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class NicknameChangeViewController: UIViewController {
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonTapped))

        nicknameTextField.clipsToBounds = true
        nicknameTextField.layer.cornerRadius = nicknameTextField.frame.height / 2
    }
    
    @objc private func rightBarButtonTapped() {
        print("rightBarButtonTapped")
    }
    
    @IBAction func nicknameTextFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
}
