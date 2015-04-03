//
//  ViewController.swift
//  SwiftBriefing
//
//  Created by Keaton Swoboda on 4/1/15.
//  Copyright (c) 2015 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate
{
    @IBOutlet var nameTextField : UITextField!
    @IBOutlet var passTextField : UITextField!
    @IBOutlet var authenticateButton : UIButton!
    @IBOutlet var briefingTextView : UITextView!
    @IBOutlet var goodMorningLabel : UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        briefingTextView.text = ""
        nameTextField.delegate = self
        passTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        if textField == nameTextField
        {
            
        textField.resignFirstResponder()
        passTextField.becomeFirstResponder()
        }
        else
        {
            textField.resignFirstResponder()
            authenticateOnReturn()
            
        }
        return true
    }
    
    
    
    @IBAction func authButton(sender : AnyObject)
    {
       authenticateOnReturn()
        
        
    }
    func authenticateOnReturn()
    {
        if (nameTextField.text.isEmpty) || (passTextField.text.isEmpty)
        {
            goodMorningLabel.text = "Error, Error, Will self destruct"
            view.backgroundColor = UIColor.redColor()
            briefingTextView.backgroundColor = UIColor.redColor()
            briefingTextView.text = ""
        }
            
        else if !(nameTextField.text.isEmpty) || !(passTextField.text.isEmpty)
        {
            var agentNames = nameTextField.text.componentsSeparatedByString(" ")
            var lastNM = agentNames[1]
            goodMorningLabel.text = String(format:"Good Morning Angel %@", lastNM)
            briefingTextView.text = "Todays asignment is a risky one. You must locate a stolen Bengal Tiger and return it to the San Diego Zoo."
            passTextField.resignFirstResponder()
            view.backgroundColor = UIColor.greenColor()
            briefingTextView.backgroundColor = UIColor.greenColor()
        }
    }


}

