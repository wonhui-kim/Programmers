//
//  기능개발.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/09.
//

import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var consuming = [Int]()
    
    for i in 0..<progresses.count {
        let temp = 100 - progresses[i] //7
        
        if temp % speeds[i] == 0 {
            consuming.append(temp/speeds[i])
        } else {
            consuming.append(temp/speeds[i]+1)
        }
    }
    
    var count = 0
    var longest = consuming[0]
    
    var result = [Int]()
    for i in 0..<consuming.count {
        if longest < consuming[i] {
            longest = consuming[i]
            result.append(count)
            count = 1
        } else {
            count += 1
        }
        
        if i == consuming.count-1 {
            result.append(count)
        }
    }
    
    return result
}

//print(solution([93, 30, 55], [1, 30, 5])) //[2, 1]
//print(solution([95, 90, 99, 99, 80, 99], [1, 1, 1, 1, 1, 1])) //[1, 3, 2]
//print(solution([10, 10, 10, 10, 10, 10, 10, 10, 10, 10], [10, 10, 10, 10, 10, 10, 10, 10, 10, 10]))
//print(solution([95,95,95,95], [4,3,2,1]))
//print(solution([70], [10]))
//print(solution([76, 76, 76, 76], [4, 8, 6, 3]))
print(solution([1, 1, 50], [100, 2, 1]))
