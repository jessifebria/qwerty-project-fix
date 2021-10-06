//
//  KeyboardViewController.swift
//  QwertyKeyboard
//
//  Created by Jessi Febria on 01/04/21.
//

import UIKit
import CoreData

class KeyboardViewController: UIInputViewController {
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    @IBOutlet var mainView: UIView!
    
    /**
     Universal Button
     */
    @IBOutlet weak var delButton: UIButton!
    @IBOutlet weak var spaceButton: UIButton!
    @IBOutlet weak var returnButton: UIButton!
    @IBOutlet weak var switchAlphaAndCharButton: UIButton!
    
    /**
     ROW ONE universal (alpha -> num, vice versa)
     */
    @IBOutlet weak var qButton: UIButton!
    @IBOutlet weak var wButton: UIButton!
    @IBOutlet weak var eButton: UIButton!
    @IBOutlet weak var rButton: UIButton!
    @IBOutlet weak var tButton: UIButton!
    @IBOutlet weak var yButton: UIButton!
    @IBOutlet weak var uButton: UIButton!
    @IBOutlet weak var iButton: UIButton!
    @IBOutlet weak var oButton: UIButton!
    @IBOutlet weak var pButton: UIButton!
    
    /**
     ROW TWO only Alpha
     */
    @IBOutlet weak var stackRowTwoAlpha: UIStackView!
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var sButton: UIButton!
    @IBOutlet weak var dButton: UIButton!
    @IBOutlet weak var fButton: UIButton!
    @IBOutlet weak var gButton: UIButton!
    @IBOutlet weak var hButton: UIButton!
    @IBOutlet weak var jButton: UIButton!
    @IBOutlet weak var kButton: UIButton!
    @IBOutlet weak var lButton: UIButton!
    
    /**
     ROW THREE only Alpha
     */
    @IBOutlet weak var stackRowThreeAlpha: UIStackView!
    @IBOutlet weak var upperButton: UIButton!
    @IBOutlet weak var zButton: UIButton!
    @IBOutlet weak var xButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    @IBOutlet weak var vButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var nButton: UIButton!
    @IBOutlet weak var mButton: UIButton!
    
    /**
     ROW TWO only Character
     */
    @IBOutlet weak var stackRowTwoNum: UIStackView!
    @IBOutlet weak var charRow2Col1Button: UIButton!
    @IBOutlet weak var charRow2Col2Button: UIButton!
    @IBOutlet weak var charRow2Col3Button: UIButton!
    @IBOutlet weak var charRow2Col4Button: UIButton!
    @IBOutlet weak var charRow2Col5Button: UIButton!
    @IBOutlet weak var charRow2Col6Button: UIButton!
    @IBOutlet weak var charRow2Col7Button: UIButton!
    @IBOutlet weak var charRow2Col8Button: UIButton!
    @IBOutlet weak var charRow2Col9Button: UIButton!
    @IBOutlet weak var charRow2Col10Button: UIButton!
    
    /**
     ROW THREE only Character
     */
    @IBOutlet weak var stackRowThreeNum: UIStackView!
    @IBOutlet weak var switchNumAndCharButton: UIButton!
    
    var outletRowOneUniversal: [UIButton] = [UIButton]()
    var outletRowTwoNum: [UIButton] = [UIButton]()
    var outletRowTwoAlpha: [UIButton] = [UIButton]()
    var outletRowThreeAlpha: [UIButton] = [UIButton]()
    var outletAllAlpha: [UIButton] = [UIButton]()
    
    let bundleIDService = BundleIDService()
    
    let labelRowOneAlpha = ["q","w","e","r","t","y","u","i","o","p"]
    let labelRowOneNumFirst = ["1","2","3","4","5","6","7","8","9","0"]
    let labelRowOneNumSecond = ["[","]","{", "}", "#", "%", "^", "*", "+","="]
    
    let labelRowTwoNumFirst = ["-","/",":",";","(",")","$","&","@","\""]
    let labelRowTwoNumSecond = ["_","\\","|","~","<",">","€","£","¥","・"]
    
    var isOneTimeCapslock = false
    
    var pendingButton: String?
    
    //MARK: KEYBOARD LIFE CYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(">>>>> VIEW DID LOAD")
        
