//
//  KeyboardViewController.swift
//  QwertyKeyboard
//
//  Created by Jessi Febria on 01/04/21.
//

import UIKit

class KeyboardViewController: UIInputViewController {

    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var q: UIButton!
    @IBOutlet weak var w: UIButton!
    @IBOutlet weak var e: UIButton!
    @IBOutlet weak var r: UIButton!
    @IBOutlet weak var t: UIButton!
    @IBOutlet weak var y: UIButton!
    @IBOutlet weak var u: UIButton!
    @IBOutlet weak var i: UIButton!
    @IBOutlet weak var o: UIButton!
    @IBOutlet weak var p: UIButton!
    @IBOutlet weak var a: UIButton!
    @IBOutlet weak var s: UIButton!
    @IBOutlet weak var d: UIButton!
    @IBOutlet weak var f: UIButton!
    @IBOutlet weak var g: UIButton!
    @IBOutlet weak var h: UIButton!
    @IBOutlet weak var j: UIButton!
    @IBOutlet weak var k: UIButton!
    @IBOutlet weak var l: UIButton!
    @IBOutlet weak var z: UIButton!
    @IBOutlet weak var x: UIButton!
    @IBOutlet weak var c: UIButton!
    @IBOutlet weak var v: UIButton!
    @IBOutlet weak var b: UIButton!
    @IBOutlet weak var n: UIButton!
    @IBOutlet weak var m: UIButton!
    @IBOutlet weak var del: UIButton!
    @IBOutlet weak var space: UIButton!
    @IBOutlet weak var `return`: UIButton!
    @IBOutlet weak var numb: UIButton!
    @IBOutlet weak var Upper: UIButton!
    
    
    @IBOutlet weak var char21: UIButton!
    @IBOutlet weak var char22: UIButton!
    @IBOutlet weak var char23: UIButton!
    @IBOutlet weak var char24: UIButton!
    @IBOutlet weak var char25: UIButton!
    @IBOutlet weak var char26: UIButton!
    @IBOutlet weak var char27: UIButton!
    @IBOutlet weak var char28: UIButton!
    @IBOutlet weak var char29: UIButton!
    @IBOutlet weak var char30: UIButton!
    @IBOutlet weak var switchNum: UIButton!
    
    
    @IBOutlet weak var stackRowTwoAlpha: UIStackView!
    @IBOutlet weak var stackRowThreeAlpha: UIStackView!
    @IBOutlet weak var stackRowTwoNum: UIStackView!
    @IBOutlet weak var stackRowThreeNum: UIStackView!
    
    
    
    var outletRowOneUniversal: [UIButton] = [UIButton]()
    var outletRowTwoNum: [UIButton] = [UIButton]()
    var outletRowTwoAlpha: [UIButton] = [UIButton]()
    var outletRowThreeAlpha: [UIButton] = [UIButton]()
    var outletAllAlpha: [UIButton] = [UIButton]()

    let labelRowOneAlpha = ["q","w","e","r","t","y","u","i","o","p"]
    let labelRowOneNumFirst = ["1","2","3","4","5","6","7","8","9","0"]
    let labelRowOneNumSecond = ["[","]","{", "}", "#", "%", "^", "*", "","="]
    let labelRowTwoNumFirst = ["-","/",":",";",")",")","$","&","@","\""]
    let labelRowTwoNumSecond = ["_","\\","|","~","<",">","€","£","¥","・"]
    
    
    @IBAction func changeButton(_ sender: UIButton) {
        if sender.currentTitle! == "123" {
            stackRowTwoNum.isHidden = false
            stackRowTwoAlpha.isHidden = true
            stackRowThreeNum.isHidden = false
            stackRowThreeAlpha.isHidden = true
            
            setCustomLabel(outletRowOneUniversal, labelRowOneNumFirst)
            setCustomLabel(outletRowTwoNum, labelRowTwoNumFirst)
            
            changeLabel(sender, "ABC")
            
        } else {
            stackRowTwoNum.isHidden = true
            stackRowTwoAlpha.isHidden = false
            stackRowThreeNum.isHidden = true
            stackRowThreeAlpha.isHidden = false
            
            setCustomLabel(outletRowOneUniversal, labelRowOneAlpha)
            setUpperLower(true)
            
            changeLabel(switchNum, "#+=")
            changeLabel(sender, "123")
        }
    }
    
