//
//  BaseKit.swift
//  LYHSwiftDemo
//
//  Created by apple on 2017/2/22.
//  Copyright © 2017年 apple. All rights reserved.
//

import UIKit

class BaseKit: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //创建一个button
        self.creatUIButton()
        //创建一个Label
        self.createUILabel()
        //创建一个UISlider
        self.creatUISlide()
        
    }
    
    
    func creatUIButton(){
        let btn = UIButton()
        btn.frame = CGRect(x: 30, y: 70, width: 60, height: 40)
        btn.backgroundColor = UIColor.orange
        btn.setTitle("button", for: UIControlState.normal)
        btn.addTarget(self, action: #selector(tapped), for: UIControlEvents.touchUpInside)
        self.view.addSubview(btn)
    }
    
    func creatUISlide(){
        let slider=UISlider(frame:CGRect(x: 30, y: 140, width: 150, height: 20))
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.setValue(0.8,animated:true)
        slider.isContinuous=false  //滑块滑动停止后才触发ValueChanged事件
        slider.thumbTintColor = UIColor.red
        slider.minimumTrackTintColor = UIColor.green
        slider.maximumTrackTintColor = UIColor.blue
        slider.addTarget(self, action: #selector(changed(slider:)), for: UIControlEvents.valueChanged)
        //自定义滑块组件图片
        slider.minimumValueImage = UIImage(named: "2.png")
        slider.maximumValueImage = UIImage.init(named: "1.png")
        slider.setThumbImage(UIImage(named: "yuandian.png"), for: UIControlState.normal)
        let imgTrackRight = UIImage(named:"slider_max")
        let imgRight = imgTrackRight!.stretchableImage(withLeftCapWidth: 14, topCapHeight:0)
        slider.setMaximumTrackImage(imgRight, for:UIControlState.normal)
        
        self.view.addSubview(slider)
    }
    
    func createUILabel(){
        /*
         如果变量本事就是不可变的,那么尽量从var改为let,这样Swift的编译器可以对let进行优化，从而获得更好的性能
         */
        let rectRect:CGRect = CGRect(x: 120, y: 70, width: 60, height: 40)
        let label:UILabel = UILabel(frame:rectRect)
        label.text = "label"
        label.textColor = UIColor.red
        label.backgroundColor = UIColor.lightGray
        self.view.addSubview(label)
    }
    /**
     按钮触摸事件方法
     */
    func tapped(button:UIButton){
        
        for i in (0...6) {
            print(i)
        }
        print(button.title(for: UIControlState.normal)!)
        //结果：button
        
        print(button.title(for: UIControlState.normal) as Any)
        //结果：Optional("button")
        
    }
    //slider 的改变事件
    func changed(slider:UISlider){
        print("slider.value = %d",slider.value)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
