//
//  MenuOverlay.swift
//  MobileLab3DKit
//
//  Created by Nien Lam on 3/7/18.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit
import SpriteKit
import SceneKit


// Structure for cycling through a generic array of elements.
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


let LightingModels: [(text: String, light: SCNMaterial.LightingModel)] = [
    ("Constant",          .constant),
    ("Lambert",           .lambert),
    ("Blinn",             .blinn),
    ("Phong",             .phong),
    ("Physically Based",  .physicallyBased)]


let LightingSchemes: [(text: String, id: Int)] = [
    ("No Lights",    0),
    ("Spot Light",   1)]


let Animations: [(text: String, file: String)] = [
    ("Idle",  ""),
    ("Samba Dancing",  "SambaDancing.dae"),
    ("Bellydancing",  "Bellydancing.dae"),
    ("Jumping",  "Jumping.dae")]


let CameraControlToggle: [(text: String, isOn: Bool)] = [
    ("Cam Ctrl On", true),
    ("Cam Ctrl Off", false)]



class MenuOverlay: SKScene {

    var handleLightingModelBtn: ((SCNMaterial.LightingModel) -> Void)?
    var handleLightingSchemeBtn: ((Int) -> Void)?
    var handleCameramControlBtn: ((Bool) -> Void)?

    
    private var lightingModels = CycleArray(LightingModels);
    private var lightingSchemes = CycleArray(LightingSchemes);
    private var cameraControlToggle = CycleArray(CameraControlToggle);

    
    
    override func didMove(to view: SKView) {

        let modelBtn = MenuButton(texture: nil, color: UIColor.red, size: CGSize(width: 200, height: 40))
        setupButton(modelBtn,
                    text: lightingModels.currentElement!.text,
                    position: CGPoint(x: 120, y: 100),
                    handleTap: {
                        let model = self.lightingModels.cycle()!
                        modelBtn.title.text = model.text
                        self.handleLightingModelBtn?(model.light)
                    })

        
        let schemesBtn = MenuButton(texture: nil, color: UIColor.red, size: CGSize(width: 200, height: 40))
        setupButton(schemesBtn,
                    text: lightingSchemes.currentElement!.text,
                    position: CGPoint(x: 120, y: 300),
                    handleTap: {
                        let scheme = self.lightingSchemes.cycle()!
                        schemesBtn.title.text = scheme.text
                        self.handleLightingSchemeBtn?(scheme.id)
                    })

        let cameraControlBtn = MenuButton(texture: nil, color: UIColor.red, size: CGSize(width: 200, height: 40))
        setupButton(cameraControlBtn,
                    text: cameraControlToggle.currentElement!.text,
                    position: CGPoint(x: 120, y: 150),
                    handleTap: {
                        let toggle = self.cameraControlToggle.cycle()!
                        cameraControlBtn.title.text = toggle.text
                        self.handleCameramControlBtn?(toggle.isOn)
                })

        
    }

    
    func setupButton(_ button: MenuButton, text: String, position: CGPoint, handleTap: @escaping () -> Void) {
        button.position = position
        button.title.text = text
        button.handleTap = handleTap
        self.addChild(button)
    }

    
    
    
}
