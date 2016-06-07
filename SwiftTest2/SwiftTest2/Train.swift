//
//  Train.swift
//  SwiftTest2
//
//  Created by 吴泽钦 on 4/13/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

import Foundation

class Train: Transport {
    enum colorEnum {
        case red
        case blue
        case yellow
        case white
    }
    var color : colorEnum
    var carriages : Array<String> = ["one","two","three","four","five","six","seven","eight","nine","ten"]
   
     init(speed :Double ,weight :Double,color : colorEnum ) {
        self.color = color
        super.init(speed: speed,weight:weight)
    }
    override func move(speed: Double, time: Double) {
        print("火车移动的距离",speed*time)
        print("嗡嗡")
    }
    convenience override init(speed : Double , weight : Double) {
        self.init(speed:speed,weight:weight,color:.white)
    }
 
    subscript(index:Int)-> String{
        get{
            return carriages[index]
        }
        set(newValue){
             carriages[index] = newValue
        }
    }
    

}