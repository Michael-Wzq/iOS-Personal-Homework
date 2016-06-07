//
//  Plane.swift
//  SwiftTest2
//
//  Created by 吴泽钦 on 4/13/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

import Foundation
enum colorEnum {
    case red
    case blue
    case yellow
    case white
}
struct driverStruct{
        private var worktime:Int
        private var name:String
    init(worktime:Int ,name:String){
        self.worktime = worktime
        self.name = name
        }
        mutating func changeWorktime(worktime:Int)  {
            self.worktime = worktime
            print("工作时间改变成了",self.worktime)
        }
    
    }


class Plane: Transport {
    
    var driver:driverStruct
   
    var color : colorEnum
    
    init?(speed: Double, weight: Double,color:colorEnum,driver:driverStruct) {
        self.color = color
        self.driver = driver
        if  self.driver.name.isEmpty {
            print("初始化失败")
            return nil
        }
        super.init(speed: speed, weight: weight)
        
    }
    
   
    override func move(speed: Double, time: Double) {
         print("飞机移动的距离",speed*time)
         print("呼呼")
    }
    
}