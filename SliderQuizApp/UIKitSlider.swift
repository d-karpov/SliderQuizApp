//
//  UIKitSlider.swift
//  SliderQuizApp
//
//  Created by Денис Карпов on 31.01.2022.
//

import SwiftUI

struct UIKitSlider: UIViewRepresentable {
    @Binding var currentValue: Double
    
    let alpha: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = UIColor(red: 1,green: 0,blue: 0,alpha: CGFloat(alpha)/100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension UIKitSlider {
    final class Coordinator: NSObject{
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueChanged(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}


struct UIKitSlider_Previews: PreviewProvider {
    static var previews: some View {
        UIKitSlider(currentValue: .constant(70), alpha: 70)
    }
}
