//
//  ImageExample.swift
//  Seamless Pattern
//
//  Created by allen01px2019 on 2019/1/11.
//  Copyright © 2019 Allen. All rights reserved.
//

import Foundation
//https://www.dropbox.com/s/wnos9aie482ebrh/imageExamplesTrial-1.json?dl=1

struct ImageExample : Encodable, Decodable {
    
    private enum CodingKeys : String, CodingKey {
        case title = "title"
        case contents = "contents"
    }
    var title : String?
    var contents: [[String]]?
    
}

