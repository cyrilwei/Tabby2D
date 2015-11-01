//
//  TabbyGameInput.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import UIKit
import SpriteKit

public protocol TabbyGameInputDelegate {

}

public class TabbyGameInput: UIResponder {
    public unowned let scene: TabbyScene
    public var delegate: TabbyGameInputDelegate?

    public init(scene: TabbyScene) {
        self.scene = scene
    }
}