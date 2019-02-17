//
//  ExampleViewController.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/8.
//  Copyright © 2019 Allen. All rights reserved.
//

import UIKit

class ExampleViewController: UIViewController {

    @IBOutlet weak var exampleView: UIImageView!
    var exampleLink: String!
    var leImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        exampleView.load(url: URL(string: exampleLink)!)
        guard exampleView.image != nil else {print("exampleView.image is nil!?");return}
    }
    
    @IBAction func sendToPreview(_ sender: Any) {
        
        PVC.draw(exampleView.image!)
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

//Reference: https://www.hackingwithswift.com/example-code/uikit/how-to-load-a-remote-image-url-into-uiimageview

//I think I'm going to modify this func to make it a standalone func
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
