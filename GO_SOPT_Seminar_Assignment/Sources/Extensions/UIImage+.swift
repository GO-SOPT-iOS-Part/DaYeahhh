//
//  UIImage+.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit.UIImage

extension UIImage {
        
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    static var backImg: UIImage { UIImage(named: "btn_before.png")! }
    static var nextImg: UIImage { UIImage(named: "nextBtn.png")! }
    
    static var notificationImg: UIImage { UIImage(named: "notification.png")! }
    static var settingImg: UIImage { UIImage(named: "settings.png")! }
    static var profileImg: UIImage { UIImage(named: "tvingImg.jpg")! }
    static var utilizeImg: UIImage { UIImage(named: "tvingSubscribe.png")! }
    static var cashImg: UIImage { UIImage(named: "tvingCash.png")! }
    static var tvnJtbcImg: UIImage { UIImage(named: "tvnJtbc.png")! }

    static var bottomHomeG: UIImage { UIImage(named: "homeGray.jpg")! }
    static var bottomHomeW: UIImage { UIImage(named: "homeWhite.jpg")! }
    static var bottomPreG: UIImage { UIImage(named: "preGray.jpg")! }
    static var bottomPreW: UIImage { UIImage(named: "preWhite.jpg")! }
    static var bottomSearchG: UIImage { UIImage(named: "searchGray.jpg")! }
    static var bottomSearchW: UIImage { UIImage(named: "searchWhite.jpg")! }
    static var bottomRecordG: UIImage { UIImage(named: "recordGray.jpg")! }
    static var bottomRecordW: UIImage { UIImage(named: "recordWhite.jpg")! }
    
    static var faded: UIImage { UIImage(named: "Faded.png")! }

    static var yourNamePoster: UIImage { UIImage(named: "YourNamePoster.png")! }
    static var harryPotterPoster: UIImage { UIImage(named: "HarryPotterPoster.png")! }
    static var loardOfTheKingPoster: UIImage { UIImage(named: "LordOfTheRingPoster.png")! }
    static var signalPoster: UIImage { UIImage(named: "signalPoster.png")! }
    static var suzumePoster: UIImage { UIImage(named: "SuzumePoster.png")! }
    static var mtPoster: UIImage { UIImage(named: "MT.jpg")! }

    static var banner1: UIImage { UIImage(named: "Banner1.jpg")! }
    static var banner2: UIImage { UIImage(named: "Banner2.jpg")! }
    static var banner3: UIImage { UIImage(named: "Banner3.jpg")! }

    static var live1: UIImage { UIImage(named: "Live1.jpg")! }
    static var live2: UIImage { UIImage(named: "Live2.jpg")! }
    static var live3: UIImage { UIImage(named: "Live3.jpg")! }
    
    static var paramount1: UIImage { UIImage(named: "paramount1.jpg")! }
    static var paramount2: UIImage { UIImage(named: "paramount2.jpg")! }
    static var paramount3: UIImage { UIImage(named: "paramount3.jpg")! }
    static var paramount4: UIImage { UIImage(named: "paramount4.jpg")! }
    static var paramount5: UIImage { UIImage(named: "paramount5.jpg")! }

}
