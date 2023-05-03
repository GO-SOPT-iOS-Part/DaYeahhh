//
//  MainViewController.swift
//  GO_SOPT_Seminar_Assignment
//
//  Created by 김다예 on 2023/04/25.
//

import UIKit

import SnapKit
import Then

class MainViewController: BaseViewController {
    
    // MARK: - Property
    
    private let topMenuBar = MainViewTopMenu()
    private let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
    private let bottomMenuBar = BottomMenu()
    
    lazy var homeVC = MainHomeViewController()
    lazy var liveVC = MainLiveViewController()
    lazy var tvVC = MainTVViewController()
    lazy var movieVC = MainMovieViewController()
    lazy var paramountVC = MainParamountViewController()
    lazy var kidsVC = MainKidsViewController()
    
    lazy var pageVCDummy = [homeVC, liveVC, tvVC, movieVC, paramountVC, kidsVC]
    private var pageVCIndicatorWidth: [CGFloat] = []
    var currentPageIndex: Int = 0 {
        didSet{
            settingTopSegmentIndicator(index: currentPageIndex)
        }
    }
    
    var user: TvingUser?
    
    // MARK: - Target
    
    private func target() {
        topMenuBar.topprofileBtn.addTarget(self, action: #selector(tappedGoToMyPageBtn), for: .touchUpInside)
        topMenuBar.topSegmentLabelStackView.arrangedSubviews.forEach {
            $0.isUserInteractionEnabled = true
            $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(segmentTouched)))
        }
        pageVCDummy.forEach {
            $0.scrollDelegate = self
        }
    }
    
    // MARK: - Lift Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        getTopSegmentWidth()
    }
    
    override func setStyle() {
        pageController.do {
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    override func sethirarchy() {
        super.sethirarchy()
        
        view.addSubviews(pageController.view, topMenuBar, bottomMenuBar)
        addChild(pageController)
        pageController.didMove(toParent: self)
        
        if let firstVC = pageVCDummy.first {
            pageController.setViewControllers([firstVC], direction: .forward, animated: true, completion: nil)
        }
    }
    
    override func setLayout() {
        super.setLayout()
        
        topMenuBar.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
        }
        pageController.view.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(bottomMenuBar.snp.top)
        }
        bottomMenuBar.snp.makeConstraints{
            $0.height.equalTo(52)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
            $0.leading.trailing.equalToSuperview()
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
    
    @objc
    func segmentTouched(sender: UITapGestureRecognizer) {
        guard let labelView = sender.view else { return }
        guard let index = topMenuBar.topSegmentLabelStackView.arrangedSubviews.firstIndex(of: labelView) else { return }
        pageController.setViewControllers([pageVCDummy[index]], direction: .forward, animated: true, completion: nil)
        currentPageIndex = index
    }
    
    // MARK: - Custom func
    
    func userDataBind(orignalUser: TvingUser) {
        user = orignalUser
    }
    
    func getTopSegmentWidth() {
        topMenuBar.topSegmentLabelStackView.arrangedSubviews.forEach{
            pageVCIndicatorWidth.append($0.intrinsicContentSize.width)
        }
    }
    
    func settingTopSegmentIndicator(index: Int) {
        topMenuBar.topSegmentIndicator.width = pageVCIndicatorWidth[index]
        topMenuBar.topSegmentIndicator.leftInset = pageVCIndicatorWidth[0..<index].reduce(0, +) + (CGFloat(index) * topMenuBar.topSegmentLabelStackView.spacing)
    }
    
}

extension MainViewController: UIPageViewControllerDelegate { }
extension MainViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCDummy.firstIndex(of: viewController as! MainBaseViewController) else { return nil }
        let previousIndex = index - 1
        if previousIndex < 0 {
            return nil
        }
        return pageVCDummy[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageVCDummy.firstIndex(of: viewController as! MainBaseViewController) else { return nil }
        let previousIndex = index + 1
        if previousIndex > pageVCDummy.count - 1 {
            return nil
        }
        return pageVCDummy[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        guard let currentVC = pageViewController.viewControllers?.first,
              let currentIndex = pageVCDummy.firstIndex(of: currentVC as! MainBaseViewController) else { return }
        currentPageIndex = currentIndex
    }
}

extension MainViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y > 0 {
            if scrollView.contentOffset.y < 40 {
                topMenuBar.snp.updateConstraints {
                    $0.top.equalToSuperview().inset(-scrollView.contentOffset.y)
                }
            } else {
                topMenuBar.snp.updateConstraints {
                    $0.top.equalToSuperview().inset(-40)
                }
                topMenuBar.topMenu.isHidden = true
            }
        } else {
            topMenuBar.snp.updateConstraints {
                $0.top.equalToSuperview()
            }
            topMenuBar.topMenu.isHidden = false
        }
        if scrollView.contentOffset.y > 20 {
            topMenuBar.backgroundColor = .black.withAlphaComponent(scrollView.contentOffset.y / ContentsSectionLayout.header.itemSize.heightDimension.dimension)
            if scrollView.contentOffset.y > ContentsSectionLayout.header.itemSize.heightDimension.dimension {
                topMenuBar.backgroundColor = .black
            }
        } else {
            topMenuBar.backgroundColor = .clear
        }
    }
}
