//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MainViewController: TVINGBaseViewController {
    
    // MARK: - Property
    
    private let topMenuBar = MainViewTopMenu()
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    
    lazy var homeVC = MainHomeViewController()
    lazy var liveVC = MainLiveViewController()
    lazy var tvVC = MainTVViewController()
    lazy var movieVC = MainMovieViewController()
    lazy var paramountVC = MainParamountViewController()
    lazy var kidsVC = MainKidsViewController()
    
    lazy var pageVCDummy = [homeVC, liveVC, tvVC, movieVC, paramountVC, kidsVC]
    
    var user: TvingUser?
    
    // MARK: - Target
    
    private func target() {
        topMenuBar.topprofileBtn.addTarget(self, action: #selector(tappedGoToMyPageBtn), for: .touchUpInside)
    }
    
    // MARK: - Lift Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
    }
    
    override func setStyle() {
        pageController.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func sethirarchy() {
        super.sethirarchy()
        
        view.addSubviews(pageController.view, topMenuBar)
        addChild(pageController)
        pageController.didMove(toParent: self)
        
        if let firstVC = pageVCDummy.first {
            pageController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func setLayout() {
        super.setLayout()
        
        topMenuBar.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.top.leading.trailing.equalToSuperview()
        }
        pageController.view.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

extension MainViewController {
    
    // MARK: - objc func
    
    @objc
    func tappedGoToMyPageBtn() {
        let myPageViewController = MyPageViewController()
        myPageViewController.userDataBind(orignalUser: user)
        self.navigationController?.pushViewController(myPageViewController, animated: true)
    }
    
    // MARK: - Custom func
    
    func userDataBind(orignalUser: TvingUser) {
        user = orignalUser
    }
    
}

extension MainViewController: UIPageViewControllerDelegate { }
extension MainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCDummy.firstIndex(of: viewController as! TVINGBaseViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return pageVCDummy[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCDummy.firstIndex(of: viewController as! TVINGBaseViewController) else { return nil }
        let previousIndex = index + 1
        if previousIndex == pageVCDummy.count {
            return nil
        }
        return pageVCDummy[previousIndex]
    }
    
    
}

extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        if scrollView.contentOffset.y > 0 {
//            if scrollView.contentOffset.y < topMenuBar.frame.size.height/2 {
//                topMenuBar.snp.updateConstraints {
//                    $0.top.equalToSuperview().inset(-scrollView.contentOffset.y)
//                }
//            } else {
//                topMenuBar.snp.updateConstraints {
//                    $0.top.equalToSuperview().inset(-40)
//                }
//                topMenuBar.topMenu.isHidden = true
//
//            }
//        } else {
//            topMenuBar.snp.updateConstraints {
//                $0.top.equalToSuperview()
//            }
//            topMenuBar.topMenu.isHidden = false
//        }
        print(scrollView.contentOffset.y)
    }
}
