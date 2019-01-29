//
//  Color.swift
//  ColorPicker-w-James
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

struct Color {
    // Use the offset angle to determine a selected hue and saturation
    static func getHueSaturation(at offset: CGSize) -> (hue: CGFloat, saturation: CGFloat) {
        let saturation = sqrt(offset.width * offset.width + offset.height * offset.height)
        var hue = acos(offset.width / saturation) / (2.0 * CGFloat.pi)
        if offset.height < 0 { hue = 1.0 - hue }
        return (hue: hue, saturation: saturation)
    }
}
