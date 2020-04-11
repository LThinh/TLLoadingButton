//
//  TLLoadingButton.swift
//  TLLoadingButton
//
//  Created by ThinhLe on 4/11/20.
//  Copyright © 2020 ThinhLe. All rights reserved.
//

import UIKit

protocol TLLoadingDelegate where Self: UIView {
    var hidesWhenStopped: Bool { get }
    func startAnimating()
    func stopAnimating()
}

class TLLoadingButton: UIButton {
    private var title: String?
    @IBInspectable var loadingTitle: String?
    
    private(set) var loadingLabel: UILabel!
    private(set) var containerView: UIStackView!
    
    var spacing: CGFloat = 0 {
        didSet {
            containerView.spacing = spacing
        }
    }
    
    var animatedStyle: AnimatedStyle = .left {
        didSet {
            updateAnimatedView()
        }
    }
    
    private(set) var isAnimating: Bool = false
    
    var animatedView: TLLoadingDelegate? {
        didSet {
            updateAnimatedView()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubview()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        title = titleLabel?.text
        loadingLabel.text = titleLabel?.text
        loadingLabel.font = titleLabel?.font
        loadingLabel.textColor = titleLabel?.textColor
        setTitle(nil, for: .normal)
    }
    
    func startLoading() {
        isEnabled = false
        isAnimating = true
        loadingLabel.text = loadingTitle
        animatedView?.startAnimating()
    }
    
    func stopLoading() {
        isEnabled = true
        isAnimating = false
        loadingLabel.text = title
        animatedView?.stopAnimating()
    }
    
    private func updateAnimatedView() {
        guard let view = animatedView else { return }
        containerView.removeArrangedSubview(view)
        let count = containerView.arrangedSubviews.count
        switch animatedStyle {
        case .left:
            containerView.insertArrangedSubview(view, at: 0)
        case .right:
            containerView.insertArrangedSubview(view, at: count)
        }
    }
    
    private func initSubview() {
        loadingLabel = UILabel()
        containerView = UIStackView()
        
        containerView.axis = .horizontal
        containerView.alignment = .center
        containerView.addArrangedSubview(loadingLabel)
        containerView.spacing = spacing
        addSubview(containerView)
        containerView.isUserInteractionEnabled = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
    }
}

extension TLLoadingButton {
    enum AnimatedStyle {
        case left
        case right
    }
}
