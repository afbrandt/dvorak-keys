//
//  KeyboardViewController.swift
//  DvorakBoard
//
//  Created by Andrew Brandt on 9/22/14.
//  Copyright (c) 2014 Andrew Brandt. All rights reserved.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    //@IBOutlet var nextKeyboardButton: UIButton!
    var mainView: UIView!
    

    override func updateViewConstraints() {
        super.updateViewConstraints()
    
        // Add custom view sizing constraints here
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var xibViews = NSBundle.mainBundle().loadNibNamed("CustomKeyboard", owner: self, options: nil)
        self.mainView = xibViews[0] as UIView;
        self.view.addSubview(mainView)
        
        for v in self.mainView.subviews as [UIButton]
        {
            if (v.tag >= 0)
            {
                v.addTarget(self, action: "btnPressed:", forControlEvents: .TouchUpInside)
            }
            else if (v.tag == -1)
            {
                v.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
            }
        }
    
        // Perform custom UI setup here
        /*
        self.nextKeyboardButton = UIButton.buttonWithType(.System) as UIButton
    
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.setTranslatesAutoresizingMaskIntoConstraints(false)
    
        self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        self.view.addSubview(self.nextKeyboardButton)
    
        var nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
        var nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])
        */
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }

    override func textWillChange(textInput: UITextInput) {
        // The app is about to change the document's contents. Perform any preparation here.
    }

    override func textDidChange(textInput: UITextInput) {
        // The app has just changed the document's contents, the document context has been updated.
    
        var textColor: UIColor
        var proxy = self.textDocumentProxy as UITextDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
            textColor = UIColor.whiteColor()
        } else {
            textColor = UIColor.blackColor()
        }
        //self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
    }
    
    func btnPressed(sender: AnyObject)
    {
        var btn = sender as UIButton
        
        var string = ""
        var backspace = false
        let proxy = self.textDocumentProxy as UIKeyInput
        
        switch (btn.tag)
        {
            case 0:
                backspace = true
            case 1:
                string = "a"
            case 2:
                string = "b"
            case 3:
                string = "c"
            case 4:
                string = "d"
            case 5:
                string = "e"
            case 6:
                string = "f"
            case 7:
                string = "g"
            case 8:
                string = "h"
            case 9:
                string = "i"
            case 10:
                string = "j"
            case 11:
                string = "k"
            case 12:
                string = "l"
            case 13:
                string = "m"
            case 14:
                string = "n"
            case 15:
                string = "o"
            case 16:
                string = "p"
            case 17:
                string = "q"
            case 18:
                string = "r"
            case 19:
                string = "s"
            case 20:
                string = "t"
            case 21:
                string = "u"
            case 22:
                string = "v"
            case 23:
                string = "w"
            case 24:
                string = "x"
            case 25:
                string = "y"
            case 26:
                string = "z"
            case 27:
                string = " "
            case 28:
                string = "\n"
            default:
                //Nothing needs to happen, though default case should not be encountered
                string = ""
        }
        if (!backspace)
        {
            proxy.insertText(string)
        }
        else if (backspace)
        {
            proxy.deleteBackward()
        }
    }
}
