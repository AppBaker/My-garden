//
//  AddNewPlantViewController.swift
//  My garden
//
//  Created by Ivan Nikitin on 15/04/2019.
//  Copyright © 2019 Ivan Nikitin. All rights reserved.
//

import UIKit

class AddNewPlantViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var sortTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var plantClassTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var landingDateTextField: UITextField!
    @IBOutlet weak var maturationTimeTextField: UITextField!
    @IBOutlet weak var squareTextField: UITextField!
    @IBOutlet weak var yieldTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerForKeyboardNotification()
    }
    
}

// MARK: - Keyboard apearence
extension AddNewPlantViewController {
    
    //    Register keyboard appearance
    func registerForKeyboardNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    // Selectors
    @objc func kbDidShow(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        let kbFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height + kbFrameSize.height)
    }
    @objc func kbDidHide() {
        scrollView.contentSize = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
    }
    
}
