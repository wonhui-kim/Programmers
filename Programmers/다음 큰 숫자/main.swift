//
//  다음큰숫자.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/10.
//

import Foundation

func solution(_ n:Int) -> Int
{
    var answer:Int = 0
    
    var copy = n
    let standard = String(n, radix: 2).filter { ($0) == "1" }.count
    
    while (true) {
        let temp = copy+1
        let next = String(temp, radix: 2).filter { ($0) == "1" }.count
        
        if next == standard {
            return temp
        }
        copy += 1
    }
    
    return answer
}

print(solution(78)) //83
print(solution(15)) //23
