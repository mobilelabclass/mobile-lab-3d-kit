//
//  MenuButton.swift
//  MobileLab3DKit
//
//  Created by Nien Lam on 3/15/18.
//  Copyright © 2018 Mobile Lab. All rights reserved.
//

import UIKit
import SpriteKit

class MenuButton: SKSpriteNode {

    // Title label for button.
    var title: SKLabelNode!

    // Callback for button tap.
    var handleTap: (() -> Void)!


    override init(texture: SKTexture?, color: UIColor, size: CGSize) {
        super.init(texture: texture, color: color, size: size)

        // Enable interaction.
        isUserInteractionEnabled = true

        // Create label with default settings and add to button.
        title = SKLabelNode(text: "Button")
        title.fontName = "Menlo"
        title.fontSize = 12.0
        self.addChild(title)

        // Set default block for button callback.
        handleTap = {
            print("Button Tapped")
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 0.85
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.alpha = 1.0
        self.handleTap()
    }
}
