//
//  main.swift
//  SwiftTest2
//
//  Created by 吴泽钦 on 4/13/16.
//  Copyright © 2016 MichaelW. All rights reserved.
//

import Foundation

print("Hello, World!")
func ~= (left : Train,right :Plane) -> Bool {
   
    if  left.color.hashValue == right.color.hashValue{
        return true
    }else {
      
        return false
    }
}


var transportEntity = Transport(speed: 10.0, weight: 20.0)
transportEntity.move(transportEntity.speed, time: 10)

var trainEntityOne = Train(speed: 30.0, weight: 40.0, color: .red)
trainEntityOne.move(trainEntityOne.speed, time: 10)
print("第一辆火车 颜色是",trainEntityOne.color)

for i in 0...9{
    print( trainEntityOne[i] )
}
var trainEntityTwo = Train(speed: 30.5, weight: 40.5)
trainEntityTwo.move(trainEntityTwo.speed, time: 20)
print("第二辆火车 颜色是",trainEntityTwo.color)
for i in 0...9{
    print( trainEntityTwo[i] )
}

var planeEntity = Plane(speed: 50.0, weight: 60.0, color: .white, driver: driverStruct(worktime:10,name:"michael"))
print("飞机的颜色是 ",planeEntity!.color)
if trainEntityOne ~= planeEntity! {
    print("第一辆火车颜色和飞机一样")
}else{
    print("第一辆火车颜色和飞机不一样")
}
if trainEntityTwo ~= planeEntity! {
    print("第二辆火车颜色和飞机一样")
}else{
    print("第二辆火车颜色和飞机不一样")
}

planeEntity!.move(planeEntity!.speed, time: 30)
planeEntity?.driver.changeWorktime(24)







