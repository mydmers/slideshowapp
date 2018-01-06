//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by yosi on 2018/01/02.
//  Copyright © 2018年 mydmers. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var detailedimage: UIImageView!
    var imageName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        detailedimage.image = UIImage(named: imageName)
        
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
