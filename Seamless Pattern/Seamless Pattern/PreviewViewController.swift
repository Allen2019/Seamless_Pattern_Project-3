//
//  PreviewViewController.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/6.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class PreviewViewController: UIViewController {
    
    @IBOutlet weak var pre_view: UIImageView!

    
    func draw () {
        guard let image = viewToImage(with: dVC.drawView) else {return}
        guard let imageInCG = image.cgImage else {return}
        UIGraphicsBeginImageContext(pre_view.frame.size)
        
        let smallWidth = pre_view.frame.width/3
        let smallHeight = pre_view.frame.height/3
        
        let context = UIGraphicsGetCurrentContext()
        
        for j in stride(from: 0, through: pre_view.frame.height, by: smallHeight) {
            for k in stride(from: 0, through: pre_view.frame.width*2/3, by: smallWidth) {
                context?.draw(imageInCG, in: CGRect.init(x: k, y: j, width: smallWidth, height: smallHeight))
            }
        }
        
        pre_view.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        pre_view.transform = CGAffineTransform(scaleX: 1, y: -1)
   
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        draw()
    }
    @IBAction func updateButton(_ sender: Any) {
        draw()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
