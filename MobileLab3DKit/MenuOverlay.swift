//
//  MenuOverlay.swift
//  3DSandbox
//
//  Created by Nien Lam on 3/7/18.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit


struct CycleArray<T> {
    private var array: [T]
    private var cycleIndex: Int

    var currentElement: T? {
        get { return array.count > 0 ? array[cycleIndex] : nil }
    }
    
    init(_ array: [T]) {
        self.array = array
        self.cycleIndex = 0
    }
    
    mutating func cycle() -> T?  {
        cycleIndex = cycleIndex + 1 == array.count ? 0 : cycleIndex + 1
        return currentElement
    }
}


struct LightingSchemes {
    private var cycleIndex = 0
    
    typealias element = (name: String, scheme: Int)
    
    let schemes: [element] = [
        ("No Lights",    0),
        ("Spot Light",   1)]
    
    mutating func cycle() -> element  {
        cycleIndex = cycleIndex + 1 == schemes.count ? 0 : cycleIndex + 1
        return schemes[cycleIndex]
    }
}

struct LightingModels {
    private var cycleIndex = 0

    typealias element = (name: String, light: SCNMaterial.LightingModel)

    let models: [element] = [
        ("Constant",          .constant),
        ("Lambert",           .lambert),
        ("Blinn",             .blinn),
        ("Phong",             .phong),
        ("Physically Based",  .physicallyBased)]

    mutating func cycle() -> element  {
        cycleIndex = cycleIndex + 1 == models.count ? 0 : cycleIndex + 1
        return models[cycleIndex]
    }
}


class MenuOverlay: SKScene {

    var menuAnchor: SKNode!
    var lightingSetupLabel: SKLabelNode!
    var lightingModelLabel: SKLabelNode!
    var specularIntensityLabel: SKLabelNode!

    var lightingModelIndex = 0
    
    var lightingModels = LightingModels()
    
    override func didMove(to view: SKView) {
        // Get references to spritekit nodes.
        menuAnchor = childNode(withName: "//menu_anchor")
        lightingSetupLabel = childNode(withName: "//lighting_setup") as! SKLabelNode
        lightingModelLabel = childNode(withName: "//lighting_model") as! SKLabelNode
        specularIntensityLabel = childNode(withName: "//specular_intensity") as! SKLabelNode

        
        // Position menu to upper left.
        positionMenu()
    

        let schemes: [(name: String, scheme: Int)] = [
            ("No Lights",    0),
            ("Spot Light",   1)]
        
        let array = [1,2,3]
        
        var newC = CycleArray(array)
        
        print(newC.currentElement!)
        
        var newCollection = CycleArray(schemes)
        print(newCollection.currentElement!.name)
        print(newCollection.cycle()!.name)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }

        // Touch location is based off parent.
        let location = touch.location(in: menuAnchor)
        
        if lightingSetupLabel.contains(location) {
            print("setup")
        } else if lightingModelLabel.contains(location) {

            let lm = lightingModels.cycle()
            lightingModelLabel.text = lm.name
            
        } else if specularIntensityLabel.contains(location) {
            print("specular intensity")
        }
    }


    // Helper method to position menu in upper left.
    func positionMenu() {
        let xOffset = -self.view!.bounds.width / 2.0
        let yOffset = self.view!.bounds.height / 2.0
        menuAnchor.position = CGPoint(x: xOffset, y: yOffset)
    }
    
}
