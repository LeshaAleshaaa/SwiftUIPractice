//
//  MiniStore.swift
//  SwiftUIPractice
//
//  Created by Алексей Смицкий on 22.04.2022.
//

import SwiftUI

struct MiniStoreScreen: View {
    @State var segmentIndex = 0
    @State var offsetX: CGFloat = 0
    @State var hiddenImage: Bool = false
    
    let companiesArray = ["Nike", "Puma", "Reebok"]
    let sneakersNames = ["nikeShoes", "pumaShoes", "reebokShoes"]
    
    var body: some View {
        VStack {
            Text("Кроссовки фирмы - \(companiesArray[segmentIndex])")
                .font(.system(.title))
            Spacer()
            sneakersView
            pickerView
            Spacer()
                .frame(height: 150)
        }
    }
    
    private var pickerView: some View {
        Picker(selection: Binding(
            get: {
                segmentIndex
            }, set: { newValue in
                segmentIndex = newValue
                offsetX = -500
                moveBack()
            })) {
                ForEach(0..<companiesArray.count) {
                    Text(self.companiesArray[$0]).tag($0)
                }
            } label: {
                Text("")
            }
            .pickerStyle(.segmented)
            .padding(15)
    }
    
    private var sneakersView: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(.gray)
                .padding()
            Image(sneakersNames[segmentIndex])
                .resizable()
                .frame(width: 300, height: 300)
        }
        .offset(x: offsetX)
        .animation(.spring(), value: offsetX)
        .gesture(dragGesture)
        .opacity(hiddenImage ? 0 : 1.0)
    }
    
    var dragGesture: some Gesture {
        DragGesture()
                    .onChanged({ gesture in
            offsetX = gesture.translation.width
        })
                    .onEnded({ gesture in
            if offsetX <= 180 {
                guard segmentIndex != companiesArray.count - 1 else {
                    moveBack()
                    return
                }
                offsetX -= 500
                segmentIndex += 1
                hiddenImage = true
                offsetX += 2000
                moveBack()
            } else if offsetX >= 180 {
                guard segmentIndex != 0 else {
                    moveBack()
                    return
                }
                offsetX += 500
                hiddenImage = true
                offsetX -= 2000
                segmentIndex -= 1
                moveBack()
            }
        })
    }
    
    private func moveBack() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            offsetX = 0
            hiddenImage = false
        }
    }
}

struct MiniStoreScreen_Previews: PreviewProvider {
    static var previews: some View {
        MiniStoreScreen()
    }
}
