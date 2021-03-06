//
//  ChangeUsernameVC.swift
//  MedQuiz
//
//  Created by Chad Johnson on 2/26/18.
//  Copyright © 2018 Omar Sherief. All rights reserved.
//

import UIKit

protocol ChangeUsernameVCDelegate: class{
    func dataChanged(username: String, usernameChanged: Bool)
}

class ChangeUsernameVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var warningView: UIView!
    
    @IBOutlet weak var changeUsernameTextField: UITextField!
    
    var username: String?
    
    var warned = false
    
    var usernameChanged = false
    
    weak var delegate: ChangeUsernameVCDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        changeUsernameTextField.text = username
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backToProfile(_ sender: Any) {
        delegate?.dataChanged(username: username!, usernameChanged: usernameChanged)
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func noPressed(_ sender: Any) {
        warningView.isHidden = true
        changeUsernameTextField.text = username
        changeUsernameTextField.endEditing(true)
    }
    
    
    @IBAction func yesPressed(_ sender: Any) {
        warningView.isHidden = true
        delegate?.dataChanged(username: changeUsernameTextField.text!, usernameChanged: true)
        dismiss(animated: false, completion: nil)
    }
    
    
    @IBAction func changeUsernameTextFieldEditingDidBegin(_ sender: Any) {
        changeUsernameTextField.selectedTextRange = changeUsernameTextField.textRange(from: changeUsernameTextField.beginningOfDocument, to: changeUsernameTextField.endOfDocument)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        if (changeUsernameTextField.text == username){
            delegate?.dataChanged(username: changeUsernameTextField.text!, usernameChanged: true)
            dismiss(animated: false, completion: nil)
        }
        else{
            warningView.isHidden = false
            changeUsernameTextField.endEditing(true)
        }

        return true
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
