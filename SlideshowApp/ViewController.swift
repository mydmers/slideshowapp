//
//  ViewController.swift
//  SlideshowApp
//
//  Created by yosi on 2018/01/02.
//  Copyright © 2018年 mydmers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var someimage: UIButton!

    var timer_sec: Float = 0
    var timer: Timer!
    var displayimageNo:Int = 0
    var displayimagesNumbers:Int = 0
    let displayimages = ["IMG_9979.jpg", "IMG_9981.jpg", "IMG_9985.jpg", "IMG_9986.jpg", "IMG_9987.jpg", "IMG_9988.jpg"]

    @IBAction func unwind(_ segue: UIStoryboardSegue) {
    }
//----------------------初期画面
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let n = displayimages.count
        displayimagesNumbers = n - 1
        let name = displayimages[displayimageNo]
        let image = UIImage(named: name)
        someimage.setImage(image!, for: .normal)
    }
//----------------------遷移
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segueから遷移先のResultViewControllerを取得する
        let resultViewController:ResultViewController = segue.destination as! ResultViewController
        resultViewController.imageName = displayimages[displayimageNo]
        
        self.timer.invalidate()
        self.timer = nil
        play.setTitle("再生", for: UIControlState.normal)
    }
//------------------------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
//----------------------戻る
    @IBAction func backward(_ sender: Any) {

        displayimageNo -= 1
        display()
        
    }
//----------------------自動再生
    
    @IBOutlet weak var play: UIButton!
    @IBAction func play(_ sender: Any) {

        if (self.timer == nil) {
            play.setTitle("停止", for: UIControlState.normal)
            
            self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(self.update), userInfo: nil, repeats: true)
        }
        else {
            play.setTitle("再生", for: UIControlState.normal)
            self.timer.invalidate()
            self.timer = nil
        }

     }
//----------------------進む
    @IBAction func forward(_ sender: Any) {
        displayimageNo += 1
        display()
    }
//----------------------表示
    func display(){
        
        if displayimageNo < 0 {
            displayimageNo = displayimagesNumbers
        }
        
        if displayimageNo > displayimagesNumbers {
            displayimageNo = 0
        }
        
        let mame = displayimages[displayimageNo]
        let image = UIImage(named: mame)
        someimage.setImage(image, for: .normal)
    }
//----------------------
    func update(tm: Timer) {
        // do something
        displayimageNo += 1
        display()
    }
}
