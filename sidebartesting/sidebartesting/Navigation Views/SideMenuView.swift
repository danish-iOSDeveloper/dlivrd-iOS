//
//  SideMenuView.swift
//  sidebartesting
//
//  Created by IBTIDAH-IOS on 19/02/2025.
//

import SwiftUI

struct SideMenuView: View {
    
    @Binding var selectedSideMenuTab: Int
    @Binding var presentSideMenu: Bool
    
    var body: some View {
        HStack {
            ZStack{
                Rectangle()
                    .fill(.white)
                    .frame(width: 370)
                VStack(alignment: .leading, spacing: 0) {
                    ProfileImageView()
                        .background(.white)
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: "row.iconName", title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    Spacer()
                    Button(role: .destructive) {
                        //
                    } label: {
                        HStack {
                            Image("logout")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(height:21.5)
                            Text("Logout")
                                .textDecoration(family: "Poppins", size: 16, fontWeight: .regular, color: .red)
                        }
                        .padding()
                    }
                }
                .padding(.top, 50)
                .frame(width: 370)
                .background(
                    Color.white
                )
            }
            Spacer()
        }
        .background(.clear)
    }
    
    func ProfileImageView() -> some View{
        VStack(alignment: .center){
            HStack {
                Image("profile-Image")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .stroke(.white, lineWidth: 1)
                    )
                    .cornerRadius(50)
                Text("Danish Masood")
                    .textDecoration(family: "Poppins", size: 24)
                Spacer()
                Button{
                } label: {
                    Image("settings")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 20, height: 20)
                }
            }
            .padding()
        }
        .background(.white)
    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? loginButtonBgColor : offeredOrderBgColor)
                    HStack {
                        Text(title)
                            .textDecoration(size: 14, fontWeight: .regular, color: .black)
                        Spacer()
                        Image(systemName: "chevron.forward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 15)
                            .foregroundStyle(.black)
                    }
                    .padding(10)
                }
            }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
        }
        .frame(height: 44)
    }
}
