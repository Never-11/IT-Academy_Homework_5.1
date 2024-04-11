//
//  ViewController.swift
//  Homework-5.1
//
//  Created by Андрей Неверовский on 9.04.24.
//

import UIKit

/// Экран 1. Запуск  приложение

class ViewController: UIViewController {

    // MARK: - IBOutlets
    
    @IBOutlet weak var buttonStart: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var numberLabel: UILabel!
    
    // MARK: - Properties

    var squareSize: CGFloat = 100
    var x: CGFloat = 0
    var y: CGFloat = 0
    
    //MARK: - Lifecycle funcs
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Hello")
    }
    
//    func plusSquareSize() {
//        reset()
//        squareSize += 5
//    }
//    
//    func minusSquareSize() {
//        reset()
//        if squareSize > 5 {
//            squareSize -= 5
//        } else if squareSize == 5 {
//            squareSize = 5
//        }
//    }
    
    //MARK: - Flow Functions
    
    func randomColor() -> UIColor {
            return UIColor(red: .random(in: 0...1),
                           green: .random(in: 0...1),
                           blue: .random(in: 0...1),
                           alpha: 1.0)
        }
    
    func buildSquare(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat) -> UIView {
        let square = UIView()
        let label = UILabel()
        square.frame = CGRect(x: x, y: y, width: width, height: height)
        square.backgroundColor = randomColor()
        label.frame = CGRect(x: 0, y: 0, width: 50, height: 25)
        label.font = UIFont.systemFont(ofSize: 11)
        label.textColor = square.backgroundColor
        label.numberOfLines = 3
        square.addSubview(label)
        return square
    }
    
//    func buildLabel() {
//        let label = UILabel(frame: CGRect(x: 2, y: 2, width: 2, height: 2))
//        
//    }
    
    func fillingOutField() {
        if (x + squareSize) - view.frame.maxX > view.frame.maxX {
            x = 0
            y += squareSize
        }
        
        let newSquare = buildSquare(x: x, y: y, width: squareSize, height: squareSize)
        if newSquare.frame.origin.y + squareSize  <= buttonStart.frame.origin.y {
            view.addSubview(buildSquare(x: x, y: y, width: squareSize, height: squareSize))
            x += squareSize
            fillingOutField()
        }
    }
    
    func reset() {
        x = 0
        y = 0
    }

    //MARK: - IBActions
    
    @IBAction func buttonStartPress(_ sender: UIButton) {
        reset()
        fillingOutField()
    }
    
    @IBAction func buttonMinusPress(_ sender: UIButton) {
        if squareSize > 10 {
            squareSize -= 5
        }
        if squareSize == 10 {
            squareSize = 10
        }
    }
    
    @IBAction func buttonPlusPress(_ sender: UIButton) {
        squareSize += 10
    }
    
}

