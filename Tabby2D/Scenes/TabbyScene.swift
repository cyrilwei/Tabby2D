//
//  TabbyScene.swift
//  Tabby2D
//
//  Created by Cyril Wei on 11/1/15.
//  Copyright © 2015 Cyril Wei. All rights reserved.
//

import SpriteKit

enum WorldLayer: CGFloat {
    case StaticBackground = -100, DynamicBackground = -50, Characters = 0, Foreground = 1000, HUD = 1100, Top = 1200

    var nodeName: String {
        switch self {
        case .StaticBackground: return "staticbg"
        case .DynamicBackground: return "dynamicbg"
        case .Characters: return "characters"
        case .Foreground: return "foreground"
        case .HUD: return "HUD"
        case .Top: return "top"
        }
    }

    var nodePath: String {
        return "/world/\(nodeName)"
    }

    static var allLayers = [StaticBackground, DynamicBackground, Characters, HUD, Top]
}

public class TabbyScene: SKScene, TabbyGameInputDelegate {
}