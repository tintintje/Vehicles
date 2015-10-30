//
//  Truck.swift
//  Vehicles
//
//  Created by Christine Vinck on 29/10/15.
//  Copyright © 2015 Razeware, LLC. All rights reserved.
//

import Foundation

class Truck : Vehicle {
    
    let cargoCapacityCubicFeet: Int
    
    init(brandName: String, modelName: String, modelYear: Int, powerSource: String, numberOfWheels: Int, cargoCapacityInCubicFeet:Int) {
        self.cargoCapacityCubicFeet = cargoCapacityInCubicFeet
        super.init(brandName: brandName, modelName: modelName, modelYear: modelYear,
            powerSource: powerSource, numberOfWheels: numberOfWheels)
    }
    
    override func stopMoving() -> String {
        return String(format:"Depress brake pedal. %@", changeGears("Park"))
    }
    
    // MARK: - Private methods
    private func soundBackupAlarm() -> String {
        return "Beep! Beep! Beep! Beep!"
    }
    
    override func goBackward() -> String {
        if cargoCapacityCubicFeet > 100 {
            // Sound a backup alarm first
            return String(format:"Wait for \"%@\", then %@", soundBackupAlarm(), changeGears("Reverse"))
        } else {
            return String(format:"%@ Depress gas pedal.", changeGears("Reverse"))
        }
    }
    
    override func makeNoise() -> String {
        switch numberOfWheels {
        case Int.min...4:
            return "Beep beep!"
        case 5...8:
            return "Honk!"
        default:
            return "HOOOOOOOOONK!"
        }
    }
        
    override var vehicleDetails: String {
        // Get basic details from superclass
        let basicDetails = super.vehicleDetails
        
        // Initialize mutable string
        var truckDetailsBuilder = "\n\nTruck-Specific Details:\n\n"
        
        // Add info about truck-specific features.
        truckDetailsBuilder += "Cargo Capacity: \(cargoCapacityCubicFeet) cubic feet"
        
        // Create the final string by combining basic and truck-specific details.
        let truckDetails = basicDetails + truckDetailsBuilder
        
        return truckDetails
    }
}