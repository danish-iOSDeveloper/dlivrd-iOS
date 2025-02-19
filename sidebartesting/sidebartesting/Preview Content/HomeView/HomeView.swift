//
//  HomeView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    //Properties & States
    @State private var selectedButton: Int = 0 // 0 = Offered , 1 = Accepted
    @State private var presentSideMenu: Bool = false
    @State var selectedSideMenuTab = 0 // 0 = Home, 1 = Open orders and so on.....
    @State private var sheetHeight: CGFloat = 300 // Default sheet height
    @State private var maxSheetHeight: CGFloat = 700 // Fully expanded
    @State private var minSheetHeight: CGFloat = 300 // Collapsed height
    @State private var sheetOffset: CGFloat = 0 // Tracks dragging
    
    @State var region = MKCoordinateRegion(
        center:  CLLocationCoordinate2D(
            latitude: 37.789467,
            longitude:-122.416772
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.5,
            longitudeDelta: 0.5
        )
    )
    
    var body: some View {
        ZStack {
            // Main Content (Map)
            TabView(selection: $selectedSideMenuTab) {
                Map(coordinateRegion: $region)
                    .tag(0)
            }

            // Bottom Sheet
            VStack {
                Spacer()
                BottomSheet
                    .frame(height: sheetHeight)
                    .offset(y: sheetOffset)
                    .gesture(
                        DragGesture()
                            .onChanged { gesture in
                                let newHeight = sheetHeight - gesture.translation.height
                                if newHeight >= minSheetHeight && newHeight <= maxSheetHeight {
                                    sheetHeight = newHeight
                                }
                            }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    // Snap to closest state
                                    if sheetHeight > (minSheetHeight + maxSheetHeight) / 2 {
                                        sheetHeight = maxSheetHeight // Expand
                                    } else {
                                        sheetHeight = minSheetHeight // Collapse
                                    }
                                }
                            }
                    )
            }
            .ignoresSafeArea()
            // Side Menu (Appears Over Everything)
            if presentSideMenu {
                SideMenuContentView(
                    isShowing: $presentSideMenu,
                    content: AnyView(SideMenuView(
                        selectedSideMenuTab: $selectedSideMenuTab,
                        presentSideMenu: $presentSideMenu
                    ))
                )
                .transition(.move(edge: .leading))
            }
        }
        .toolbar {
            //MARK: Used toolbar instead of using VStack
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        withAnimation {
                            presentSideMenu.toggle()
                        }
                        print("SideMenu button tapped")
                    }) {
                        Image("sideMenu")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24)
                    }
                    .opacity(presentSideMenu ? 0: 1)
                }
                
                ToolbarItem(placement: .principal) {
                    Image("dilvrd")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 30)
                        .opacity(presentSideMenu ? 0: 1)

                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    HStack {
                        Button(action: {
                            print("Search tapped")
                        }) {
                            Image("Magnifer")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 21.5)
                        }
                        Button(action: {
                            print("Notification tapped")
                        }) {
                            Image("Bell")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height: 21.5)
                        }
                        
                    }
                    .opacity(presentSideMenu ? 0: 1)

                }
        }
        .toolbarVisibility(.automatic, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    
    @ViewBuilder var BottomSheet: some View {
        VStack(spacing: 5) {
            Spacer(minLength: 5)
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .frame(width: 40, height: 5)
            TwoButtonToggleView(selectedButton: $selectedButton)
            OrderCardView(orders: orders, selectedButton: $selectedButton)
        }
        .background(.white)
        .cornerRadius(20, corners: [.topLeft, .topRight])
    }
    
}
