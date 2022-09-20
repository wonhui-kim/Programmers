//
//  주차요금계산.swift //https://school.programmers.co.kr/learn/courses/30/lessons/92341
//  Programmers
//
//  Created by 김원희 on 2022/09/19.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let basicTime = fees[0]
    let basicFare = fees[1]
    let additionalTime = fees[2]
    let additionalFare = fees[3]
    
    
    var dict = [String: String]()
    var accumulate = [String: Int]()
    
    records.forEach { str in
        let temp = str.split(separator: " ")
        //temp[0] 시간, temp[1] 차번호, temp[2] IN/OUT
        
        if temp[2] == "IN" {
            dict[String(temp[1])] = String(temp[0])
            if accumulate[String(temp[1])] == nil {
                accumulate[String(temp[1])] = 0
            }
        } else { //"OUT"
            let outTime = temp[0].split(separator: ":") //출차시간 outTime[0] 시간, outTime[1] 분
            let inTime = dict[String(temp[1])]!.split(separator: ":") //입차시간 inTime[0] 시간, inTime[1] 분
            
            var accTime = 0
            
            if let outMinute = Int(outTime[1]), let inMinute = Int(inTime[1]),
                let outHour = Int(outTime[0]), let inHour = Int(inTime[0]) {
                
                if outMinute >= inMinute {
                    accTime += outMinute - inMinute
                    accTime += (outHour - inHour) * 60
                } else {
                    accTime += outMinute + 60 - inMinute
                    accTime += (outHour - 1 - inHour) * 60
                }
            }
            accumulate[String(temp[1])]! += accTime
            dict.removeValue(forKey: String(temp[1])) //출차 시 삭제
        }
    }
    
    //남은 차 검색
    if !dict.isEmpty {
        for (key, value) in dict {
            let inTime = value.split(separator: ":")
            
            if let inHour = Int(inTime[0]), let inMinute = Int(inTime[1]) {
                accumulate[key]! += (23 - inHour) * 60 + (59 - inMinute)
            }
        }
    }
    
    let sorted = accumulate.sorted { $0.0 < $1.0 } //오름차순 정렬
    
    var result = [Int]() //결과 저장 배열
    sorted.forEach { (key: String, value: Int) in
        var fee = 0
        if value <= basicTime {
            fee = basicFare
        } else {
            fee = basicFare + Int(ceil(Double(value - basicTime)/Double(additionalTime))) * additionalFare
        }
        result.append(fee)
    }
    
    return result
}

//print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
////[14600, 34400, 5000]
//print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
////[0, 591]
//print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))
////[14841]
