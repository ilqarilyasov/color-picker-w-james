//
//  ColorWheel.swift
//  ColorPicker-w-James
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ColorWheel: UIControl {

    // MARK: - Touch Tracking
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
//        let touchPoint = touch.location(in: self)
        
        sendActions(for: [.touchDown, .valueChanged])
        
        
        print("Begin")
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchDragInside])
        } else {
            sendActions(for: [.touchDragOutside])
        }
        
        print("Continue")
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        defer { super.endTracking(touch, with: event) }
        
        guard let touch = touch else { return }
        let touchPoint = touch.location(in: self)
        
        if bounds.contains(touchPoint) {
            sendActions(for: [.valueChanged, .touchUpInside])
        } else {
            sendActions(for: [.touchUpOutside])
        }
        
        
        print("End")
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: [.touchCancel])
        
        print("Cancel")
    }

}
