//
//  ViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/05/12.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getMovie()
    }
    
    private func getMovie() {
        
        MovieService.shared.getMovie() { response in
            switch response {
            case .success(let data):
                print("VCSuccess")
                guard let data = data as? ContentsDataModel else { return }
                guard let movieData = data.results.first else { return }
                dump(movieData)
            default:
                print("VCFailed")
                return
            }
        }
    }
}
