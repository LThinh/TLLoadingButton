//
//  TLLoadingButton.swift
//  TLLoadingButton
//
//  Created by ThinhLe on 4/11/20.
//  Copyright © 2020 ThinhLe. All rights reserved.
//

import UIKit

public protocol TLLoadingDelegate where Self: UIView {
    var hidesWhenStopped: Bool { get }
    func startAnimating()
    func stopAnimating()
}

public class TLLoadingButton: UIButton {
    private var title: String?
    @IBInspectable public var loadingTitle: String?
     @IBInspectable public var spacing: CGFloat = 0 {
        didSet {
            containerView.spacing = spacing
        }
    }
    
    private(set) var loadingLabel: UILabel!
    private(set) var containerView: UIStackView!
    
    public var animatedStyle: AnimatedStyle = .left {
        didSet {
            updateAnimatedView()
        }
    }
    
    public var isAnimating: Bool = false
    
    public var animatedView: TLLoadingDelegate? {
        didSet {
            updateAnimatedView()
        }
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initSubview()
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubview()
    }
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        finishSetUp()
    }
    
    public func startLoading() {
        isEnabled = false
        isAnimating = true
        loadingLabel.text = loadingTitle
        animatedView?.startAnimating()
    }
    
    public func stopLoading() {
        isEnabled = true
        isAnimating = false
        loadingLabel.text = title
        animatedView?.stopAnimating()
    }
    
    public func finishSetUp() {
        title = titleLabel?.text
        loadingLabel.text = titleLabel?.text
        loadingLabel.font = titleLabel?.font
        loadingLabel.textColor = titleLabel?.textColor
        setTitle(nil, for: .normal)
        if animatedView == nil {
            let indicator = UIActivityIndicatorView()
            indicator.hidesWhenStopped = true
            indicator.color = loadingLabel.textColor
            animatedView = indicator
        }
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
    public enum AnimatedStyle {
        case left
        case right
    }
}
