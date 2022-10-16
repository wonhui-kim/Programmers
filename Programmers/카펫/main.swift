//
//  카펫.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/16.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    
    var result = [Int]()
    
    for i in 1...brown+yellow {
        let row = (brown+yellow)/i
        
        if row < i {
            continue
        }
        
        if yellow == ((row-2)*(i-2)) {
            result.append(contentsOf: [row, i])
            break
        }
        
    }
    
//    for i in 1...yellow { //1...2
//        let row = yellow / i //2, 1
//
//        if brown+yellow == ((row+2)*(i+2)) {
//            result.append(contentsOf: [row+2, i+2])
//            break
//        }
//    }
    
    return result
}

print(solution(10, 2)) //[4,3]
print(solution(8, 1)) //[3,3]
print(solution(24, 24)) //[8,6]
