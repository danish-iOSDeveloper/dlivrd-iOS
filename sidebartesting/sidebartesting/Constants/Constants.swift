//
//  Constants.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import Foundation
import SwiftUI

//MARK: Defined and initialized the sample data for orders so that its clean and readable in other views
let orders:[Order] = [
    Order(orderID: "test_1", orderStatus: .Accepted, riderStatus: "Arrived at DROPOFF", distance: 5.0, orderAmount: 10.0, orderPickupLocation: PickupLocations.randomElement()! , orderDropOffLocations: Array(dropOffLocations.shuffled().prefix(Int.random(in: 1...3)))),
    Order(orderID: "test_2", orderStatus: .Offered, riderStatus: "Accepted", distance: 6.1, orderAmount: 15.0, orderPickupLocation: PickupLocations.randomElement()! , orderDropOffLocations: Array(dropOffLocations.shuffled().prefix(Int.random(in: 1...3)))),
    Order(orderID: "test_3", orderStatus: .Accepted, riderStatus: "Arrived at DROPOFF", distance: 7.12, orderAmount: 20.0, orderPickupLocation: PickupLocations.randomElement()! , orderDropOffLocations: Array(dropOffLocations.shuffled().prefix(Int.random(in: 1...3)))),
    Order(orderID: "test_4", orderStatus: .Offered, riderStatus: "Accepted", distance: 8.72, orderAmount: 25.0, orderPickupLocation: PickupLocations.randomElement()! , orderDropOffLocations: Array(dropOffLocations.shuffled().prefix(Int.random(in: 1...3))))
]

let PickupLocations: [DropOffLocation] = [
    DropOffLocation(Name:"Kudo's Caff",address:"KFC, Qabail Restaurant Johar Town, Johar Town Main  Boulevard, Lahore, Punjab, Pakistan", date: Date()),
    DropOffLocation(Name:"Caff Cutter",address:"39-Q, 39-Q, 39-Q Johar Town Rd, Block Q Phase 2 Johar Town, Lahore, Punjab 54782, Pakistan", date: Date())
]

let dropOffLocations: [DropOffLocation] = [
    DropOffLocation(Name: "The Fries Project", address: "35-D PIA Main Boulevard, Block D Pia Housing Scheme, Lahore, Punjab 54770, Pakistan", date: Date().addingTimeInterval(7200)),
    DropOffLocation(Name: "University of Central Punjab", address: "Avenue 1 Khayaban-e-Jinnah, pir Mansur Johar Town, Lahore, Punjab, Pakistan", date: Date().addingTimeInterval(7200)),
    DropOffLocation(Name: "Check Ghost Kitchen", address: "Hawthorne Borough School District, Hawthorne, NJ 07506, USA", date: Date().addingTimeInterval(7200)),
    DropOffLocation(Name: "Westfield Garden State Plaza", address: "One Garden State Plaza Pkwy, Paramus, NJ 07652, USA", date: Date().addingTimeInterval(7200))
]

let BaseStagingURL = "https://dlivrd-dash-web-staging-100fa95a9d93.herokuapp.com"
let Apikey = "2e48d06bb4f27f46fb8da4a77940c6be"
enum Router: String, CaseIterable {
    case driverLogin = "/driver/login"
    case driverLogout = "/driver/logout"
}
