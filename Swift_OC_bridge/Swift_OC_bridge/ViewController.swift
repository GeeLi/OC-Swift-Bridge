//
//  ViewController.swift
//  Swift_OC_bridge
//
//  Created by 李帅 on 16/9/2.
//  Copyright © 2016年 ChuangHu. All rights reserved.
//

import UIKit
// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func < <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l < r
  case (nil, _?):
    return true
  default:
    return false
  }
}

// FIXME: comparison operators with optionals were removed from the Swift Standard Libary.
// Consider refactoring the code to use the non-optional operators.
fileprivate func > <T : Comparable>(lhs: T?, rhs: T?) -> Bool {
  switch (lhs, rhs) {
  case let (l?, r?):
    return l > r
  default:
    return rhs < lhs
  }
}


class ViewController: UIViewController {
    let cusView = UILabel()
    var isAnimating = Bool.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initialSelf()
        self.initialCusView()
    }
    func initialSelf() -> Void {
        let view1 = UILabel()
        view1.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height * 0.5)
        view1.font = UIFont.systemFont(ofSize: 12)
        view1.text = "第一个问题"
        view1.textAlignment = NSTextAlignment.center
        view1.textColor = UIColor.black
        view1.backgroundColor = UIColor.green
        self.view.addSubview(view1)
        let line = UIView()
        line.backgroundColor = UIColor.gray
        line.frame = CGRect(x: 0, y: self.view.frame.height * 0.5, width: self.view.frame.width, height: 2)
        self.view.addSubview(line)
        let view2 = UILabel()
        view2.frame = CGRect(x: 0, y: self.view.frame.height * 0.5, width: self.view.frame.width, height: self.view.frame.height * 0.5)
        view2.font = UIFont.systemFont(ofSize: 12)
        view2.text = "第二个问题"
        view2.textAlignment = NSTextAlignment.center
        view2.backgroundColor = UIColor.red
        view2.textColor = UIColor.black
        self.view.addSubview(view2)
        
    }
    func initialCusView() -> Void {
        self.cusView.frame = CGRect(x: -150, y: -150, width: 150, height: 150)
        self.cusView.font = UIFont.systemFont(ofSize: 12)
        self.cusView.textAlignment = NSTextAlignment.center
        self.cusView.textColor = UIColor.white
        self.view.addSubview(self.cusView)
    }
    func startAsking(_ things:String) -> Void {
        self.cusView.text = things
        self.cusView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        self.cusView.backgroundColor = UIColor.black
        UIView.animate(withDuration: 3, animations: {
            self.cusView.backgroundColor = UIColor.gray
            self.cusView.frame = CGRect(x: self.view.frame.width - 150, y: self.view.frame.height - 150, width: 150, height: 150)
        }, completion: { (true) in
            self.isAnimating = false
        }) 
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.isAnimating {
            return
        }
        let location = touches.first?.location(in: self.view)
        
        let thing = OCTool.startAskingQuestion(withTag: location?.y > UIScreen.main.bounds.size.height * 0.5 ? 1 : 0)
        self.startAsking(thing!)
        self.isAnimating = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

