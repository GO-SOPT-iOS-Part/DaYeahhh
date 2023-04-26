//
//  UIImage+.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit.UIImage

extension UIImage {
    
    static var backImg: UIImage { UIImage(named: "btn_before.png")! }
    static var nextImg: UIImage { UIImage(named: "nextBtn.png")! }
    
    static var bellImg: UIImage { UIImage(named: "notification.png")! }
    static var settingImg: UIImage { UIImage(named: "settings.png")! }
    static var profileImg: UIImage { UIImage(named: "tvingImg.jpg")! }
    static var utilizeImg: UIImage { UIImage(named: "tvingSubscribe.png")! }
    static var cashImg: UIImage { UIImage(named: "tvingCash.png")! }
    
    static var bottomHomeG: UIImage { UIImage(named: "homeGray.jpg")! }
    static var bottomHomeW: UIImage { UIImage(named: "homeWhite.jpg")! }
    static var bottomPreG: UIImage { UIImage(named: "preGray.jpg")! }
    static var bottomPreW: UIImage { UIImage(named: "preWhite.jpg")! }
    static var bottomSearchG: UIImage { UIImage(named: "searchGray.jpg")! }
    static var bottomSearchW: UIImage { UIImage(named: "searchWhite.jpg")! }
    static var bottomRecordG: UIImage { UIImage(named: "recordGray.jpg")! }
    static var bottomRecordW: UIImage { UIImage(named: "recordWhite.jpg")! }
    
    static var tvnImg: UIImage { UIImage(named: "tvn.png")! }
    static var jtbcImg: UIImage { UIImage(named: "jtbc.png")! }
    
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
}
