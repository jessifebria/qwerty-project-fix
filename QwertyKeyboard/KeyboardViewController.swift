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
    
    var tempCapslockPressed = false
    
    
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
        if tempCapslockPressed {
            setUpperLower(true)
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
        if isUpper == false {
            tempCapslockPressed = true
        }
    }
    
    func setUpperLower(_ isUpper:Bool){
        if isUpper{
            Upper.setImage(UIImage.init(systemName: "shift"), for: .normal)
            Upper.backgroundColor = UIColor.systemGray2
        } else {
            Upper.setImage(UIImage.init(systemName: "shift.fill"), for: .normal)
            Upper.backgroundColor = UIColor.white
        }
        Upper.tintColor = UIColor.black
        
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
        if tempCapslockPressed {
            setUpperLower(true)
            tempCapslockPressed = false
        }
    }
    
    
    @IBAction func spaceButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText(" ")
        if tempCapslockPressed {
            setUpperLower(true)
            tempCapslockPressed = false
        }
        
    }
    @IBAction func delButton(_ sender: UIButton) {
        self.textDocumentProxy.deleteBackward()
        if tempCapslockPressed {
            setUpperLower(true)
            tempCapslockPressed = false
        }
    }
    
    @IBAction func returnButton(_ sender: UIButton) {
        self.textDocumentProxy.insertText("\n")
        if tempCapslockPressed {
            setUpperLower(true)
            tempCapslockPressed = false
        }
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
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
            tap.numberOfTapsRequired = 2
            Upper.addGestureRecognizer(tap)
        //Don't do in action
     
        
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
    
    @objc func doubleTapped() {
        setUpperLower(false)
        Upper.setImage(UIImage.init(systemName: "capslock.fill"), for: .normal)
        Upper.backgroundColor = UIColor.white
        Upper.tintColor = UIColor.black
        tempCapslockPressed = false
        
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
    
    // MARK: Detection start here
    
    let dataController = KeyboardDataController()
    
    override func textDidChange(_ textInput: UITextInput?) {
        var platform = ""
        var kataKotor = ""
        
        // The app has just changed the document's contents, the document context has been updated.
        print("DID CHANGE")
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        let textBefore = proxy.documentContextBeforeInput ?? "nil18236491824before"
        let textAfter = proxy.documentContextAfterInput ?? "nil18236491824after"
        let selectedText = proxy.selectedText ?? ""
        
        if ((fullText != selectedText) && (textBefore == "nil18236491824before") && (textAfter == "nil18236491824after"))  {
            print("--------------------------------------------------- INI KATANYA ----------------------------")
            print(fullText)
            
            kataKotor = getKataKotor(fullText)
            
            if let parentViewController = self.parent {
                
                let hostBundleID = parentViewController.value(forKey: "_hostBundleID")
                
                platform = bundleToPlatform(hostBundleID! as! String)
        
            }
            if kataKotor != "" {
                dataController.saveHistory(kalimat: fullText, kataKotor: kataKotor, platform: platform)
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
            if dataController.isKataKotor(kata) {
                stringKataKotor += ", \(kata.capitalized)"
            }
        }
        
        if stringKataKotor != "" {
            stringKataKotor += ","
        }
        
        return stringKataKotor
    }
    
    
    
    func bundleToPlatform(_ bundleID : String) -> String{
        
        let bundleDictionary:[String:String] = ["com.apple.Fitness":"Activity","com.apple.AppStore":"AppStore", "com.apple.iBooks":"Books","com.apple.calculator":"Calculator","com.apple.mobilecal":"Calendar","com.apple.camera":"Camera","com.apple.clips":"Clips","com.apple.mobiletimer":"Clock","com.apple.compass":"Compass","com.apple.MobileAddressBook":"Contacts","com.apple.facetime":"FaceTime","com.apple.DocumentsApp":"Files","com.apple.mobileme.fmf1":"FindFriends","com.apple.mobileme.fmip1":"FindiPhone","com.apple.mobilegarageband":"GarageBand","com.apple.Health":"Health","com.apple.Home":"Home","com.apple.iCloudDriveApp":"iCloudDrive","com.apple.iMovie":"iMovie","com.apple.MobileStore":"iTunesStore","com.apple.itunesu":"iTunes","com.apple.mobilemail":"Mail","com.apple.Maps":"Maps","com.apple.MobileSMS":"Messages","com.apple.measure":"Measure","com.apple.Music":"Music","com.apple.news":"News","com.apple.mobilenotes":"Notes","com.apple.mobilephone":"Phone","com.apple.mobileslideshow":"Photos","com.apple.Photo-Booth":"PhotoBooth","com.apple.podcasts":"Podcasts","com.apple.reminders":"Reminders","com.apple.mobilesafari":"Safari","com.apple.Preferences":"Settings","is.workflow.my.app":"Shortcuts","com.apple.stocks":"Stocks","com.apple.tips":"Tips","com.apple.tv":"TV","com.apple.videos":"Videos","com.apple.VoiceMemos":"VoiceMemos","com.apple.Passbook":"Wallet","com.apple.Bridge":"Watch","com.apple.weather":"Weather","com.facebook.Facebook":"Facebook","com.google.ios.youtube":"YouTube","net.whatsapp.WhatsApp":"WhatsApp","com.facebook.Messenger":"Messenger","com.skype.skype":"Skype","com.burbn.instagram":"Instagram","com.viber":"Viber","com.atebits.Tweetie2":"Twitter","com.google.Maps":"GoogleMaps","com.google.GoogleMobile":"Google","com.google.chrome.ios":"Chrome","com.google.Gmail":"Gmail","com.sgiggle.Tango":"Tango","com.google.Translate":"Translate","jp.naver.line":"LINE","com.google.b612":"GoogleEarth","com.midasplayer.apps.candycrushsaga":"CandyCrush","com.kiloo.subwaysurfers":"SubwaySurf","com.getdropbox.Dropbox":"Dropbox","com.toyopagroup.picaboo":"Snapchat","com.ebay.iphone":"eBay","com.pandora":"Pandora","com.yahoo.messenger":"Y!Messenger","com.flexilis.security":"Lookout","com.google.GooglePlus":"Google+","com.linkedin.LinkedIn":"LinkedIn","com.waze.iphone":"Waze","com.kik.chat":"Kik","com.imangi.templerun2":"TempleRun2","com.imangi.templerun":"TempleRun","com.netflix.Netflix":"Netflix","com.blackberry.bbm1":"BBM","com.yahoo.Aerogram":"YahooMail","com.spotify.client":"Spotify","com.apple.store.Jolly":"AppleStore","com.opera.OperaMini":"OperaMini","com.vstudio.camera360":"Camera360","com.ookla.speedtest":"Speedtest","com.tunein.TuneInRadio":"TuneInRadio","com.adobe.PSMobile":"PSExpress","com.soundcloud.TouchApp":"SoundCloud","com.amazon.Amazon":"Amazon","com.apple.Pages":"Pages","com.google.Drive":"Drive","com.outfit7.talkingtom2":"TalkingTom2","com.apple.Numbers":"Numbers","com.apple.Keynote":"Keynote","com.tencent.xin":"WeChat","com.microsoft.wlx":"Messenger","com.nimbuzz.Nimbuzz":"Nimbuzz","com.aviary.Photo-Editor":"Aviary","com.booking.BookingApp":"Booking.com","com.anchorfree.hss":"HotspotVPN","com.supercell.magic":"ClashofClans","com.picsart.studio":"PicsArt","ph.telegra.Telegraph":"Telegram","com.outerspaceapps.itranslate":"iTranslate","com.badoo.Badoo":"Badoo","com.mcafee.gti.ThreatFeed":"ThreatFeed","com.bumptechnologies.bump":"Bump","com.rovio.angrybirdsfree":"AngryBirds","com.melodis.soundhound.free":"SoundHound","com.apple.Remote":"Remote","com.ucweb.ucbrowser.iphone.international":"UCBrowser","net.wooga.diamonddash":"DiamondDash","com.halfbrick.jetpack":"Jetpack","tv.lifechurch.bible":"Bible","com.fingersoft.hillclimbracing":"HillClimb","com.imdb.imdb":"IMDb","com.lianjie.VideoDownloaderFree":"FreeVideo","com.ubercab.UberClient":"Uber","com.supercell.soil":"HayDay","com.niksoftware.snapseedforipad":"Snapseed","com.appsneon.videodlfree":"Download","com.midasplayer.apps.farmheroessaga":"FarmHeroesSaga","com.tumblr.tumblr":"Tumblr","com.zedge.Zedge":"ZEDGE","com.ultimake.smartsync":"Sync.ME","com.groupon.grouponapp":"Groupon","com.vine.iphone":"Vine","com.evernote.iPhone.Evernote":"Evernote","com.google.hangouts":"Hangouts","com.microsoft.skydrive":"OneDrive","com.badrobot.actionmoviefx":"ActionMovie","com.rovio.angrybirdsrio":"AngryBirds","com.naveenium.foursquare":"Foursquare","com.keek.keek":"Keek","com.tripadvisor.LocalPicks":"TripAdvisor","com.cnn.iphone":"CNN","com.myrete.WhosHere":"WhosHere","com.lianjie.PrivateVideoFree2":"FreeVideo","org.wikimedia.wikipedia":"Wikipedia","com.midasplayer.apps.candycrushsodasaga":"CandyCrush","com.yahoo.flickr":"Flickr","com.iwilab.KakaoTalk":"KakaoTalk","com.gameloft.despicableme2":"MinionRush","com.olx.olx":"OLX","com.teamviewer.rc":"TeamViewer","com.teamviewer.teamviewer":"TeamViewer","com.google.Docs":"Docs","com.microsoft.onenote":"OneNote","com.microsoft.Office.Powerpoint":"PowerPoint"]

        if let result = bundleDictionary[bundleID] {
            return result
        }
        
        return bundleToPlatformNotInDictionary(bundleID)
    }
    
    
    func bundleToPlatformNotInDictionary(_ bundleID : String) -> String {
        var start = bundleID.startIndex
        if let tryStart = bundleID.firstIndex(of: ".") {
            start = tryStart
        }
        let end = bundleID.endIndex
        let range = start..<end

        var platform = ""
        
        platform = String(bundleID[range])

        platform = platform.replacingOccurrences(of: ".", with: " ", options: NSString.CompareOptions.literal, range: nil)

        return platform.capitalized.trimmingCharacters(in: .whitespaces)
        
    }
    
    
}
