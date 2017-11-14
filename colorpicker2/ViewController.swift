//
//  ViewController.swift
//  colorpicker2
//
//  Created by devIT on 07/11/2017.
//  Copyright © 2017 Havasi IT dev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var btn_color: UIButton!
    @IBOutlet weak var slider_color: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var buttonFrame = CGRect(
            x: 12,
            y: 100,
            width: 1,
            height: 1)
        var i:CGFloat = 1.0
        while i > 0{
            makeRainbowButtons(buttonFrame: buttonFrame, sat: i ,bright: 1.0)
            i = i - 0.1
            buttonFrame.origin.y = buttonFrame.origin.y + buttonFrame.size.height
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func sliderColor(_ sender: Any) {
        let color = Int(slider_color.value)
        print(color)
       // btn_color.backgroundColor = UIColor(red: CGFloat(Double(color)/255.0), green: CGFloat(Double(color)/255.0), blue: CGFloat(Double(color)/255.0), alpha: 1.0)
        
        let i = Int(slider_color.value)
        let hue:CGFloat = CGFloat(i) / 12.0
        let color2 = UIColor(
            hue: hue,
            saturation: 1.0,
            brightness: 1.0,
            alpha: 1.0)
        btn_color.backgroundColor = color2
    }
    
    func makeRainbowButtons(buttonFrame:CGRect, sat:CGFloat, bright:CGFloat){
        var myButtonFrame = buttonFrame
        for i in 0..<255{
            let hue:CGFloat = CGFloat(i) / 96.0
            let color = UIColor(
                hue: hue,
                saturation: sat,
                brightness: bright,
                alpha: 1.0)
            let aButton = UIButton(frame: myButtonFrame)
            myButtonFrame.origin.x = myButtonFrame.size.width + myButtonFrame.origin.x
            aButton.backgroundColor = color
            view.addSubview(aButton)
        }
    }

    
}

