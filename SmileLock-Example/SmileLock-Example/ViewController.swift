//
//  ViewController.swift
//  SmileLock-Example
//
//  Created by Ahmad Jabri on 1/31/19.
//  Copyright © 2019 rain. All rights reserved.
//

import UIKit
import SmileLock


class ViewController: UIViewController {
    
    @IBOutlet weak var passwordStackView: UIStackView?
    @IBOutlet weak var labelTitle: UILabel?
    
    var passwordContainerView: PasswordContainerView?
    let kPasswordDigit = 6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelTitle?.text = "enter password"
        passwordContainerView = PasswordContainerView.create(in: passwordStackView ?? UIStackView(), digit: kPasswordDigit)
        passwordContainerView?.delegate = self
//        navigationItem.titleView = UIImageView(image: UIImage(imageLiteralResourceName: "KNETLogo"))
        //        passwordContainerView?.passwordDotView.borderColor = .white
        //        passwordContainerView?.passwordDotView.fillColor = .white
        //        passwordContainerView?.passwordInputViews.forEach {
        //            $0.circleBackgroundColor = .clear
        //            $0.backgroundColor = .clear
        //            $0.textColor = .white
        //            $0.layer.borderColor = UIColor.white.cgColor
        //            $0.highlightBackgroundColor = UIColor(58, 161, 221, 1)
        //
        //
        //
        //        }
        //        passwordContainerView?.tintColor = UIColor.color(.textColor)
        //        passwordContainerView?.highlightedColor = UIColor.color(.blue)
    }
    
}

extension ViewController: PasswordInputCompleteProtocol {
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        if validation(input) {
            validationSuccess()
        } else {
            validationFail()
        }
    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: Error?) {
        if success {
            self.validationSuccess()
        } else {
            passwordContainerView.clearInput()
        }
    }
}

private extension ViewController {
    func validation(_ input: String) -> Bool {
        return input == "123456"
    }
    
    func validationSuccess() {
        print("*️⃣ success!")
        dismiss(animated: true, completion: nil)
    }
    
    func validationFail() {
        print("*️⃣ failure!")
        passwordContainerView?.wrongPassword()
    }
}



