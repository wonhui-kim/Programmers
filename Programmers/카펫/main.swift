//
//  카펫.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/16.
//

import Foundation

func solution(_ brown:Int, _ yellow:Int) -> [Int] {
    for i in 1...yellow {
        
        if yellow%i != 0 { //처음에 빠뜨린 조건!
            continue
        }
        
        let row = yellow / i

        if brown+yellow == ((row+2)*(i+2)) {
            return [row+2, i+2]
        }
    }
    
    return []
}

print(solution(10, 2)) //[4,3]
print(solution(8, 1)) //[3,3]
print(solution(24, 24)) //[8,6]
print(solution(18, 6))
