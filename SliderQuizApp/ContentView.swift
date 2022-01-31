//
//  ContentView.swift
//  SliderQuizApp
//
//  Created by Денис Карпов on 31.01.2022.
//

import SwiftUI

struct ContentView: View {
    @State var targetValue: Int = Int.random(in: 1...100)
    @State var currentValue: Double = 50
    @State var isPresented: Bool = false
    
    private var result: Int {
        computeScore()
    }
    
    var body: some View {
        VStack(spacing: 50) {
            Text("Подвинь слайдер, как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                UIKitSlider(currentValue: $currentValue, alpha: result)
                Text("100")
            }
            
            Button("Проверь меня!", action: { isPresented.toggle() })
                .alert("Your score", isPresented: $isPresented, actions: {}) {
                    Text("\(result)")
                }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
                currentValue = 50
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
