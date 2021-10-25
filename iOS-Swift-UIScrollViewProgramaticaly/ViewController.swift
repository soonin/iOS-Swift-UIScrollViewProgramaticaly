//
//  ViewController.swift
//  iOS-Swift-UIScrollViewProgramaticaly
//
//  Created by Pooya on 2020-06-25.
//  Copyright © 2020 centurytrail.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var referenceSubView : SubView!

    var keyboardSapceView = UIView()
//    var blindView = UIView()
    
    var subView = UIView()
    var subScrollView: UIScrollView!
    var subContentView = UIView()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        AppSettings.blind = blindView
//        view.addSubview(AppSettings.blind)
//        AppSettings.blind.frame = AppSettings.screenRect
//        AppSettings.blind.alpha = 0
//        AppSettings.blind.backgroundColor = UIColor(white: 0, alpha: 0.5)

        
        let keyboardHeight:CGFloat = AppSettings.keyboardHeight //  UIScreen.main.bounds.size.height * 0.2
        
        //view.addSubview(subView) //MADEScrolling========
        subScrollView = UIScrollView(frame: subView.bounds)
        view.addSubview(subScrollView)
        subScrollView.addSubview(subContentView)
        subContentView.addSubview(subView)
        subContentView.addSubview(keyboardSapceView)
        subScrollView.backgroundColor = UIColor.clear
        subScrollView.contentSize = CGSize(width:subView.bounds.width, height: subView.bounds.height + keyboardHeight )
        subContentView.centerXAnchor.constraint(equalTo: subScrollView.centerXAnchor).isActive = true
        subContentView.widthAnchor.constraint(equalTo: subScrollView.widthAnchor).isActive = true
        subContentView.topAnchor.constraint(equalTo: subScrollView.topAnchor).isActive = true
        subContentView.bottomAnchor.constraint(equalTo: subScrollView.bottomAnchor).isActive = true
        
        self.referenceSubView = SubView().loadView()
        self.subView.addSubview(referenceSubView!)
        self.referenceSubView?.frame = subView.frame
        referenceSubView.subViewDelegate = self
        
        subScrollView.frame = CGRect(x: 0, y: 20, width: AppSettings.screenWidth , height: AppSettings.screenHeight-20)
        
        subContentView.frame.size = CGSize(width: subScrollView.frame.width, height: subScrollView.frame.height + AppSettings.keyboardHeight)
        subView.frame.size = subScrollView.frame.size
        subContentView.leadingAnchor.constraint(equalTo: subView.leadingAnchor, constant: 0).isActive = true;
        subContentView.trailingAnchor.constraint(equalTo: subView.trailingAnchor, constant: 0).isActive = true;
        subContentView.topAnchor.constraint(equalTo: subView.topAnchor, constant: 0).isActive = true;
        subView.bottomAnchor.constraint(equalTo: keyboardSapceView.topAnchor, constant: 0).isActive = true;
        keyboardSapceView.topAnchor.constraint(equalTo: subView.bottomAnchor, constant: 0).isActive = true;
        subContentView.bottomAnchor.constraint(equalTo: self.keyboardSapceView.bottomAnchor, constant: 0).isActive = true;

    }

}

extension ViewController : SubViewDelegate{
    func testFunc() {
        print("TODO ")
    }

}

struct AppSettings {
//    static var blind : UIView!
    static var screenRect:CGRect = UIScreen.main.bounds
    static var screenWidth:CGFloat = screenRect.size.width
    static var screenHeight:CGFloat = screenRect.size.height
    static var keyboardHeight:CGFloat = screenRect.size.height * 0.2
}
