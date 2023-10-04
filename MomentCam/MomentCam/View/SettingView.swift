//
//  SettingView.swift
//  MomentCam
//
//  Created by kimsangwoo on 2023/09/23.
//

import SwiftUI

struct SettingView: View {
    @Binding var isShowingSetting: Bool
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack(spacing: 0) {
                HStack {
                    Button(action: {
                        isShowingSetting.toggle()
                    }, label: {
                        ZStack {
                            Rectangle()
                                .frame(width: 44, height: 44)
                                .foregroundStyle(.clear)
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 16, height: 16)
                                .foregroundStyle(.white)
                        }
                    })
                    
                    Spacer()
                    
                    Text("Setting")
                        .font(.system(size: 17, weight: .bold))
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    Rectangle()
                        .frame(width: 44, height: 44)
                        .foregroundStyle(.clear)
                }
                .padding(.horizontal, 20)
                
                Spacer()
            }
        }
    }
}


#Preview {
    SettingView(isShowingSetting: .constant(true))
}
