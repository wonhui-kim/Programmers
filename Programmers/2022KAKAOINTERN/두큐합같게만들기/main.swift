//
//  main.swift
//  Programmers
//
//  Created by 김원희 on 2022/09/20.
//

import Foundation

struct Queue<T> {
    private var queue: [T?] = []
    private var head: Int = 0
    
    public var count: Int {
        return queue.count
    }
    
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head <= queue.count, let element = queue[head] else { return nil }
        queue[head] = nil
        head += 1
        
        if head > 50 {
            queue.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    
    var q1 = Queue<Int>()
    var q2 = Queue<Int>()
    
    var sumOfFirst = 0
    var sumOfSecond = 0
    for i in 0..<queue1.count {
        q1.enqueue(queue1[i])
        q2.enqueue(queue2[i])
        
        sumOfFirst += queue1[i]
        sumOfSecond += queue2[i]
    }
    
    var result = 0
    
    for _ in 0..<queue1.count * 3 {
        if sumOfFirst == sumOfSecond || (sumOfFirst+sumOfSecond) % 2 == 1 {
            return result
        }
        
        if sumOfFirst > sumOfSecond {
            let temp = q1.dequeue()!
            sumOfFirst -= temp
            
            q2.enqueue(temp)
            sumOfSecond += temp
            
            result += 1
        }
        else {
            let temp = q2.dequeue()!
            sumOfSecond -= temp
            
            q1.enqueue(temp)
            sumOfFirst += temp
            
            result += 1
        }
    }
    
    return -1
}


print(solution([3, 2, 7, 2], [4, 6, 5, 1])) //2
print(solution([1, 2, 1, 2], [1, 10, 1, 2])) //7
print(solution([1, 1], [1, 5])) //-1
