//
//  올바른괄호.swift
//  Programmers
//
//  Created by 김원희 on 2022/10/09.
//

import Foundation

struct Stack<T> {
    private var stack: [T] = []
    
    public var count: Int {
        return stack.count
    }
    
    public var isEmpty: Bool {
        return stack.isEmpty
    }
    
    public mutating func push(_ element: T) {
        stack.append(element)
    }
    
    public mutating func pop() -> T? {
        return stack.isEmpty ? nil : stack.removeLast()
    }
    
    public mutating func peek() -> T? {
        return stack.isEmpty ? nil : stack.last
    }
}

func solution(_ s:String) -> Bool
{
    var ans:Bool = false
    
    var stack = Stack<Character>()
    
    for i in s {
        if i == "(" {
            stack.push(i)
        } else {
            if !stack.isEmpty {
                stack.pop()
            } else {
                return false
            }
        }
    }
    
    ans = stack.isEmpty ? true : false
    
    return ans
}

print(solution(")))")) //false

//print(solution("()()")) //true
//print(solution("(())()")) //true
//print(solution(")()(")) //false
//print(solution("(()(")) //false
