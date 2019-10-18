//
//  SwiftAgeQueue.swift
//  SwiftAgeQueue
//
//  Created by Shubham Garg on 18/10/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation


public class SwiftAgeQueue {
    
    static var DEFAULT_QUEUE_LIFE:Double = 10
    
    private var timeSlices:[TimeSlice]?
    private var queueLife:Double
    private var deathHandler:DeathHandler?
    private var timer = Timer()
    
    public convenience init() {
        self.init(life:SwiftAgeQueue.DEFAULT_QUEUE_LIFE, deathHandler:nil)
    }
    
    public convenience init(deathHandler:DeathHandler) {
        self.init(life:SwiftAgeQueue.DEFAULT_QUEUE_LIFE, deathHandler:deathHandler)
    }
    
    public init(life:Double, deathHandler:DeathHandler?) {
        self.timeSlices = []
        self.queueLife = life
        self.deathHandler = deathHandler
        
        prepareTimeSlicerThread();
    }
    
    private func prepareTimeSlicerThread() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self,   selector: (#selector(self.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer(){
        if let first = self.timeSlices?.first, (first.getStartTime() + queueLife) >= Date().timeIntervalSince1970 {
            timeSlices?.remove(at: 0)
            self.deathHandler?.onDeath(o: first)
        }
    }
    
    func popTimeSlice()->TimeSlice?{
        if let _ = self.timeSlices?.first {
            return timeSlices?.remove(at: 0)
        }
        return nil
    }
    
    func pushTimeSlice(timeslice: TimeSlice) {
        self.timeSlices?.append(timeslice)
    }
    
    
    public func size()-> Int{
        objc_sync_enter(self)
        defer{
            objc_sync_exit(self)
        }
        return (self.timeSlices?.count ?? 0) > 0 ? self.timeSlices?.map({(t)->Int in
            return t.size()
        }).reduce(0, { (result, val) -> Int in
            return result + val
        }) ?? 0 : 0
        
        
    }
    
    public func isEmpty()->Bool {
        objc_sync_enter(self)
        defer{
            objc_sync_exit(self)
        }
        if ((self.timeSlices?.count ?? 0) > 0) {
            return self.size() == 0
        }
        
        return true;
        
    }
    
    
}
