//
//  ViewController.swift
//  Swift_OC_bridge
//
//  Created by 李帅 on 16/9/2.
//  Copyright © 2016年 ChuangHu. All rights reserved.
//

import UIKit

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
        view1.frame = CGRectMake(0, 0, self.view.frame.width, self.view.frame.height * 0.5)
        view1.font = UIFont.systemFontOfSize(12)
        view1.text = "第一个问题"
        view1.textAlignment = NSTextAlignment.Center
        view1.textColor = UIColor.blackColor()
        view1.backgroundColor = UIColor.greenColor()
        self.view.addSubview(view1)
        let line = UIView()
        line.backgroundColor = UIColor.grayColor()
        line.frame = CGRectMake(0, self.view.frame.height * 0.5, self.view.frame.width, 2)
        self.view.addSubview(line)
        let view2 = UILabel()
        view2.frame = CGRectMake(0, self.view.frame.height * 0.5, self.view.frame.width, self.view.frame.height * 0.5)
        view2.font = UIFont.systemFontOfSize(12)
        view2.text = "第二个问题"
        view2.textAlignment = NSTextAlignment.Center
        view2.backgroundColor = UIColor.redColor()
        view2.textColor = UIColor.blackColor()
        self.view.addSubview(view2)
        
    }
    func initialCusView() -> Void {
        self.cusView.frame = CGRectMake(-150, -150, 150, 150)
        self.cusView.font = UIFont.systemFontOfSize(12)
        self.cusView.textAlignment = NSTextAlignment.Center
        self.cusView.textColor = UIColor.whiteColor()
        self.view.addSubview(self.cusView)
    }
    func startAsking(things:String) -> Void {
        self.cusView.text = things
        self.cusView.frame = CGRectMake(0, 0, 150, 150)
        self.cusView.backgroundColor = UIColor.blackColor()
        UIView.animateWithDuration(3, animations: {
            self.cusView.backgroundColor = UIColor.grayColor()
            self.cusView.frame = CGRectMake(self.view.frame.width - 150, self.view.frame.height - 150, 150, 150)
        }) { (true) in
            self.isAnimating = false
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if self.isAnimating {
            return
        }
        let location = touches.first?.locationInView(self.view)
        
        let thing = OCTool.startAskingQuestionWithTag(location?.y > UIScreen.mainScreen().bounds.size.height * 0.5 ? 1 : 0)
        self.startAsking(thing)
        self.isAnimating = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

