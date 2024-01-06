//
//  KeyboardManager.swift
//

import UIKit

protocol KeyboardManagerDelegate: AnyObject {
    
    func keyboardWillShow(_ keyboard: CGRect)
    
    func keyboardWillHide(_ keyboard: CGRect)
}

final class KeyboardManager {
    
    private weak var delegate: KeyboardManagerDelegate?
    
    init(delegate: KeyboardManagerDelegate) {
        self.delegate = delegate
        watchKeyboardState()
    }
    
    func watchKeyboardState() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
    }
    
    @objc func keyboardWillHide(_ notification: NSNotification) {
        guard
            let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        delegate?.keyboardWillHide(keyboard)
    }
    
    @objc func keyboardWillShow(_ notification: NSNotification) {
        guard
            let keyboard = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        delegate?.keyboardWillShow(keyboard)
    }
}