        setupVar()
        
        setupAlphaView()
        
        setTriggerForDoubleTapInUpperButton()
        
        /**
         Default custom setup
         */
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    func setupVar(){
        /**
         Grouping all var to make the changes in UI can be more effective and easy to manage.
         */
        
        outletRowOneUniversal = [qButton,wButton,eButton,rButton,tButton,yButton,uButton,iButton,oButton,pButton]
        
        outletRowTwoNum = [charRow2Col1Button, charRow2Col2Button, charRow2Col3Button, charRow2Col4Button, charRow2Col5Button, charRow2Col6Button, charRow2Col7Button, charRow2Col8Button, charRow2Col9Button, charRow2Col10Button ]
        
        outletAllAlpha = [qButton,wButton,eButton,rButton,tButton,yButton,uButton,iButton,oButton,pButton,aButton,sButton,dButton,fButton,gButton,hButton,jButton,kButton,lButton,zButton,xButton,cButton,vButton,bButton,nButton,mButton]
    }
    
    func setTriggerForDoubleTapInUpperButton(){
        /**
         Add gesture in the upper button, whenever the user tap 2x fast it will trigger the doubleTapper function
         */
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        upperButton.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        setToLower(false)
        
        upperButton.setImage(UIImage.init(systemName: "capslock.fill"), for: .normal)
        
        isOneTimeCapslock = false
        
    }
    
    func setupCharView(){
        stackRowTwoNum.isHidden = false
        stackRowThreeNum.isHidden = false
        
        stackRowTwoAlpha.isHidden = true
        stackRowThreeAlpha.isHidden = true
    }
    
