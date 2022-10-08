//
//  최댓값과최솟값.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/08.
//

import Foundation

func solution(_ s:String) -> String {
    
    var com = s.components(separatedBy: " ").map({ (element: String) -> Int in
        return Int(element)!
    })
    
    com.sort()
    
    return String(com[0]) + " " + String(com[com.count - 1])
}

print(solution("1 2 3 4")) //"1 4"
print(solution("-1 -2 -3 -4")) //"-4 -1"
print(solution("-1 -1")) //"-1 -1"
