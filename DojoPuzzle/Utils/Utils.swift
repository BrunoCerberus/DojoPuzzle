//
//  Utils.swift
//  DojoPuzzle
//
//  Created by Bruno Lopes de Mello on 05/02/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

import Foundation
import UIKit

class Utils {
    
    class func toolBar(forTextField text: String?, target: Any?, andSelector action: Selector) -> UIToolbar? {
        
        let numberToolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 320, height: 50))
        
        numberToolbar.items = [UIBarButtonItem(title: "", style: .plain, target: target, action: nil), UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil), UIBarButtonItem(title: text, style: .done, target: target, action: action)]
        
        return numberToolbar
        
    }

    
    
}
