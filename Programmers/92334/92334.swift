//
//  92334.swift https://school.programmers.co.kr/learn/courses/30/lessons/92334
//  Programmers
//
//  Created by 김원희 on 2022/09/15.
//

import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    let userCount = id_list.count
    
    var arr: [[Int]] = Array(repeating: Array(repeating: 0, count: userCount), count: userCount)
    
    var dict = [String: Int]() //호출이 편하도록 dictionary 선언
    id_list.enumerated().forEach { (index, element) in //2차원 배열 각 0번 인덱스에 유저 이름 넣기
        dict[element] = index
    }
    
    for r in report {
        let temp = r.split(separator: " ")
        
        let reported = dict[String(temp[1])]!
        let reporter = dict[String(temp[0])]!
        
        arr[reported][reporter] = 1
    }
    
    var blocked = [Int]() //정지 당한 유저 저장
    for i in 0..<userCount {
        var reportedCount = 0
        for j in 0..<userCount {
            reportedCount += arr[i][j]
        }
        if reportedCount >= k {
            blocked.append(i)
        }
    }
    
    var result = Array(repeating: 0, count: userCount)
    for b in blocked {
        for idx in 0..<userCount {
            if arr[b][idx] == 1 {
                result[idx] += 1
            }
        }
    }
    
    return result
}

//print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2)) //[2,1,1,0]
print(solution(["con", "ryan"], ["ryan con", "ryan con", "ryan con", "ryan con"], 3))
