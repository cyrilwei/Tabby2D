//
//  TBTiledLayer.swift
//  Tabby2D
//
//  Created by Cyril Wei on 1/15/16.
//  Copyright © 2016 Cyril Wei. All rights reserved.
//

import SpriteKit
import SwiftyJSON

public struct TBTiledLayer {
    public var name: String
    
    public var width: Int
    public var height: Int

    public var baseWorldLayer: WorldLayer
    public var zPosition: CGFloat

    public var data: [Int]
}

extension TBTiledLayer {
    public static func parse(json: JSON) -> TBTiledLayer {
        let name = json["name"].stringValue
        let width = json["width"].intValue
        let height = json["height"].intValue
        let baseWorldLayer = WorldLayer.layerFromString(json["nodeName"].stringValue)
        let zPosition = CGFloat(json["zPosition"].doubleValue)
        let data = json["data"].arrayObject as? [Int] ?? [Int]()

        return TBTiledLayer(name: name, width: width, height: height, baseWorldLayer: baseWorldLayer, zPosition: zPosition, data: data)
    }
}

extension TBTiledLayer: CustomDebugStringConvertible {
    public var debugDescription: String {
        return "LAYER \(name) - size: \(width)*\(height); data: \(data)"
    }
}

extension WorldLayer {
    public static func layerFromString(layerName: String) -> WorldLayer {
        switch layerName {
        case "dynamicbg": return .DynamicBackground
        case "characters": return .Characters
        case "foreground": return .Foreground
        case "camera": return .Camera
        case "HUD": return .HUD
        default:return .StaticBackground
        }
    }
}