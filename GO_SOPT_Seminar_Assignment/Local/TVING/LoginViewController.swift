//
//  LoginViewController_TVING.swift
//  GO_SOPT_Seminar_Assingment
//
//  Created by 김다예 on 2023/04/11.
//

import UIKit

import SnapKit
import Then

struct TvingUserInfo {
    var id: String?
    var password: String?
    var nickName: String?
}

final class LoginViewController: BaseViewController {
    
    // MARK: - Property
    
    private let mainView = LoginView()
    private let nickNameBottomSheet = AddNickNameBottomSheetView()
    
    var user = TvingUserInfo()
    
    private var bottomSheetKeyboardEnable: Bool = false
    
    // MARK: - Target
    
    private func target() {
        mainView.idTextField.delegate = self
        mainView.passwordTextField.delegate = self
        
        mainView.idTextField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        mainView.passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        
        mainView.logInBtn.addTarget(self, action: #selector(tappedLogInBtn), for: .touchUpInside)
        mainView.goToMakeNicknameBtn.addTarget(self, action: #selector(tappedMakeNickNameBtn), for: .touchUpInside)
    }
    
    private func targetBottomSheet() {
        nickNameBottomSheet.nickNameTextField.delegate = self
        
        nickNameBottomSheet.nickNameTextField.addTarget(self, action: #selector(textFieldDidChange), for: .allEditingEvents)
        
        nickNameBottomSheet.saveNickNameBtn.addTarget(self, action: #selector(tappedSavedNickNameBtn), for: .touchUpInside)
        
        let bottomSheetBackgroundTap = UITapGestureRecognizer(target: self, action: #selector(TappedBottomSheetBackground))
        nickNameBottomSheet.dimmendView.addGestureRecognizer(bottomSheetBackgroundTap)
    }
    
    // MARK: - Lift Cycle
    
    override func loadView() {
        self.view = mainView
        view.addSubview(nickNameBottomSheet)
        
        nickNameBottomSheet.snp.makeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(view.snp.bottom)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        target()
        targetBottomSheet()
        setKeyboardObserver()   // 키보드 활성화에 따른 bottomSheet 높이 조절 위해
    }
    
    override func viewWillAppear(_ animated: Bool) {
        initView()
    }

}

private extension LoginViewController {
    
    // MARK: - objc func
    
    @objc
    func tappedLogInBtn() {
        saveUserEmail()
        let welcomViewController = WelcomeViewController()
        welcomViewController.idDataBind(idOrNick: getNickNameOrId())
        self.navigationController?.pushViewController(welcomViewController, animated: true)
    }
    
    @objc
    func tappedMakeNickNameBtn() {
        showBottomSheet()
    }
    
    @objc
    func tappedSavedNickNameBtn() {
        saveUserNickName()
        hideBottomSheet()
    }
    
    @objc func TappedBottomSheetBackground(_ tapRecognizer: UITapGestureRecognizer) {
        hideBottomSheet()
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else { return }
        if (nickNameBottomSheet.nickNameTextField.isSelected){
            bottomSheetKeyboardEnable = true
            nickNameBottomSheet.bottomSheetView.frame.origin.y = UIScreen.main.bounds.height - (nickNameBottomSheet.bottomSheetHeight + keyboardSize.height)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if (nickNameBottomSheet.nickNameTextField.isSelected){
            bottomSheetKeyboardEnable = true
            nickNameBottomSheet.bottomSheetView.frame.origin.y = UIScreen.main.bounds.height - nickNameBottomSheet.bottomSheetHeight
        }
    }
    
    // MARK: - custom func
    
    func saveUserEmail(){
        guard let id = mainView.idTextField.text else { return }
        user.id = id
    }
    
    func saveUserNickName() {
        guard let nickName = nickNameBottomSheet.nickNameTextField.text else { return }
        user.nickName = nickName
    }
    
    func getNickNameOrId() -> String {
        if let nickName = user.nickName {
            return nickName
        } else {
            guard let id = user.id else { return "" }
            return id
        }
    }
    
    func isIDValid() -> Bool {
        guard let id = mainView.idTextField.text else { return false }
        return id.isValidEmail()
    }
    
    func showBottomSheet() {
        nickNameBottomSheet.nickNameTextField.isSelected = true
        nickNameBottomSheet.snp.remakeConstraints {
            $0.edges.equalToSuperview()
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.nickNameBottomSheet.frame = CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height)
        })
    }
    
    func hideBottomSheet() {
        nickNameBottomSheet.nickNameTextField.isSelected = false
        nickNameBottomSheet.snp.remakeConstraints {
            $0.width.equalToSuperview()
            $0.top.equalTo(view.snp.bottom)
        }
        UIView.animate(withDuration: 0.5, animations: {
            self.nickNameBottomSheet.frame = CGRect(x: 0.0, y: self.view.frame.height, width: self.view.frame.width, height: self.view.frame.height)
            }
        )
    }
    
    func initView() {
        mainView.idTextField.text = nil
        mainView.passwordTextField.text = nil
        nickNameBottomSheet.nickNameTextField.text = nil
        user = TvingUserInfo()
        mainView.logInBtn.enableDisableButtonSet(isEnable: false, setColor: .black, setTextColor: .tvingGray2)
    }
    
    func setKeyboardObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
}

// MARK: - TextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    // textField가 활성화되면
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderColor = UIColor.tvingGray2.cgColor
        textField.layer.borderWidth = 0.7
    }

    // textField 비활성화되면
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.layer.borderWidth = 0
        
        idValidPrint()
            
        return true
    }
    
    @objc
    private func textFieldDidChange(_ textField: UITextField) {
        
        if let nickNameText = nickNameBottomSheet.nickNameTextField.text {
            if (!nickNameText.isValidNickName()) {
                nickNameBottomSheet.nickNameTextField.text = nil
            }
        }
        
        let idPwIsFull: Bool = mainView.idTextField.hasText && mainView.passwordTextField.hasText
        let saveIdPwBtnEnable: Bool = idPwIsFull && isIDValid()
        
        if (saveIdPwBtnEnable) {
            mainView.logInBtn.enableDisableButtonSet(isEnable: saveIdPwBtnEnable, setColor: .tvingRed, setTextColor: .white)
        }else {
            mainView.logInBtn.enableDisableButtonSet(isEnable: saveIdPwBtnEnable, setColor: .black, setTextColor: .tvingGray2)
        }
        
        let saveNickNameBtnEnable = nickNameBottomSheet.nickNameTextField.hasText
    
        if (saveNickNameBtnEnable) {
            nickNameBottomSheet.saveNickNameBtn.enableDisableButtonSet(isEnable: saveNickNameBtnEnable, setColor: .tvingRed, setTextColor: .white)
        }else {
            nickNameBottomSheet.saveNickNameBtn.enableDisableButtonSet(isEnable: saveNickNameBtnEnable, setColor: .black, setTextColor: .tvingGray2)
        }
    }
    
    private func idValidPrint() {
        
        if (!(mainView.idTextField.text?.isValidEmail() ?? false) && mainView.idTextField.hasText) {
            mainView.idTextField.layer.borderColor = UIColor.tvingRed.cgColor
            mainView.idTextField.layer.borderWidth = 0.7
            
            mainView.idInvalidLabel.isHidden = false
            mainView.idInvalidLabel.snp.remakeConstraints {
                $0.leading.equalTo(mainView.idTextField.snp.leading)
                $0.top.equalTo(mainView.idTextField.snp.bottom).offset(5)
            }
            
            mainView.passwordTextField.snp.remakeConstraints {
                $0.height.equalTo(52)
                $0.top.equalTo(mainView.idTextField.snp.bottom).offset(30)
                $0.leading.trailing.equalToSuperview().inset(20)
            }
        } else {
            mainView.idTextField.layer.borderWidth = 0
            
            mainView.idInvalidLabel.isHidden = true
            
            mainView.passwordTextField.snp.remakeConstraints {
                $0.height.equalTo(52)
                $0.top.equalTo(mainView.idTextField.snp.bottom).offset(7)
                $0.leading.trailing.equalToSuperview().inset(20)
            }
        }
    }
    
}
