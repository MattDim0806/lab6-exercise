//
//  ViewController.swift
//  lab6-exercise
//
//  Created by Meng Chi Chen on 2023/4/5.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func demoAlertActionSheet(_ sender: Any) {
        let actionsheetController = UIAlertController(title: "標題", message: "說明", preferredStyle: .actionSheet)
        let commonAction = UIAlertAction(title: "預設樣式", style: .default)
        let destructiveAction = UIAlertAction(title: "危險樣式", style: .destructive)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        actionsheetController.addAction(commonAction)
        actionsheetController.addAction(destructiveAction)
        actionsheetController.addAction(cancelAction)
        present(actionsheetController, animated: true, completion: nil)
    }
    
    
    @IBAction func demoAlertView(_ sender: Any) {
        let alertController = UIAlertController(title: "標題", message: "說明", preferredStyle: .alert)
        let commonAction = UIAlertAction(title: "預設樣式", style: .default)
        let destructiveAction = UIAlertAction(title: "危險樣式", style: .destructive)
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(commonAction)
        alertController.addAction(destructiveAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func login(_ sender: Any) {
        let alertController = UIAlertController(title: "登入", message: "請輸入帳號密碼", preferredStyle: .alert)
        alertController.addTextField{ (textField) in
            textField.placeholder = "請輸入帳號"
        }
        alertController.addTextField{ (textField) in
            textField.placeholder = "請輸入密碼"
        }
        let determineAction = UIAlertAction(title: "登入", style: .default){
            (action) in
            let account = alertController.textFields![0]
            let password = alertController.textFields![1]
            self.showLogin(account.text!, password.text!)
        }
        let cancelAction = UIAlertAction(title: "取消", style: .cancel)
        alertController.addAction(determineAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true, completion: nil)
    }
    
    
    func showLogin(_ account:String, _ password:String){
        let msgView = UIAlertController(title: "登入成功", message: String(format: "帳號：%@\n密碼：%@", account, password), preferredStyle: .alert)
        let determineAction = UIAlertAction(title: "確定", style: .default)
        msgView.addAction(determineAction)
        present(msgView, animated: true, completion: nil)
    }
    
    
    @IBAction func showCustomPopup(_ sender: Any) {
        let VC = customPopupViewController()
        VC.selectHandler = { (name:String)->() in
            self.showStringData(str:name)
        }
        VC.showInVC(VC: self)
    }
    
    func showStringData(str:String){
        let msgView = UIAlertController(title: str, message: nil, preferredStyle: .alert)
        let determineAction = UIAlertAction(title: "確定", style: .default, handler: nil)
        msgView.addAction(determineAction)
        present(msgView, animated: true)
    }
}
