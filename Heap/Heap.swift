//
//  Heap.swift
//  Heap
//
//  Created by Binoy Vijayan on 08/04/24.
//

import Foundation

public protocol Heapable {
    
    associatedtype Element: Comparable
    
    /* Inserts a new element into the heap. */
    func push(value: Element)
    
    /* Removes and returns the minimum element from the heap.*/
    func pop() -> Element?
    
    /* Returns the minimum element from the heap without removing it. */
    func peak() -> Element?
    
    /*
     Prints the contents of the heap to the console.
     The heap is printed in its current state, maintaining its structure.
    */
    func printHeap()
}


public class Heap<T: Comparable>: Heapable {
    
    
    var heap: [T]!
    
    /*
        Initializes the MaxHeap with the given array of data.
        - Parameter data: An array of elements conforming to the `Comparable` protocol.
    */
    public init(_ data: [T]) { self.createHeap(from: data) }
    
    
    /*
        Adds a new value to the heap and maintains the heap property.
        - Parameter value: The value to be added to the heap.
    */
    public func push(value: T) {
        heap.append(value)
        siftUp()
    }
    
    
    /*
        Removes and returns the maximum value from the heap and maintains the heap property.
        - Returns: The maximum value in the heap, or nil if the heap is empty.
     */
    public func pop() -> T? {
        if heap.isEmpty { return nil }
        if heap.count == 1 { return heap.removeLast() }
        
        let maxVal = heap[0]
        heap[0] = heap.removeLast()
        siftDown()
        return maxVal
    }
    
    
    /* Returns maximum(first value in 'heap' without removing it) */
    public func peak() -> T? { return heap.isEmpty ?  nil : heap[0] }
    
    
    /*
     Prints the contents of the heap to the console.
     The heap is printed in its current state, maintaining its structure.
    */
    public func printHeap() {
        let str = heap.map { "\($0)"}.joined(separator: ", ")
        print(str)
    }
    
    
    /*
        Creates the MaxHeap from the given array of data.
        - Parameter data: An array of elements conforming to the `Comparable` protocol.
    */
    func createHeap(from data: [T]) {
        heap = data
        for i in stride(from: (data.count / 2) - 1, through: 0, by: -1 ) { heapifyAt(index: i) }
    }
    
    /*
        Returns the index of the parent node of a given child node index.
        - Parameter childIndex: The index of the child node.
        - Returns: The index of the parent node.
    */
    func parentIndex(of childIndex: Int) -> Int { return (childIndex - 1)  / 2 }
    
    
    /*
        Returns the index of the left child node of a given parent node index.
        - Parameter parentIndex: The index of the parent node.
        - Returns: The index of the left child node.
    */
    func leftChild(of parentIndex: Int) -> Int { return (parentIndex * 2) + 1 }
    
    
    /*
        Returns the index of the right child node of a given parent node index.
        - Parameter parentIndex: The index of the parent node.
        - Returns: The index of the right child node.
    */
    func rightChild(of parentIndex: Int) -> Int { return (parentIndex * 2) + 2 }

    
    func heapifyAt(index: Int) { /* Child classes(MinHeap & MaxHeap) should override this method */ }
    
    func siftUp() { /* Child classes(MinHeap & MaxHeap) should override this method */ }
    
    func siftDown() { /* Child classes(MinHeap & MaxHeap) should override this method */ }

}

