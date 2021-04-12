//
//  OnboardingViewController.swift
//  Qwerty
//
//  Created by Michelle Linus on 09/04/21.
//

import UIKit

class OnboardingViewController: UIViewController,UIScrollViewDelegate,UIGestureRecognizerDelegate {

    
    @IBOutlet weak var Onboardingstuffs: UIScrollView!
    @IBOutlet weak var OnboardingNavigation: UIPageControl!
    
    var scrollWidth: CGFloat! = 0.0
        var scrollHeight: CGFloat! = 0.0

        //data for the slides

    var imgs = ["APP ONBOARDING REV 0-2","APP ONBOARDING REV 0-4","APP ONBOARDING REV 0-5","APP ONBOARDING REV 0-6","REVISIIIII ONBOARDING FINAL-7", "REVISIIIII ONBOARDING FINAL-8", "APP ONBOARDING REV 0-3"]

        //get dynamic width and height of scrollview and save it
    override func viewDidLayoutSubviews() {
        scrollWidth = Onboardingstuffs.frame.size.width
        scrollHeight = Onboardingstuffs.frame.size.height
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        //to call viewDidLayoutSubviews() and get dynamic width and height of scrollview
        
        Onboardingstuffs.delegate = self
        
        Onboardingstuffs.isPagingEnabled = true
        Onboardingstuffs.showsHorizontalScrollIndicator = false
        Onboardingstuffs.showsVerticalScrollIndicator = false

        //crete the slides and add them
        var frame = CGRect(x: 0, y: 0, width: 0, height: 0)

        for index in 0..<imgs.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)

            let slide = UIView(frame: frame)

            //subviews
            let imageView = UIImageView.init(image: UIImage.init(named: imgs[index]))
            imageView.frame = CGRect(x:0,y:0,width:640,height:800)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 50)
            
            slide.addSubview(imageView)
            Onboardingstuffs.addSubview(slide)
            if index == 5{
                let gifView = UIImageView.init()
                gifView.loadGif(name: "tutorial")
                gifView.frame = CGRect(x:42,y:170,width:330,height:230)
                gifView.center = CGPoint(x:scrollWidth/2,y: 290)
                slide.addSubview(gifView)
                let settingButton = UIButton(frame: CGRect(x: 20, y: 20, width: 300, height: 40))
                settingButton.center = CGPoint(x:scrollWidth/2,y: 680)
                settingButton.setTitle("Go to Setting", for: .normal)
                settingButton.layer.cornerRadius = 8.0
                settingButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
                settingButton.setTitleColor(UIColor.white, for: .normal)
                settingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
                settingButton.addTarget(self, action: #selector(self.settingButton), for: .touchUpInside)
                slide.addSubview(settingButton)
            }else if index == 6{
                let passButton = UIButton(frame: CGRect(x: 20, y: 20, width: 300, height: 40))
                passButton.center = CGPoint(x:scrollWidth/2,y: 680)
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
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let width = scrollView.frame.width
        let page = Int(round(scrollView.contentOffset.x/width))
        print("CurrentPage:\(page)")
    }
    
    @objc func settingButton(sender : UIButton) {
        UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
    }
    @objc func passButton(sender : UIButton) {
       
    }
    
    
}


