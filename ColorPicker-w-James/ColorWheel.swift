//
//  ColorWheel.swift
//  ColorPicker-w-James
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {
    
    // MARK: - Super class methods
    
    override func layoutSubviews() {
        super.layoutSubviews()
        clipsToBounds = true
        let radius = bounds.width / 2.0
        layer.cornerRadius = radius
        layer.borderWidth = 1.0 // Default color is black
    }
    
    override func draw(_ rect: CGRect) {
        for y in 0...Int(bounds.maxY) {
            for x in 0...Int(bounds.maxX) {
                let pixel = CGRect(x: x, y: y, width: 1, height: 1)
                let point = CGPoint(x: x, y: y)
                let color = self.color(for: point)
                color.set()
                UIRectFill(pixel)
            }
        }
    }
    
    
    // MARK: - Properties
    
    var color: UIColor = .white
    
    
    // MARK: - Private methods
    
    private func color(for location: CGPoint) -> UIColor {
        let center = CGPoint(x: bounds.midX, y: bounds.midY)
        let yOffset = location.y - center.y
        let xOffset = location.x - center.x
        let offset = CGSize(width: xOffset / center.x, height: yOffset / center.y)
        let (hue, saturation) = Color.getHueSaturation(at: offset)
        
        return UIColor(hue: hue, saturation: saturation, brightness: 0.8, alpha: 1.0)
    }
    

    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        color = self.color(for: touchPoint)
        sendActions(for: [.touchDown, .valueChanged])

        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            color = color(for: touchPoint)
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            color = color(for: touchPoint)
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
    }
}
