//
//  ViewController.swift
//  ColorPicker-w-James
//
//  Created by Ilgar Ilyasov on 1/29/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func changeBackgroundColor(_ sender: ColorWheel) {
        view.backgroundColor = sender.color
    }
}

