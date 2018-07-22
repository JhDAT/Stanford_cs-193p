//
//  ViewController.swift
//  Concentration
//
//  Created by Jo JANGHUI on 2018. 7. 22..
//  Copyright © 2018년 JhDAT. All rights reserved.
//

import UIKit        // UIKit 프레임웍

// class: Super Class
// property == instanche variable
// Class 'ViewController' has no initializers - 모든 인스턴스 변수는 초기화 되어 있어야 합니다.
// 이니셜라이져는 단지 특별한 이름을 가진 메소드입니다. 어떤 인수든 가질수 있으며, 여러개의 init를 만드는 것도 가능합니다. 하지만 각 init는 모든 변수를 초기화해야 합니다.
class ViewController: UIViewController
{
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    var flipCount = 0 {
        // property adsorber
        // 속성이 설정될때마다 이 안의 코드가 실행됩니다.
        // UI와 Instance veriable의 싱크를 맞추기 위해서 사용되는 경우가 많습니다.
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    var emojiChoices = ["🐶", "🦊", "🐶", "🦊"]
    
    @IBOutlet var cardButtons: [UIButton]!
    
    //@IBAction 은 method , @IBOutlet은 Instance 변수를 만들수 있습니다.
    // touchCard method는 내부에서 사용가능한 Argument는 sendr가 있으며 그 타입은 UIButton입니다.
    // 첫번째 카드와 연결된 method
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
         // sender가 cardButton에서 몇번째 인덱스를 가지는지를 반환합니다.
        if let cardNumber = cardButtons.index(of: sender) {
            flipCard(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("카드를 불러오는데 실패했습니다")
        }
    }
    
    // 카드를 뒤집어 주는 Method
    func flipCard (withEmoji emoji: String, on button: UIButton) {
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 0.8323456645, blue: 0.4732058644, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        }
    }
    
}

