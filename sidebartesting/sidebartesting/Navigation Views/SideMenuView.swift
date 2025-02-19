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
//                    ProfileImageView()
//                        .frame(height: 140)
//                        .padding(.bottom, 30)
//                    
                    ForEach(SideMenuRowType.allCases, id: \.self){ row in
                        RowView(isSelected: selectedSideMenuTab == row.rawValue, imageName: "row.iconName", title: row.title) {
                            selectedSideMenuTab = row.rawValue
                            presentSideMenu.toggle()
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 100)
                .frame(width: 370)
                .background(
                    Color.white
                )
            }
            
            
            Spacer()
        }
        .background(.clear)
    }
    
//    func ProfileImageView() -> some View{
//        VStack(alignment: .center){
//            HStack{
//                Spacer()
//                Image("profile-image")
//                    .resizable()
//                    .aspectRatio(contentMode: .fill)
//                    .frame(width: 100, height: 100)
//                    .overlay(
//                        RoundedRectangle(cornerRadius: 50)
//                            .stroke(.purple.opacity(0.5), lineWidth: 10)
//                    )
//                    .cornerRadius(50)
//                Spacer()
//            }
//            
//            Text("Muhammad Abbas")
//                .font(.system(size: 18, weight: .bold))
//                .foregroundColor(.black)
//            
//            Text("IOS Developer")
//                .font(.system(size: 14, weight: .semibold))
//                .foregroundColor(.black.opacity(0.5))
//        }
//    }
    
    func RowView(isSelected: Bool, imageName: String, title: String, hideDivider: Bool = false, action: @escaping (()->())) -> some View{
        Button{
            action()
        } label: {
            VStack(alignment: .leading){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isSelected ? loginButtonBgColor : .white)
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
