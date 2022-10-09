//
//  최솟값만들기.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/09.
//

import Foundation

func solution(_ A:[Int], _ B:[Int]) -> Int
{
    var ans = 0

    var a = A
    a.sort()
    var b = B
    b.sort(by: >)
    
    for i in 0..<A.count {
        ans += a[i] * b[i]
    }

    return ans
}

print(solution([1,4,2], [5,4,4])) //29
print(solution([1,2], [3,4])) //10
