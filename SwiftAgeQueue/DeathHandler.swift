//
//  DeathHandler.swift
//  SwiftAgeQueue
//
//  Created by Shubham Garg on 18/10/19.
//  Copyright © 2019 Shubham Garg. All rights reserved.
//

import Foundation


public protocol DeathHandler {
    func onDeath(o:TimeSlice)
}
