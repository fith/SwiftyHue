//
//  Schedule.swift
//
//
//  Created by Jerome Schmitz on 05.05.16.
//
//

import Foundation
import Gloss

public class Schedule: BridgeResource, BridgeResourceDictGenerator {
    
    public typealias AssociatedBridgeResourceType = Schedule
    
    public let identifier: String
    public let name: String
    public let scheduleDescription: String
    public let command: ScheduleCommand
    public let localtime: String?
    public let status: String
    public let autodelete: Bool?
    public let recycle: Bool?
    
    public required init?(json: JSON) {
        
        guard let identifier: String = "id" <~~ json,
            let name: String = "name" <~~ json,
            let scheduleDescription: String = "description" <~~ json,
            let command: ScheduleCommand = "command" <~~ json,
            let status: String = "status" <~~ json
            
            else { Log.error("Can't create Schedule from JSON:\n \(json)"); return nil }
        
        self.identifier = identifier
        self.name = name
        self.scheduleDescription = scheduleDescription
        self.command = command
        self.status = status
        self.recycle = "recycle" <~~ json
        self.autodelete = "autodelete" <~~ json
        self.localtime = "localtime" <~~ json
    }
    
    public func toJSON() -> JSON? {
        
        let json = jsonify([
            "id" ~~> self.identifier,
            "name" ~~> self.name,
            "description" ~~> self.scheduleDescription,
            "command" ~~> self.command,
            "localtime" ~~> self.localtime,
            "status" ~~> self.status,
            "autodelete" ~~> self.autodelete,
            "recycle" ~~> self.recycle
            ])
        
        return json
    }
}

extension Schedule: Hashable {
    
    public var hashValue: Int {
        
        return 1
    }
}

public func ==(lhs: Schedule, rhs: Schedule) -> Bool {
    return lhs.identifier == rhs.identifier &&
        lhs.name == rhs.name &&
        lhs.scheduleDescription == rhs.scheduleDescription &&
        lhs.command == rhs.command &&
        lhs.status == rhs.status &&
        lhs.recycle == rhs.recycle &&
        lhs.autodelete == rhs.autodelete &&
        lhs.localtime == rhs.localtime
}