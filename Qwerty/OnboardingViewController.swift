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

            self.Onboardingstuffs.delegate = self
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
                
            
            
            }

            //set width of scrollview to accomodate all the slides
            Onboardingstuffs.contentSize = CGSize(width: scrollWidth * CGFloat(imgs.count), height: scrollHeight)

            //disable vertical scroll/bounce
            self.Onboardingstuffs.contentSize.height = 1.0

            //initial state
            OnboardingNavigation.numberOfPages = imgs.count
            OnboardingNavigation.currentPage = 0

        }

        //indicator
        @IBAction func pageChanged(_ sender: Any) {
            Onboardingstuffs!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((OnboardingNavigation?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        }

    func animatedImages(for name: String) -> [UIImage] {
        
        var i = 0
        var images = [UIImage]()
        
        while let image = UIImage(named: "\(name)/\(i)") {
            images.append(image)
            i += 1
        }
        return images
    }
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            setIndiactorForCurrentPage()
        }

        func setIndiactorForCurrentPage()  {
            let page = (Onboardingstuffs?.contentOffset.x)!/scrollWidth
            OnboardingNavigation?.currentPage = Int(page)
            print (page)
            if OnboardingNavigation.currentPage == 5 {
                var frame = CGRect(x: 0, y: 0, width: 0, height: 0)
                frame.size = CGSize(width: 500, height: 500)
                let slide = UIView(frame: frame)
                let imageView = UIImageView ()
                imageView.frame  = CGRect (x: 0, y: 0, width: 500 , height: 500)
                imageView.animationImages = animatedImages(for: "tutorial gif-")
                imageView.animationDuration = 0.5
                imageView.animationRepeatCount = 3
                imageView.image = imageView.animationImages?.first
                imageView.startAnimating()
           
                slide.addSubview(imageView)
                Onboardingstuffs.addSubview(slide)
        
        }

        // Do any additional setup after loading the view.
    }



}