    func setupAlphaView(){
        stackRowTwoNum.isHidden = true
        stackRowThreeNum.isHidden = true
        
        stackRowTwoAlpha.isHidden = false
        stackRowThreeAlpha.isHidden = false
        
        setToLower(true)
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
        //        let frameSize = self.view.frame.size
        //      self.mainView.frame = CGRect(x: 0, y: 0, width: frameSize.width, height: frameSize.height)
    }
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
    }
    
    @IBAction func changeButton(_ sender: UIButton) {
        if sender.currentTitle == "ABC" {
            
            setupAlphaView()
            
            setCustomLabel(outletRowOneUniversal, labelRowOneAlpha)
            
            changeLabel(sender, "123")
            
        } else {
            
            setupCharView()
            
            setCustomLabel(outletRowOneUniversal, labelRowOneNumFirst)
            setCustomLabel(outletRowTwoNum, labelRowTwoNumFirst)
            
            changeLabel(switchNumAndCharButton, "#+=")
            changeLabel(sender, "ABC")
        }
    }
    
    @IBAction func switchNumButton(_ sender: UIButton) {
        if isOneTimeCapslock {
            setToLower(true)
        }
        
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
    
    @IBAction func upperButton(_ sender: UIButton) {
        let isUpper = outletAllAlpha[0].currentTitle!.uppercased() == outletAllAlpha[0].currentTitle!
        
        isOneTimeCapslock = true
        
        setToLower(isUpper)
    }
    
    
    @IBAction func insertButton(_ sender: UIButton) {
        
        print("BUTTON TOUCH UP INSIDE IN \(sender.currentTitle!)")
        
        if self.pendingButton == sender.currentTitle {
            
            DispatchQueue.main.async {
                self.textDocumentProxy.insertText(sender.currentTitle!)
            }
            
            self.pendingButton = nil
            self.backToNoCapslockIfTappedAfterOneTimeCapslockOn()
            
            print("BUTTON ADD \(sender.currentTitle!)")
        }
    }
    
    
    @IBAction func insertButtonTouchDown(_ sender: UIButton) {
        
        print("BUTTON TOUCH DOWN to \(sender.currentTitle!)")
        print("-----------------------")
        if let pendingText = self.pendingButton {
            
            DispatchQueue.main.async {
                self.textDocumentProxy.insertText(pendingText)
            }
            
            self.backToNoCapslockIfTappedAfterOneTimeCapslockOn()
            print("BUTTON ADD \(pendingText)")
        }
        
        
        self.pendingButton = sender.currentTitle!
        
    }
    
    @IBAction func spaceButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText(" ")
        backToNoCapslockIfTappedAfterOneTimeCapslockOn()
    }
    
    @IBAction func delButton(_ sender: UIButton) {
        self.textDocumentProxy.deleteBackward()
        backToNoCapslockIfTappedAfterOneTimeCapslockOn()
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("\n")
        backToNoCapslockIfTappedAfterOneTimeCapslockOn()
    }
    
    func setToLower(_ isUpper:Bool){
        for button in outletAllAlpha{
            let currLabel = button.currentTitle!
            if isUpper {
                changeLabel(button, currLabel.lowercased())
            } else {
                changeLabel(button, currLabel.uppercased())
            }
        }
        
        if isUpper{
            upperButton.setImage(UIImage.init(systemName: "shift"), for: .normal)
            upperButton.backgroundColor = KeyboardColors.bgSpecButton
            upperButton.tintColor = UIColor.label
        } else {
            upperButton.setImage(UIImage.init(systemName: "shift.fill"), for: .normal)
            upperButton.backgroundColor = UIColor.white
            upperButton.tintColor = UIColor.black
        }
    }
    
    func backToNoCapslockIfTappedAfterOneTimeCapslockOn(){
        if isOneTimeCapslock {
            setToLower(true)
            isOneTimeCapslock = false
        }
    }
    
    func setCustomLabel(_ outlet:[UIButton], _ label: [String]){
        var i = 0
        for button in outlet{
            self.changeLabel(button, label[i])
            i+=1
        }
    }
    
    func changeLabel(_ button: UIButton,_ label: String){
        DispatchQueue.main.async {
            UIView.performWithoutAnimation {
                button.setTitle(label, for: .normal)
                button.layoutIfNeeded()
            }
        }
    }
    
    // MARK: START DETECTION
    
    var fullText: String = ""
    
    let dataController = KeyboardDataController()
    
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
        
        let proxy = self.textDocumentProxy
        let precedingText = proxy.documentContextBeforeInput ?? ""
        let followingText = proxy.documentContextAfterInput ?? ""
        let selectedText = proxy.selectedText ?? ""
        
        fullText = "\(precedingText)\(selectedText)\(followingText)"
        
    }
    
    
    override func textDidChange(_ textInput: UITextInput?) {
        var platform = ""
        var kataKotor = ""
        
        // The app has just changed the document's contents, the document context has been updated.
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        let textBefore = proxy.documentContextBeforeInput ?? "nil18236491824before"
        let textAfter = proxy.documentContextAfterInput ?? "nil18236491824after"
        let selectedText = proxy.selectedText ?? ""
        
        print(">>>> \(textBefore) >>>> \(textAfter)")
        
        if ((fullText != selectedText) && (textBefore == "nil18236491824before") && (textAfter == "nil18236491824after"))  {
            
            print(self.hasFullAccess)
            print("--------------------------------------------------- INI KATANYA ----------------------------")
            print(fullText)
            dataController.saveKeyboardSetting(self.hasFullAccess)
            kataKotor = getKataKotor(fullText)
            
            if let parentViewController = self.parent {
                
                let hostBundleID = parentViewController.value(forKey: "_hostBundleID")
                
                platform = bundleIDService.bundleToPlatform(hostBundleID! as! String)
                
                print(">>>> MEMORY ADDRESS OF BUNDLE SERVICE", Unmanaged.passUnretained(bundleIDService).toOpaque)
                print(Unmanaged.passUnretained(bundleIDService).toOpaque())
                //                print(">>>> MEMORY ADDRESS OF BUNDLE SERVICE", UnsafePointer())
            }
            print("kata kotor \(kataKotor)")
            if kataKotor != "" {
                dataController.saveHistory(kalimat: fullText, kataKotor: kataKotor, platform: platform)
                print("history save")
            }
            
        }
        
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
    func getKataKotor(_ kalimat : String) -> String {
        let kataArray = kalimat.components(separatedBy: " ")
        var stringKataKotor = ""
        
        for kata in kataArray{
            print("kata == \(kata)")
            if dataController.isKataKotor(kata) {
                stringKataKotor += ", \(kata.capitalized)"
            }
        }
        
        if stringKataKotor != "" {
            stringKataKotor += ","
        }
        
        return stringKataKotor
    }
    
}
