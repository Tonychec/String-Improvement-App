//
//  MainVC.swift
//  String Improvement App
//
//  Created by Nomad on 10/20/17.
//  Copyright © 2017 ios.Nomad. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var inputText: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    var userText: String! = ""
    var resultText: String! = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.bindToKeyboard()
        let tap = UITapGestureRecognizer(target: self, action: #selector(MainVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @IBAction func checkBtnPressed(_ sender: Any) {
        let text = inputText.text!
        if text != "" {
            resultText = parseText(text: text)
            outputLabel.text = resultText
            handleTap()
        } else {
            let alert = UIAlertController(title: "Ouups...Something went wrong", message: "Add text and try again", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Okay, I got it", style: .default)
            alert.addAction(cancelAction)
            present(alert, animated: true)
        }
    }
    
    @objc func handleTap() {
                view.endEditing(true)
    }

}

