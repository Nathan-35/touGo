//
//  Colors.swift
//  GuideFinder(Test)
//
//  Created by Nathan on 18/09/2019.
//  Copyright © 2019 Nathan. All rights reserved.
//

import Foundation
import UIKit

class Colors {
    var gl : CAGradientLayer!
    
    init(){
        let colorTop = #colorLiteral(red: 0.9098039216, green: 0.2588235294, blue: 0.537254902, alpha: 1).cgColor
        let colorBottom = #colorLiteral(red: 0.2889654636, green: 0.2922469676, blue: 0.5999732018, alpha: 1).cgColor
        
        
        self.gl = CAGradientLayer()
        
        self.gl.colors = [colorTop,colorBottom]
        self.gl.locations = [0.0,1.0]
    }

}
