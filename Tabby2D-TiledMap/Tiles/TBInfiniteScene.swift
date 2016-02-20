//
//  TBInfiniteScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 2/20/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit

public class TBInfiniteScene: TBScene {
    private var map: TBTiledMap?

    public var atlasName: String {
        return map?.atlases.first?.name ?? ""
    }

    public func loadMap(map: TBTiledMap) {
        self.map = map
    }

    public override func didMoveToView(view: SKView) {
        super.didMoveToView(view)

    }
}