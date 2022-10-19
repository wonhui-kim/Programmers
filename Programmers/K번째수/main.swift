//
//  K번째수.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/19.
//

import Foundation

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    
    return commands.map({ arr in
        return array[arr[0]-1...arr[1]-1].sorted()[arr[2]-1]
    })
    
    /*result 변수를 선언하고 return 밖에 안해주기 때문에 선언하지 않고 바로 return해주는 코드가 위의 코드!*/
//    var result = commands.map ({ element in
//        return array[element[0]-1...element[1]-1].sorted()[element[2]-1]
//    })
//
//    return result
    
    /*기존 코드*/
//    var result = [Int]()
//
//    commands.forEach { element in
//        let arr = array[element[0]-1...element[1]-1].sorted()
//
//        result.append(arr[element[2]-1])
//    }
//
//    return result
    
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]])) //[5, 6, 3]
