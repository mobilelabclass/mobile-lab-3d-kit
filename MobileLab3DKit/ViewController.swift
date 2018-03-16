//
//  ViewController.swift
//  MobileLab3DKit
//
//  Created by Nien Lam on 3/8/18.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit


class ViewController: UIViewController {

    var zombieAnimation: SCNAnimationPlayer!

    var dribbleAnimation: SCNAnimationPlayer!

    var animations = [String: CAAnimation]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create a new scene
        let scene = SCNScene(named: "art.scnassets/main_scene.scn")!
        
//        // create and add a camera to the scene
//        let cameraNode = SCNNode()
//        cameraNode.camera = SCNCamera()
//        scene.rootNode.addChildNode(cameraNode)
//        
//        // place the camera
//        cameraNode.position = SCNVector3(x: 0, y: 0, z: 15)
        
        /*
        // create and add a light to the scene
        let lightNode = SCNNode()
        lightNode.light = SCNLight()
        lightNode.light!.type = .omni
        lightNode.position = SCNVector3(x: 0, y: 10, z: 10)
        scene.rootNode.addChildNode(lightNode)
        
        // create and add an ambient light to the scene
        let ambientLightNode = SCNNode()
        ambientLightNode.light = SCNLight()
        ambientLightNode.light!.type = .ambient
        ambientLightNode.light!.color = UIColor.darkGray
        scene.rootNode.addChildNode(ambientLightNode)
        */
 
        // retrieve the SCNView
        let scnView = self.view as! SCNView
        
        // set the scene to the view
        scnView.scene = scene
        
        // allows the user to manipulate the camera
        scnView.allowsCameraControl = true
        
        // show statistics such as fps and timing information
        // scnView.showsStatistics = true
        
        // configure the view
        scnView.backgroundColor = UIColor.black
        
        scnView.debugOptions = .showPhysicsShapes
        
        scnView.autoenablesDefaultLighting = true
        
        
        // add a tap gesture recognizer
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap(_:)))
//        scnView.addGestureRecognizer(tapGesture)

//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        zombieAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Zombie.dae")
//        characterNode!.addAnimationPlayer(zombieAnimation, forKey: "animation")
//        zombieAnimation.play()

//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        zombieAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Zombie.dae")
//        characterNode!.addAnimationPlayer(zombieAnimation, forKey: "animation")
//        zombieAnimation.blendFactor = 0.0
//        zombieAnimation.stop(withBlendOutDuration: 0.2)
//        zombieAnimation.play()

//        loadAnimation(withKey: "zombie", sceneName: "art.scnassets/Zombie", animationIdentifier: "Zombie-1")
//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        characterNode!.addAnimation(animations["zombie"]!, forKey: "zombie")
//

        let menuOverlay = MenuOverlay(size: self.view.bounds.size)
        scnView.overlaySKScene = menuOverlay
        
        menuOverlay.handleLightingModelBtn = { (lightingModel) in
//            let ship = scene.rootNode.childNode(withName: "shipMesh", recursively: true)!
//            ship.geometry!.firstMaterial!.lightingModel = lightingModel
        }

        menuOverlay.handleCameramControlBtn = { (isOn) in
            scnView.allowsCameraControl = isOn
        }

    }
    
    
    @objc
    func handleTap(_ gestureRecognize: UIGestureRecognizer) {
        // retrieve the SCNView
        let scnView = self.view as! SCNView


//        loadAnimation(withKey: "dribble", sceneName: "art.scnassets/Dribble", animationIdentifier: "Dribble-1")
//        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
//        characterNode!.addAnimation(animations["dribble"]!, forKey: "dribble")
        
        
//        zombieAnimation.blendFactor = 0.5
//        zombieAnimation.stop(withBlendOutDuration: 1.0)
        
        let characterNode = scnView.scene?.rootNode.childNode(withName: "IdleFixed", recursively: true)!
        self.dribbleAnimation = SCNAnimationPlayer.loadAnimation(fromSceneNamed: "art.scnassets/Dribble.dae")
        
        self.dribbleAnimation.animation.blendInDuration = 0.25
        self.dribbleAnimation.animation.blendOutDuration = 0.5

        characterNode!.addAnimationPlayer(self.dribbleAnimation, forKey: "dribble")
        self.dribbleAnimation.animation.repeatCount = 2
        self.dribbleAnimation.play()
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
}




// For loading animations with in collada model.
extension SCNAnimationPlayer {
    class func loadAnimation(fromSceneNamed sceneName: String) -> SCNAnimationPlayer {
        let scene = SCNScene( named: sceneName )!
        // find top level animation
        var animationPlayer: SCNAnimationPlayer! = nil
        scene.rootNode.enumerateChildNodes { (child, stop) in
            if !child.animationKeys.isEmpty {
                animationPlayer = child.animationPlayer(forKey: child.animationKeys[0])
                stop.pointee = true
            }
        }
        return animationPlayer
    }
}

