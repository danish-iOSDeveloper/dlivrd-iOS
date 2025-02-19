//
//  HomeView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 18/02/2025.
//

import SwiftUI
import MapKit

struct HomeView: View {
    //Properties && States
    @State private var selectedButton: Int = 0 // 0 = Offered , 1 = Accepted
    @State private var presentSideMenu: Bool = false
    @State var selectedSideMenuTab = 0 // 0 = Home, 1 = Open orders and so on.....
    
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
    @State private var sheetHeight: CGFloat = .zero
    @State private var dents: Set<PresentationDetent> = [.height(300), .height(700)]
    
    var body: some View {
        ZStack {
            TabView(selection: $selectedSideMenuTab) {
                Map(coordinateRegion: $region)
                    .tag(0)
            }
//            SideMenuContentView(isShowing: $presentSideMenu, content: AnyView(SideMenuView(selectedSideMenuTab: $selectedSideMenuTab, presentSideMenu: $presentSideMenu)))
        }
        .sheet(isPresented: .constant(true)) {
            VStack {
                Spacer()
                    .frame(height: 10)
                BottomSheet
                    .overlay {
                        // MARK: Overlay and geometry are used to control the sizing of the sheet
                        GeometryReader { geometry in
                            Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                        }
                    }
                    .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                        sheetHeight = newHeight
                    }
                    .presentationDetents(dents)
                    .presentationSizing(.fitted)
                    .presentationDragIndicator(.visible)
            }
            .interactiveDismissDisabled()
            .presentationContentInteraction(.scrolls)
            .presentationBackgroundInteraction(.enabled)
        }
        .toolbar {
            //MARK: Used toolbar instead of using VStack
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    presentSideMenu = true
                    print("SideMenu button tapped")
                }) {
                    Image("sideMenu")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 24)
                }
            }
            
            ToolbarItem(placement: .principal) {
                Image("dilvrd")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 30)
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
            }
        }
        .toolbarVisibility(.automatic, for: .navigationBar)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
    }
    @ViewBuilder var BottomSheet: some View {
        VStack(spacing: 5) {
            TwoButtonToggleView(selectedButton: $selectedButton)
            OrderCardView(orders: orders, selectedButton: $selectedButton)
        }
        .background(.white)
    }
}
