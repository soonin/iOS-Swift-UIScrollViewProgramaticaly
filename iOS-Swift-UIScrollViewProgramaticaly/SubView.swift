//
//  SubView.swift
//  iOS-Swift-UIScrollViewProgramaticaly
//
//  Created by Pooya on 2021-01-01.
//  Copyright © 2021 centurytrail.com. All rights reserved.
//

import UIKit


protocol SubViewDelegate {
    
    func testFunc()
    //    func refreshParentPage(byFactor : String)
    //    func doesShowWarnning(_ yes: Bool, _ message: String, thisPageInfo: AtiveElement) -> Bool
    
}

class SubView: UIView {

    var subViewDelegate : SubViewDelegate!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func loadView() -> SubView {
        let signOutPage = Bundle.main.loadNibNamed("SubView", owner: self, options: nil)?[0] as! SubView
        return signOutPage
    }
    override func awakeFromNib() {
        
        updateThisPage()
        
    }

    func updateThisPage(){
        self.backgroundColor = UIColor.gray
        print("TODO UPDATE")
    }
    
}
