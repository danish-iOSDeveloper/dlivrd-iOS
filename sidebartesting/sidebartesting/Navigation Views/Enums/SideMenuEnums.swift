//
//  SideMenuEnums.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import Foundation

enum SideMenuRowType: Int, CaseIterable{
    case home = 0
    case openOrders
    case earnings
    case driversPortal
    case contactUs
    
    var title: String{
        switch self {
        case .home:
            return "Home"
        case .openOrders:
            return "Open Orders"
        case .earnings:
            return "Earnings"
        case .driversPortal:
            return "Drivers portal"
        case .contactUs:
            return "Contact Us"
        }
    }
    
//    var iconName: String{
//        switch self {
//        case .home:
//            return "home"
//        case .openOrders:
//            return "OpenO"
//        case .chat:
//            return "chat"
//        case .profile:
//            return "profile"
//        }
//    }
}
