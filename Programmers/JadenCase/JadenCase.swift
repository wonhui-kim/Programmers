//
//  JadenCase.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/08.
//

import Foundation

func solution(_ s:String) -> String {
    
    let com = s.components(separatedBy: " ")
    
    var newStr = [String]()
    com.forEach { str in
        if str.isEmpty || str.first!.isNumber {
            newStr.append(str.lowercased())
        } else {
            newStr.append(str.capitalized)
        }
    }
    
    return newStr.joined(separator: " ")
}

print(solution("3people     UnFollowed me")) //"3people Unfollowed Me"
print(solution("for the last  w eek")) //"For The Last Week"
print(solution(" 3peoPle     unFollowed me  ")) //"3people Unfollowed Me"