    @IBAction func switchNumButton(_ sender: UIButton) {
        if sender.currentTitle! == "#+=" {
            setCustomLabel(outletRowOneUniversal, labelRowOneNumSecond)
            setCustomLabel(outletRowTwoNum, labelRowTwoNumSecond)
            changeLabel(sender, "123")
        } else {
            setCustomLabel(outletRowOneUniversal, labelRowOneNumFirst)
            setCustomLabel(outletRowTwoNum, labelRowTwoNumFirst)
            changeLabel(sender, "#+=")
        }
    }
    
    func setCustomLabel(_ outlet:[UIButton], _ label: [String]){
        var i = 0
        for button in outlet{
            changeLabel(button, label[i])
            i+=1
        }
    }
    
    func changeLabel(_ button: UIButton,_ label: String){
        UIView.performWithoutAnimation {
            button.setTitle(label, for: .normal)
            button.layoutIfNeeded()
        }
    }
    
    
    @IBAction func upperButton(_ sender: UIButton) {
        let isUpper = outletAllAlpha[0].currentTitle!.uppercased() == outletAllAlpha[0].currentTitle!
        setUpperLower(isUpper)
    }
    
    func setUpperLower(_ isUpper:Bool){
        if isUpper{
            Upper.setImage(UIImage.init(systemName: "shift"), for: .normal)
            Upper.backgroundColor = UIColor.systemGray2
            Upper.tintColor = UIColor.black
        } else {
            Upper.setImage(UIImage.init(systemName: "shift.fill"), for: .normal)
            Upper.backgroundColor = UIColor.white
        }
        
        
        for button in outletAllAlpha{
            let currLabel = button.currentTitle!
            if isUpper {
                changeLabel(button, currLabel.lowercased())
            } else {
                changeLabel(button, currLabel.uppercased())
            }
        }
        
    }
    
    
    @IBAction func insertButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText(sender.currentTitle!)
    }
    
    
    @IBAction func spaceButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText(" ")
        
        
    }
    @IBAction func delButton(_ sender: UIButton) {
        self.textDocumentProxy.deleteBackward()
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("\n")
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        outletRowOneUniversal = [q,w,e,r,t,y,u,i,o,p]
        
        outletRowTwoNum = [char21, char22, char23, char24, char25, char26, char27, char28, char29, char30 ]
        
        outletAllAlpha = [q,w,e,r,t,y,u,i,o,p,a,s,d,f,g,h,j,k,l,z,x,c,v,b,n,m]
    
        stackRowTwoNum.isHidden = true
        stackRowThreeNum.isHidden = true
        
        // Perform custom UI setup here
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    
    override func viewWillLayoutSubviews() {
        print("SUKSESS")
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
//        let frameSize = self.view.frame.size
//      self.mainView.frame = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
    }
    
    var fullText: String = ""
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.

        let proxy = self.textDocumentProxy
        let precedingText = proxy.documentContextBeforeInput ?? ""
        let followingText = proxy.documentContextAfterInput ?? ""
        let selectedText = proxy.selectedText ?? ""
        print("WILL CHANGE")
        fullText = "\(precedingText)\(selectedText)\(followingText)"
        
    }
    
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        print("DID CHANGE")
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        let textBefore = proxy.documentContextBeforeInput ?? "nil18236491824before"
        let textAfter = proxy.documentContextAfterInput ?? "nil18236491824after"
        let selectedText = proxy.selectedText ?? ""
        
        if ((fullText != selectedText) && (textBefore == "nil18236491824before") && (textAfter == "nil18236491824after"))  {
            print(fullText)
            if let parentViewController = self.parent {
                let hostBundleID = parentViewController.value(forKey: "_hostBundleID")
                print(hostBundleID ?? "default value")
            }
        }
        
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }

}
