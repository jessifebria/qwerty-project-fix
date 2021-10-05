//
//  Onboard1ViewController.swift
//  Qwerty
//
//  Created by Jessi Febria on 14/04/21.
//

import UIKit

class Onboard1ViewController: UIViewController{
    
    private let scrollView = UIScrollView()
    let gifView = UIImageView.init()
    var imgs = ["Onboarding1","Onboarding3","Onboarding4","Onboarding5","Onboarding6","Onboarding7","Onboarding2"]
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 7
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.currentPageIndicatorTintColor = .gray
        return pageControl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let ten = view.frame.size.height/84.4
        pageControl.frame = CGRect(x: ten, y: view.frame.size.height - ten*9, width: view.frame.size.width - ten*2, height: ten*7)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        
        if scrollView.subviews.count == 2{
            configureScrollView()
        }
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    private func configureScrollView() {
        let ten = view.frame.size.height/84.4
        let one = view.frame.size.height/844
        scrollView.contentSize = CGSize(width: view.frame.size.width*7, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        for x in 0..<7{
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: view.frame.size.height))
            let onboardImage = UIImageView.init(image: UIImage.init(named: imgs[x]))
            onboardImage.frame = CGRect(x:0,y:0,width:view.frame.size.width*(one*0.8),height:view.frame.size.height*(one*0.8))
            onboardImage.contentMode = .scaleAspectFit
            onboardImage.center = CGPoint(x:scrollView.frame.size.width/2,y: scrollView.frame.size.height/2)
            if x == 5{
                gifView.loadGif(name: "tutorial")
                gifView.frame = CGRect(x:0,y:0,width:ten*33,height:ten*23)
                gifView.center = CGPoint(x:scrollView.frame.size.width/2,y: scrollView.frame.size.height/2.2)
                page.addSubview(gifView)
                let settingButton = UIButton(frame: CGRect(x: 0, y: 0, width: ten*30, height: ten*4))
                settingButton.center = CGPoint(x:scrollView.frame.size.width/2,y: scrollView.frame.size.height - ten*10)
                settingButton.setTitle("Go to Setting", for: .normal)
                settingButton.layer.cornerRadius = ten
                settingButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
                settingButton.setTitleColor(UIColor.white, for: .normal)
                settingButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: ten*1.8)
                settingButton.addTarget(self, action: #selector(self.settingButton), for: .touchUpInside)
                print(view.frame.size.height)
                page.addSubview(settingButton)
            }else if x == 6{
                let passButton = UIButton(frame: CGRect(x: 0, y: 0, width: ten*30, height: ten*4))
                passButton.center = CGPoint(x:scrollView.frame.size.width/2,y: scrollView.frame.size.height - ten*10)
                passButton.setTitle("Buat Password", for: .normal)
                passButton.layer.cornerRadius = ten
                passButton.backgroundColor = UIColor(red:0.14, green:0.38, blue:0.63, alpha:1.0)
                passButton.setTitleColor(UIColor.white, for: .normal)
                passButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: ten*1.8)
                passButton.addTarget(self, action: #selector(self.passButton), for: .touchUpInside)
                page.addSubview(passButton)
            }
            page.addSubview(onboardImage)
            scrollView.addSubview(page)
        }
    }
    
    @objc func settingButton(sender : UIButton) {
        UIApplication.shared.open(URL(string:"App-prefs:General&path=Keyboard")!)
    }
    @objc func passButton(sender : UIButton) {
        performSegue(withIdentifier: "goToSetPassword", sender: sender)
    }
    
}

extension Onboard1ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
    }
}
