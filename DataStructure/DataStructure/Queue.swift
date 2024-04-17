//
//  Queue.swift
//  DataStructure
//
//  Created by Katherine JANG on 4/18/24.
//

import Foundation

struct SimpleQueue<T>{
    private var queue: [T] = []
    
    public var count: Int {
        return queue.count
    }
    
    public var isEmpty: Bool {
        return queue.isEmpty
    }
    /// mutating: 특정 메소드에서 구조체 또는 열거형 내의 프로퍼티를 수정해야 하는 경우, 해당 메소드의 동작을 변경하도록 하는 것
    public mutating func enqueue(_ element: T) {
        queue.append(element)
    }
    
    public mutating func dequeue() -> T? {
        return isEmpty ? nil : queue.removeFirst()
    }
}


// MARK: -
/// 기존 simpleQueue의 경우 dequeue에서 removeFirst를 해주다면 element 가 하나씩 당겨짐
/// 즉 시간 복잡도 -> O(n)
/// head으 ㅣelement를 삭제하는 dequeue의 작업은 queue 특성상 오버헤드 발생
/// 이를 보완한 방식

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
        guard head <= queue.count, let element = queue[head] else { return }
        queue[head] = nil
        head += 1
        
        /// 계속 dequeue되어서 nil로 할당된 element를 계속 들고있는 것도 비효율적이니,
        ///  적당한 때에 dequeue 된 element들을 제거해주는 작업
        if head > 20 {
            queue.removeFirst(head)
            head = 0
        }
        return element
    }
}

