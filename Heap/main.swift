//
//  main.swift
//  Heap
//
//  Created by Binoy Vijayan on 08/04/24.
//

import Foundation

/*
 
 Test cases for MinHeap & MaxHeap
 
 */

// Test Case 1: Test initialization and basic functionality
let data = [4, 2, 7, 1, 9, 3]
let minHeap = MinHeap(data)
let maxHeap = MaxHeap(data)

// Test push and pop operations
minHeap.push(value: 0)
print(minHeap.pop()!) // Output should be 0
print(minHeap.pop()!) // Output should be 1


maxHeap.push(value: 15)
print(maxHeap.pop()!) // Output should be 15
print(maxHeap.pop()!) // Output should be 9



// Test Case 2: Test edge cases
let emptyMinHeap = MinHeap<Int>([])
print(emptyMinHeap.pop() ?? "nil") // Output should be nil


let emptyMaxHeap = MaxHeap<Int>([])
print(emptyMaxHeap.pop() ?? "nil") // Output should be nil


let singleElementMinHeap = MinHeap([5])
print(singleElementMinHeap.pop()!) // Output should be 5

let singleElementMaxHeap = MaxHeap([5])
print(singleElementMaxHeap.pop()!) // Output should be 5


// Test Case 3: Test heap properties
let data2 = [5, 3, 8, 1, 10]
let minHeap2 = MinHeap(data2)
print(minHeap2.pop()!) // Output should be 1

let maxHeap2 = MaxHeap(data2)
print(maxHeap2.pop()!) // Output should be 10


// Test Case 4: Test with strings
let stringData = ["banana", "apple", "cherry", "date"]
let stringMinHeap = MinHeap(stringData)
print(stringMinHeap.pop()!) // Output should be "apple"

let stringMaxHeap = MaxHeap(stringData)
print(stringMaxHeap.pop()!) // Output should be "date"



// Test Case 5: Test with custom objects
struct Person: Comparable {
    let name: String
    let age: Int
    
    static func < (lhs: Person, rhs: Person) -> Bool {
        return lhs.age < rhs.age
    }
}

let personData = [Person(name: "Anand", age: 25), Person(name: "Balu", age: 30), Person(name: "Chandran", age: 20)]
let personMinHeap = MinHeap(personData)
print(personMinHeap.pop()!.name) // Output should be "Chandran"

let personMaxHeap = MaxHeap(personData)
print(personMaxHeap.pop()!.name) // Output should be "Balu"







