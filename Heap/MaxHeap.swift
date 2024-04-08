//
//  MaxHeap.swift
//  Heap
//
//  Created by Binoy Vijayan on 08/04/24.
//

import Foundation


/* A generic class representing a MaxHeap data structure. */

public class MaxHeap<T: Comparable>: Heap<T> {
        
    /* Adjusts the heap structure downwards from a given index to maintain the heap property. */
    override func siftDown() {
        
        var index = 0
        while true {
            let left = leftChild(of: index)
            let right = rightChild(of: index)
            var largest = index
            
            if left < heap.count && heap[left] > heap[largest] { largest = left }
            if right < heap.count && heap[right] > heap[largest] { largest = right }
            if largest == index  { return }
            heap.swapAt(largest, index)
            index = largest
        }
    }
    
    
    /* Adjusts the heap structure upwards from a given index to maintain the heap property. */
    override func siftUp() {
        var child = heap.count - 1
        var parent = parentIndex(of: child)
        
        while child > 0 && heap[child] > heap[parent] {
            heap.swapAt(child, parent)
            child = parent
            parent = parentIndex(of: child)
        }
    }
    
    
    /*
         Recursively adjusts the heap structure downwards from a given index to maintain the heap property.
         - Parameter index: The index to start heapifying from.
    */
    override func heapifyAt(index: Int) {
        let left = leftChild(of: index)
        let right = rightChild(of: index)
        var largest = index
        
        if left < heap.count && heap[left] > heap[largest] { largest = left }
        if right < heap.count && heap[right] > heap[largest] { largest = right }
        if largest != index {
            heap.swapAt(largest, index)
            heapifyAt(index: largest)
        }
    }
}
