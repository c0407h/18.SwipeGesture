//
//  ViewController.swift
//  SwipeGesture
//
//  Created by 이충현 on 2021/02/09.
//

import UIKit

class ViewController: UIViewController {
    
    //두손가락한 스와이프 제스처를 인식해야 하기때문에 원하는 터치의 개수를 '2'로 설정
    let numOfTouchs = 2

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
        imgUp.append(UIImage(named: "arrow-up-green.png")!)
        imgDown.append(UIImage(named: "arrow-down-black.png")!)
        imgDown.append(UIImage(named: "arrow-down-red.png")!)
        imgDown.append(UIImage(named: "arrow-down-green.png")!)
        imgLeft.append(UIImage(named: "arrow-left-black.png")!)
        imgLeft.append(UIImage(named: "arrow-left-red.png")!)
        imgLeft.append(UIImage(named: "arrow-left-green.png")!)
        imgRight.append(UIImage(named: "arrow-right-black.png")!)
        imgRight.append(UIImage(named: "arrow-right-red.png")!)
        imgRight.append(UIImage(named: "arrow-right-green.png")!)
        
        //각 이미지 뷰에 할당하기
        // 각 배열의 첫 번째 값은 검은색 화살표를 나타내며, 인자 값[0]을 사용하여 참조할 수 있다.
        // 또한 두 번째 값은 빨간색 화살표를 나타내며, 인가 값[1]을 사용하여 참조할 수 있다.
        imgViewUp.image = imgUp[0]
        imgViewDown.image = imgDown[0]
        imgViewLeft.image = imgLeft[0]
        imgViewRight.image = imgRight[0]
        
        //스와이프 제스처 인식하기
        // UISwipeGestureRecognizer 클래스 상수 swipeUp을 선언
        // 액션(action)인수는 해당 스와이프 제스처를 행했을 때 실행할 메서드를 의미한다
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        // 위에서 선언한 UISwipeGestureRecognizer클래스 상수 swipeUp의 direction 속성을 설정한다. 여기서는 up으로 설정
        swipeUp.direction = UISwipeGestureRecognizer.Direction.up
       
        // 멀티터치 스와이프 제스처를 등록할땐 numberOfTouchesRequired 속성이 필요한데 이속성엔 앞에서 설정한 터치 개수인 numOfTouchs를 입력
        // swipeUp.numberOfTouchesRequired = numOfTouchs
        
        // 뷰 객체의 addGestureRecognizer메서드를 사용하여 위쪽 방향의 스와이프 제스처를 등록한다.
        self.view.addGestureRecognizer(swipeUp)
        //위와 같은 방식으로 down, left, rigth 도 만들어준다
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeDown.direction = UISwipeGestureRecognizer.Direction.down

        // swipeDown.numberOfTouchesRequired = numOfTouchs
        
        self.view.addGestureRecognizer(swipeDown)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left

        // swipeLeft.numberOfTouchesRequired = numOfTouchs
        
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(_:)))
        
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right

        // swipeRight.numberOfTouchesRequired = numOfTouchs
        
        self.view.addGestureRecognizer(swipeRight)
        
        
        // 스와이프 제스처 등록하기
        // swipeUpMulti 상수 선언하고 액션 메서드는 respondToSwipeGestureMulti 사용
        // swipeUpMulti 상수의 numberOfTouchesRequired 속성에 numOfTouchs 값 입력
        
        let swipeUpMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeUpMulti.direction = UISwipeGestureRecognizer.Direction.up
        swipeUpMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeUpMulti)
        

        let swipeDownMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeDownMulti.direction = UISwipeGestureRecognizer.Direction.down
        swipeDownMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeDownMulti)
        
        let swipeLeftMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeLeftMulti.direction = UISwipeGestureRecognizer.Direction.left
        swipeLeftMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeLeftMulti)
        
        let swipeRightMulti = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGestureMulti(_:)))
        swipeRightMulti.direction = UISwipeGestureRecognizer.Direction.right
        swipeRightMulti.numberOfTouchesRequired = numOfTouchs
        self.view.addGestureRecognizer(swipeRightMulti)
    }

    
        // 액션 메서드 구현하기.
    @objc func respondToSwipeGesture(_ gesture: UIGestureRecognizer) {
        // 만일 제스쳐가 있다면
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            // 우선 전체 이미지 뷰를 검은색 화살표로 초기화 한다( 배열 인자 값[0] 사용 )
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            // switch 문을 사용해 제스처의 방향에 따라 해당 방향의 이미지를 빨간색 이미지로 변경한다(배열 인자 값[1]사용)
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[1]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[1]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[1]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[1]
            default:
                break
            }
        }
    }
    
    // 액션 메서드 구현
    // 두손가락으로 스와이프 했을 때 실행할 액션 메서드 추가
    @objc func respondToSwipeGestureMulti(_ gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            imgViewUp.image = imgUp[0]
            imgViewDown.image = imgDown[0]
            imgViewLeft.image = imgLeft[0]
            imgViewRight.image = imgRight[0]
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizer.Direction.up:
                imgViewUp.image = imgUp[2]
            case UISwipeGestureRecognizer.Direction.down:
                imgViewDown.image = imgDown[2]
            case UISwipeGestureRecognizer.Direction.left:
                imgViewLeft.image = imgLeft[2]
            case UISwipeGestureRecognizer.Direction.right:
                imgViewRight.image = imgRight[2]
            default:
                break
            }
        }
    }
    
}

