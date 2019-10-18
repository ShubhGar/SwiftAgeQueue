//
//  SwiftList.swift
//  AgeQueue
//
//  Created by Shubham Garg on 18/10/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation


public class SwiftList{

    private var bins:Node?
    private var size:Int
    
    public  init() {
        self.size = 0;
    }

    public func count()->Int {
        return self.size
    }

    public func isEmpty()->Bool {
        return self.size == 0
    }

    
    public func contains(val:NSObject)-> Bool{
        guard var node = bins else{
            return false
        }
        if node.getVal() == val {
            return true
        }
        
        while node.getNext() != nil {
            node = node.getNext()!
            if node.getVal() == val {
                return true
            }
        }
        return false
    }

   
    
    public func add(e:NSObject)->Bool{
        guard var node = bins else{
            bins = Node(val: e)
            return true
        }
        while node.getNext() != nil {
            node = node.getNext()!
        }
        node.setNext(next:  Node(val: e))
        return true
    }

    class Node {
        private var val:NSObject
        private var next:Node?

        public init( val:NSObject) {
            self.val = val
        }

        public init( val:NSObject, next:Node) {
            self.val = val
            self.next = next
        }

        public func getVal()-> NSObject {
            return val
        }

        public func setVal(val:NSObject) {
            self.val = val
        }

        public func getNext()->Node? {
            return next
        }

        public func setNext(next:Node) {
            self.next = next
        }
    }

}
