//
//  OnboardingViewController.swift
//  Qwerty
//
//  Created by Michelle Linus on 09/04/21.
//

import UIKit

class OnboardingViewController: UIViewController,UIScrollViewDelegate {

    
    @IBOutlet weak var Onboardingstuffs: UIScrollView!
    @IBOutlet weak var OnboardingNavigation: UIPageControl!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0

        //data for the slides

    var imgs = ["OnboardingFinal-2","OnboardingFinal-4","OnboardingFinal-5","OnboardingFinal-6","OnboardingFinal-7","OnboardingFinalRev-8","OnboardingFinal-3"]

        //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = Onboardingstuffs.frame.size.width
        scrollHeight = Onboardingstuffs.frame.size.height
    }
    let gifView = UIImageView.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        
        let tenPixelWidth = view.frame.width / 39
        let tenPixelHeight = view.frame.height / 84.4
        
        Onboardingstuffs.delegate = self
        
        Onboardingstuffs.isPagingEnabled = true
        Onboardingstuffs.showsHorizontalScrollIndicator = false
        Onboardingstuffs.showsVerticalScrollIndicator = false

        //create the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        for index in 0..<imgs.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)

            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:0,width:view.frame.width,height:view.frame.height)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:view.frame.width/2,y: view.frame.height/2 - tenPixelHeight*5)
            
            slide.addSubview(imageView)
            Onboardingstuffs.addSubview(slide)
            if index == 5{
                gifView.loadGif(name: "tutorial")
                gifView.frame = CGRect(x:tenPixelWidth*4,y:tenPixelHeight*17,width:tenPixelWidth*33,height:tenPixelHeight*23)
                gifView.center = CGPoint(x:scrollWidth/2,y: tenPixelHeight*33.5)
                slide.addSubview(gifView)
                let settingButton = UIButton(frame: CGRect(x: tenPixelWidth*2, y: tenPixelHeight*2, width: tenPixelWidth*30, height: tenPixelHeight*4))
                settingButton.center = CGPoint(x:scrollWidth/2,y: tenPixelHeight*68)
                settingButton.setTitle("Go to Setting", for: .normal)
                settingButton.layer.cornerRadius = 8.0
                settingButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
                settingButton.setTitleColor(UIColor.white, for: .normal)
                settingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                settingButton.addTarget(self, action: #selector(self.settingButton), for: .touchUpInside)
                slide.addSubview(settingButton)
            }else if index == 6{
                let passButton = UIButton(frame: CGRect(x: tenPixelWidth*2, y: tenPixelHeight*2, width: tenPixelWidth*30, height: tenPixelHeight*4))
                passButton.center = CGPoint(x:scrollWidth/2,y: tenPixelHeight*68)
                passButton.setTitle("Buat Password", for: .normal)
                passButton.layer.cornerRadius = 8.0
                passButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
                passButton.setTitleColor(UIColor.white, for: .normal)
                passButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                passButton.addTarget(self, action: #selector(self.passButton), for: .touchUpInside)
                slide.addSubview(passButton)
            }
        
        
        }
        
        
        //set width of scrollview to accomodate all the slides
        Onboardingstuffs.contentSize = CGSize(width: scrollWidth * CGFloat(imgs.count), height: scrollHeight)

        //disable vertical scroll/bounce
        self.Onboardingstuffs.contentSize.height = 1.0

        //initial state
        OnboardingNavigation.numberOfPages = imgs.count
        OnboardingNavigation.currentPage = 0
        
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        gifView.image = nil
//        gifView.removeFromSuperview()
//    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let page = Int(round(scrollView.contentOffset.x/width))
        print("CurrentPage:\(page)")
    }
    
    @objc func settingButton(sender : UIButton) {
        UIApplication.shared.open(URL(string:"App-Prefs:root=General/Keyboard")!)
    }
    @objc func passButton(sender : UIButton) {
        performSegue(withIdentifier: "goToSetPassword", sender: sender)
    }
    
    
}


