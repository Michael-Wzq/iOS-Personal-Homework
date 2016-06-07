//
//  File.swift
//  SwiftTest2
//
//  Created by 吴泽钦 on 4/13/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

import Foundation

class Transport: NSObject {
    var speed : Double
    var weight : Double
    init(speed :Double , weight :Double) {
        self.speed = speed;
        self.weight = weight;
    }
    func move(speed : Double , time :Double)  {
        print("交通工具移动的距离",speed*time)
    }
    deinit{
        print("Over")
    }
    
}