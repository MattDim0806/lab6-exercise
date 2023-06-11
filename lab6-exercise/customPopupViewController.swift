//
//  customPopupViewController.swift
//  lab6-exercise
//
//  Created by Meng Chi Chen on 2023/4/5.
//

import UIKit

class customPopupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var popupView: UIView!
    var selectHandler : ((String)->())?
    
    func showInVC(VC:UIViewController){
        self.modalPresentationStyle = .overCurrentContext
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .fade
        VC.view.window?.layer.add(transition, forKey: kCATransition)
        VC.present(self, animated: false) {
            self.popupView.transform=CGAffineTransform(scaleX: 0.5, y: 0.5)
            self.popupView.alpha = 0
            UIView.animate(withDuration: 0.25){
                self.popupView.transform=CGAffineTransform(scaleX: 1, y: 1)
                self.popupView.alpha = 1
            }
        }
    }
    
    func dismissPopupView(){
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = .fade
        view.window?.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }

    
    @IBAction func dismissView(_ sender: Any) {
        dismissPopupView()
    }
    
    
    @IBAction func selectFood(_ btn: UIButton) {
        dismissPopupView()
        self.selectHandler!(btn.titleLabel!.text!)
        
    }
}
