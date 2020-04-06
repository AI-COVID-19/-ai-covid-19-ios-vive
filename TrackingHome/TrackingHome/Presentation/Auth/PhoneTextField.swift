//
//  PhoneTextField.swift
//  TrackingHome
//
//  Created by Mario Acero on 2020-04-05.
//  Copyright © 2020 Mario Acero. All rights reserved.
//

import Foundation
import PhoneNumberKit

class PhoneTextField: PhoneNumberTextField {
    
    var numberKit = PhoneNumberKit()
    
    override var defaultRegion: String {
        get {
            return "CO"
        }
        set {} // exists for backward compatibility
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }
    
    
    func initView() {
        withFlag = true
        withDefaultPickerUI = true
        withPrefix = true
        withExamplePlaceholder = true
        isPartialFormatterEnabled = true
    }
    
}
