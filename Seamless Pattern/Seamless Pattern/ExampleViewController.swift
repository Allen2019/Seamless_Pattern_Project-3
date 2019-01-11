//
//  ExampleViewController.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/8.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet weak var exampleView: DrawView!
    var exampleLines: [[Float]]!
    var lines: [Line] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        for array in exampleLines
        {
            lines.append(Line.init(start: CGPoint(x:CGFloat(array[0]), y:CGFloat(array[1])), end: CGPoint(x:CGFloat(array[2]),y:CGFloat(array[3]))))
        }
        
        exampleView.setLineCap(CGLineCap.round)
        exampleView.setLines(lines)
        exampleView.setNeedsDisplay()
        
    }
    

    /*
    // MARK: - Navigations

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
