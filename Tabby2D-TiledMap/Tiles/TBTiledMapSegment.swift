//
//  TBTiledMapSegment.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/20/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

public struct TBTiledMapSegment {
    public var id: Int
    public var name: String
    public var width: Int
    public var height: Int
    
    public var layers: [TBTiledLayer]
}

extension TBTiledMapSegment {
    public static func parse(json: JSON) -> TBTiledMapSegment {
        let id = json["id"].intValue
        let name = json["name"].stringValue
        let width = json["width"].intValue
        let height = json["height"].intValue

        var layers = [TBTiledLayer]()
        for layerJSON in json["layers"].arrayValue {
            layers.append(TBTiledLayer.parse(layerJSON))
        }

        return TBTiledMapSegment(id: id, name: name, width: width, height: height, layers: layers)
    }
}

extension TBTiledMapSegment: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "SEGMENT \(name) - size: \(width)*\(height); layers: \(layers)"
    }
}
