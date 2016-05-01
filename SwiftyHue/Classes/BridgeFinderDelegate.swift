//
//  BridgeFinderDelegate.swift
//  HueSDK
//
//  Created by Nils Lattek on 24.04.16.
//  Copyright © 2016 Nils Lattek. All rights reserved.
//

import Foundation

public protocol BridgeFinderDelegate: class {
    func bridgeFinder(finder: BridgeFinder, didFinishWithResult bridges: [HueBridge])
}