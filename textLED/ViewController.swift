//
//  ViewController.swift
//  textLED
//
//  Created by Joy on 2019/6/26.
//  Copyright © 2019 Joy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    
    @IBOutlet weak var label: UILabel!
    
    var gradientLayer:CAGradientLayer!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage()
        self.navigationController?.navigationBar.setBackgroundImage(image, for: .default)
     
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
      
        //建立CAGradientLayer 物件
        gradientLayer = CAGradientLayer()
        
        //設定初始顏色，首尾偏暗，中間偏亮black   white
        gradientLayer.colors = [UIColor.black.withAlphaComponent(0.3).cgColor,UIColor.white.withAlphaComponent(1).cgColor,UIColor.black.withAlphaComponent(0.3).cgColor]
        
        
        //設置每個顏色漸變的點0.0~1.0
        gradientLayer.locations = [0, 0, 0.1]
        
        //漸層起始和結束位置
        gradientLayer.startPoint = CGPoint(x:0, y:0)
        gradientLayer.endPoint = CGPoint(x:1, y:0)
        
        gradientLayer.frame = label.bounds
         // uiview.layer.insertSublayer(gradientLayer,at: 0)
        
        //print(gradientLayer)
        
        //設定動畫，讓顏色由右至左
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = [0, 0, 0.2]
        gradientAnimation.toValue = [0.9 , 1, 1]
        gradientAnimation.isRemovedOnCompletion = false
        gradientAnimation.duration = 3.0
        
        //重複執行
        gradientAnimation.repeatCount = HUGE
        gradientAnimation.fillMode = .forwards
        gradientLayer.add(gradientAnimation,forKey: nil)
        
        //用文字顯示出來
        label.layer.mask = gradientLayer
    }
    
 


}

