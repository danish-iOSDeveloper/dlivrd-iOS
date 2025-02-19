//
//  order.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import Foundation

class Order: Identifiable {
    var orderID: String
    var orderStatus: orderStatus
    var riderStatus: String
    var distance: Float
    var orderAmount: Float
    var orderPickupLocation: DropOffLocation
    var orderDropOffLocations: [DropOffLocation]
    init(orderID: String, orderStatus: orderStatus, riderStatus: String, distance: Float, orderAmount: Float, orderPickupLocation: DropOffLocation, orderDropOffLocations: [DropOffLocation]) {
        self.orderID = orderID
        self.orderStatus = orderStatus
        self.riderStatus = riderStatus
        self.distance = distance
        self.orderAmount = orderAmount
        self.orderPickupLocation = orderPickupLocation
        self.orderDropOffLocations = orderDropOffLocations
    }
}
class DropOffLocation: Identifiable, Codable {
    internal var id = UUID()
    var Name: String
    var address: String
    var date: Date
    init(Name: String = "", address: String = "", date: Date = Date()) {
        self.Name = Name
        self.address = address
        self.date = date
    }
}
