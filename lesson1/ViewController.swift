//
//  ViewController.swift
//  lesson1
//
//  Created by Grigory Smirnov on 07.09.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var scrollView: UIScrollView!
    @IBOutlet private weak var loginText: UITextField!
    @IBOutlet private weak var passText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.addObservers()
        self.addGesture()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.removeObservers()
    }
    
    private func addGesture(){
        let gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture))
        self.scrollView.addGestureRecognizer(gesture)
    }
    
    private func addObservers(){
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWS), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWH), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    private func removeObservers(){
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func handleGesture(){
        self.scrollView.endEditing(true)
    }
    
    @objc private func handleKeyboardWS(){
        self.scrollView.contentInset.bottom += 120
    }
    
    @objc private func handleKeyboardWH(){
        self.scrollView.contentInset.bottom = 0
    }

    @IBAction private func onGoPressed(_ sender: Any) {
        
        let login = self.loginText.text
        let pass = self.passText.text
        
        let alert = UIAlertController(title: "", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title:"Close",style:.default))
        
        if(login == "admin" && pass == "123"){
            alert.title = "Success"
            alert.message = "You entered the app"
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            alert.title = "Error"
            alert.message = "Wrong credentials"
            self.present(alert, animated: true, completion: nil)
        }
    }
}

