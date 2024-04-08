//
//  HeapTests.swift
//  HeapTests
//
//  Created by Binoy Vijayan on 08/04/24.
//

import XCTest
@testable import Heap

final class HeapTests: XCTestCase {
    
    struct Person: Comparable {
        let name: String
        let age: Int
        
        static func < (lhs: Person, rhs: Person) -> Bool {
            return lhs.age < rhs.age
        }
    }

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testPushAndPop() throws {
        
        let data = [4, 2, 7, 1, 9, 3]
        
        let minHeap = MinHeap(data)
        let maxHeap = MaxHeap(data)

        minHeap.push(value: 0)
        XCTAssertEqual(minHeap.pop()!, 0)
        XCTAssertEqual(minHeap.pop()!, 1)
        print(minHeap.pop()!) // Output should be 0
        print(minHeap.pop()!) // Output should be 1

        maxHeap.push(value: 15)
        XCTAssertEqual(maxHeap.pop()!, 15)
        XCTAssertEqual(maxHeap.pop()!, 9)
        
    }
    
    func testEdgeCases() {
        let emptyMinHeap = MinHeap<Int>([])
        XCTAssertNil(emptyMinHeap.pop())
        
        let emptyMaxHeap = MaxHeap<Int>([])
        XCTAssertNil(emptyMaxHeap.pop())
        
        let data = [5]

        let singleElementMinHeap = MinHeap(data)
        XCTAssertEqual(singleElementMinHeap.pop()!, 5)
        
        let singleElementMaxHeap = MaxHeap(data)
        XCTAssertEqual(singleElementMaxHeap.pop()!, 5)
    }
    
    func testHeapProperties() {
        let data = [5, 3, 8, 1, 10]
        let minHeap = MinHeap(data)
        XCTAssertEqual(minHeap.pop()!, 1)
        
        let maxHeap = MaxHeap(data)
        XCTAssertEqual(maxHeap.pop()!, 10)
    }
    
    func testWithStrings() {
        
        let stringData = ["banana", "apple", "cherry", "date"]
       
        let stringMinHeap = MinHeap(stringData)
        XCTAssertEqual(stringMinHeap.pop()!, "apple")

        let stringMaxHeap = MaxHeap(stringData)
        XCTAssertEqual(stringMaxHeap.pop()!, "date")
    }
    
    func testCustomObjects() {

        let personData = [Person(name: "Anand", age: 25), Person(name: "Balu", age: 30), Person(name: "Chandran", age: 20)]
        let personMinHeap = MinHeap(personData)
        XCTAssertEqual(personMinHeap.pop()!.name, "Chandran")
        
        let personMaxHeap = MaxHeap(personData)
        XCTAssertEqual(personMaxHeap.pop()!.name, "Balu")

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
