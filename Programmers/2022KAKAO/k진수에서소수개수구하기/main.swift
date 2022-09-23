//
//  k진수에서소수개수구하기.swift
//  Programmers
//
//  Created by 김원희 on 2022/09/21.
//

import Foundation

func isPrime(num: Int64) -> Bool {
    if num == 0 {
        return false
    }
    if (num > 0 && num < 4) {
        return num == 1 ? false : true
    }
    for i in 2...Int64(sqrt(Double(num))) {
        if (num % i == 0) { return false }
    }
    return true
}

func makeNum(arr: [Int64]) -> Int64 {
    var num: Int64 = 0
    for i in 0..<arr.count {
        num += Int64(pow(10.0, Double(i))) * arr[arr.count-1-i]
    }
    
    return num
}

func solution(_ n:Int, _ k:Int) -> Int {
    let prime = Array(String(n, radix: k))
    
    var result = 0
    var forPrime = [Int64]()
    
    for idx in 0..<prime.count {
        if prime[idx] == "0" {
            if isPrime(num:makeNum(arr: forPrime)) {
                result += 1
            }
            forPrime = []
        } else if idx == prime.count-1 {
            if let num = Int64(String(prime[idx])) {
                forPrime.append(num)
            }
            
            if isPrime(num:makeNum(arr: forPrime)) {
                result += 1
            }
            forPrime = []
        } else {
            if let num = Int64(String(prime[idx])) {
                forPrime.append(num)
            }
        }
    }
    
    return result
}

//조건
//1. 0P0 소수 양쪽 0
//2. P0 소수 오른쪽 0
//3. 0P 소수 왼쪽 0
//4. P 소수 양쪽 아무것도, but 각 자리수에 0이 없을 경우

print(solution(437674, 3)) //3 -> 211020101011
print(solution(110011, 10)) //2
print(solution(191, 10))
print(solution(00, 10))
print(solution(36, 3))
//print(solution(524287, 2))
//print(solution(1000000, 3))
