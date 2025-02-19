//
//  OrderCardView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import SwiftUI

struct OrderCardView: View {
    //Properties
    let orders: [Order]
    @Binding var selectedButton: Int
    var filteredOrders: [Order] {
        return selectedButton == 0 ? orders.filter {$0.orderStatus != .Accepted} : orders.filter {$0.orderStatus == .Accepted }
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if selectedButton == 0 && filteredOrders.count < 1 {
                Text("No Orders Offered")
            } else if selectedButton == 1 && filteredOrders.count < 1 {
                Text("No Orders Accepted")
            } else {
                // ForEach to show Multiple order Cards
                ForEach(filteredOrders, id:\.orderID) { order in
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("Order ID: # ")
                                .font(.custom("Poppins", size: 14))
                                .fontWeight(.semibold)
                            +
                            Text("\(order.orderID)")
                                .font(.custom("Poppins", size: 14))
                                .fontWeight(.regular)
                            Spacer()
                            Text(order.riderStatus)
                                .textDecoration(size: 14, fontWeight: .bold, color: acceptedtextColor)
                        }
                        HStack {
                            Image("Routing")
                            Text("Mileage: ")
                                .font(.custom("Poppins", size: 12))
                                .fontWeight(.bold)
                            +
                            Text("\(String(format: "%.1f", order.distance)) mi")
                                .font(.custom("Poppins", size: 12))
                            Text("|")
                                .font(.custom("Poppins", size: 12))
                            
                            Image("Dollar")
                            Text("Earning: $")
                                .font(.custom("Poppins", size: 12))
                                .fontWeight(.bold)
                            +
                            Text("\(String(format: "%.1f", order.orderAmount))")
                                .font(.custom("Poppins", size: 12))
                        }
                        Divider()
                        VStack(alignment: .leading, spacing: 20) {
                            
                            locationView(location: order.orderPickupLocation, isPickup: true)
                            // Foreach to view multiple dropOFF locations if needed
                            ForEach(order.orderDropOffLocations) { location in
                                if location.id == order.orderDropOffLocations.first?.id {
                                    locationView(location: location, isPickup: false, remainingLocations: order.orderDropOffLocations.count - 1)
                                }
                            }
                        }
                    }
                    .padding(10)
                    .background(order.orderStatus == .Offered ? offeredOrderBgColor : acceptedOrderBgColor)
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(offeredOrderBgColor, lineWidth: 1)
                    )
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                }
            }
        }
        .background(.white)
    }
    @ViewBuilder
    func locationView(location: DropOffLocation, isPickup: Bool = false, remainingLocations: Int = 0) -> some View {
        HStack {
            // MARK: Drawing line and Circle to show PickUp and Delivery Markers
            VStack {
                Circle()
                    .fill(.black)
                    .frame(width: 10, height: 10)
                    .padding(.bottom, !isPickup && remainingLocations == 0 ? 70 : 0)
                if remainingLocations > 0 || isPickup {
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 1, dash: [5]))
                        .frame(width: 1)
                }
                if remainingLocations > 0 && !isPickup {
                    Circle()
                        .fill(loginButtonBgColor)
                        .frame(width: 10, height: 10)
                        .overlay {
                            Text("+\(remainingLocations)")
                                .textDecoration(size: 5)
                        }
                }
            }
            // MARK: Reusing a single Stack to populate both pickup and delivery address
            VStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("\(location.date.description) - \(isPickup ? "Pickup": "Delivery")")
                        .textDecoration(family: "Poppins", size: 14, fontWeight: .bold)
                    Text(location.Name)
                        .textDecoration(size: 12, fontWeight: .regular, color: .black)
                    HStack(alignment: .bottom){
                        Text(location.address)
                            .textDecoration(size: 12, fontWeight: .regular, color: .black)
                        if isPickup {
                            Image("map")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 18, height: 18)
                        }
                    }
                }
            }
        }
    }
}




