//
//  TimeSlice.swift
//  SwiftAgeQueue
//
//  Created by Shubham Garg on 18/10/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation

public class TimeSlice {
    private var startTime:Double;
    private var store:SwiftList

    public init() {
        self.startTime = Date().timeIntervalSince1970
        self.store = SwiftList()
    }

    public func add(e:NSObject)->Bool {
        return self.store.add(e: e)
    }
    
    
    public func getStartTime()-> Double{
        return startTime
    }

    public func size()->Int {
        return self.store.count()
    }

    public func toString()->String {
        return "TimeSlice-" + String(self.startTime ) + "[" + String(self.store.count()) + "]"
    }
}
