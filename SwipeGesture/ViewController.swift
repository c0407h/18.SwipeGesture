//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 이충현 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var imgViewUp: UIImageView!
    @IBOutlet var imgViewDown: UIImageView!
    @IBOutlet var imgViewRight: UIImageView!
    @IBOutlet var imgViewLeft: UIImageView!
    
    //이미지 배열 선언
    var imgLeft = [UIImage]()
    var imgRight = [UIImage]()
    var imgUp = [UIImage]()
    var imgDown = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 위에서 만든 이미지 배열에 이미지 추가
        // 배열을 UIImage형으로 만들었기 때문에 append의 인수로 UIImage형의 값을 입력
        // 스와이프하면 검은색 화살표가 빨간색이 되도록 하기 위해 처음에는 검은색 화살표의 화살명, 그뒤에는 빨간색 화살표의
        // 파일명을 입력하는 식으로 입력
        // 첫 번째로 추가한 이미지는 imgUp[0]에 저장되고, 두 번째로 추가한 이미지는 imgUp[1]에 저장된다.
        imgUp.append(UIImage(named: "arrow-up-black.png")!)
        imgUp.append(UIImage(named: "arrow-up-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgLeft.append(UIImage(named: "arrow-down-black.png")!)
        imgLeft.append(UIImage(named: "arrow-down-red.png")!)
        imgRight.append(UIImage(named: "arrow-down-black.png")!)
        imgRight.append(UIImage(named: "arrow-down-red.png")!)
    }


}

