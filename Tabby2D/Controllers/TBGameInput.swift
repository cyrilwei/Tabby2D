//
//  TBGameInput.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import UIKit
import SpriteKit

public protocol TBGameInputDelegate {

}

public class TBGameInput: UIResponder {
    public unowned let scene: TBScene
    public var delegate: TBGameInputDelegate?

    public init(scene: TBScene) {
        self.scene = scene
    }
}