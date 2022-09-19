//
//  72410.swift
//  Programmers
//
//  Created by 김원희 on 2022/09/16.
//

import Foundation

func solution(_ new_id:String) -> String {
    
    //1단계 대문자 -> 소문자
    let step1 = new_id.lowercased()
    
    //2단계 알파벳 소문자, 숫자, -, _, . 이외 제거
    let step2 = step1.filter { char in
        return char.isLetter || char.isNumber || char == "-" || char == "_" || char == "."
    }
    
    //3단계 연속된 .. -> .
    var step3 = ""
    let temp = Array(step2)
    
    if !temp.isEmpty {
        step3.append(temp[0])
        
        for index in 0..<temp.count-1 {
            let previous = temp[index]
            
            if previous != "." || previous != temp[index+1] {
                step3.append(temp[index+1])
            }
        }
    }
    
    //4단계 처음 끝에 . 시 제거
    var step4 = ""
    
    var startIndex = step3.index(step3.startIndex, offsetBy: 0)
    var endIndex = step3.index(step3.endIndex, offsetBy: 0)
    
    if step3.count >= 2 {
        if step3.first == "." {
            startIndex = step3.index(step3.startIndex, offsetBy: 1)
        }
        if step3.last == "." {
            endIndex = step3.index(step3.endIndex, offsetBy: -1)
        }
        step4 = String(step3[startIndex..<endIndex])
    }
    
    //5단계 빈문자열일 시 a 추가
    var step5 = step4
    if step5 == "" {
        step5.append("a")
    }
    
    //6단계 길이 16 이상 시 15이후 제거
    var step6 = step5
    let minIndex = step6.index(step6.startIndex, offsetBy: 0)
    var maxIndex = step6.index(step6.startIndex, offsetBy: step6.count-1)
    if step6.count > 15 {
        maxIndex = step6.index(step6.startIndex, offsetBy: 15)
        step6 = String(step6[minIndex..<maxIndex])
        
        //마지막 .이면 제거
        if step6.last == "." {
            maxIndex = step6.index(step6.endIndex, offsetBy: -1)
        }
        step6 = String(step6[minIndex..<maxIndex])
    }
    
    
    
    //7단계 길이 2 이하 시 마지막 문자 반복
    var step7: [Character] = Array(step6)
    
    while step7.count < 3 {
        step7.append(step7.last!)
    }
    
    return String(step7)
}

print(solution(".d.t.4.6.d.5.3.r.3.6"))
//print(solution("...!@BaT#*..y.abcdefghijklm")) //"bat.y.abcdefghi"
//print(solution("z-+.^.")) //"z--"
//print(solution("=.=")) //"aaa"
//print(solution("123_.def")) //"123_.def"
//print(solution("abcdefghijklmn.p")) //"abcdefghijklmn"
