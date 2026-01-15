//
//  NicknameChangeViewController.swift
//  TravelProject(CollectionView)
//
//  Created by 전민돌 on 1/15/26.
//

import UIKit

class NicknameChangeViewController: UIViewController {
    static let identifier = "NicknameChangeViewController"
    
    @IBOutlet var nicknameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(rightBarButtonTapped))
        navigationItem.rightBarButtonItem?.tintColor = .accent

        nicknameTextField.clipsToBounds = true
        nicknameTextField.layer.cornerRadius = nicknameTextField.frame.height / 2
        
        nicknameTextField.text = (UserDefaultsManager.nickname != nil) ? UserDefaultsManager.nickname : nil
    }
    
    @objc private func rightBarButtonTapped() {
        if nicknameTextField.text!.count > 2 {
            UserDefaultsManager.nickname = nicknameTextField.text
            
            navigationController?.popViewController(animated: true)
        } else {
            let alert = UIAlertController(title: "알림", message: "닉네임은 2글자 이상만 가능합니다!", preferredStyle: .alert)
            let okButton = UIAlertAction(title: "확인", style: .default)
            
            alert.addAction(okButton)
            
            present(alert, animated: true)
        }
    }
    
    @IBAction func nicknameTextFieldDidEndOnExit(_ sender: UITextField) {
        view.endEditing(true)
    }
}
