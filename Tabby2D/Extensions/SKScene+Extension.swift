//
//  SKScene+Extension.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/10/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit

public extension SKScene {
    public var viewportWidth: CGFloat {
        return self.size.width
    }
    
    public var viewportHeight: CGFloat {
        return self.size.height
    }
}
