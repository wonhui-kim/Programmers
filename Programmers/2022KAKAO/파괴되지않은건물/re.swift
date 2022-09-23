//
//  파괴되지않은건물.swift https://school.programmers.co.kr/learn/courses/30/lessons/92344
//  Programmers
//
//  Created by 김원희 on 2022/09/20.
//

import Foundation

func solution(_ board:[[Int]], _ skill:[[Int]]) -> Int {
    
    var cumulative: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count), count: board.count)
    
//    var battled = board
    
//    skill.forEach { command in
//        for i in command[1]...command[3] {
//            for j in command[2]...command[4] {
//                if command[0] == 1 {
//                    battled[i][j] -= command[5]
//                } else {
//                    battled[i][j] += command[5]
//                }
//            }
//        }
//    }
    
//    var result = 0
//    battled.forEach { row in
//        row.forEach { item in
//            if item > 0 {
//                result += 1
//            }
//        }
//    }
    
    return 0
}



print(solution([[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5],[5,5,5,5,5]],
               [[1,0,0,3,4,4],[1,2,0,2,3,2],[2,1,0,3,1,2],[1,0,1,3,3,1]])) //10

print(solution([[1,2,3],[4,5,6],[7,8,9]],
               [[1,1,1,2,2,4],[1,0,0,1,1,2],[2,2,0,2,0,100]])) //6
