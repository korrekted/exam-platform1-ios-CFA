//
//  SplashView.swift
//  Nursing
//
//  Created by Andrey Chernyshev on 17.01.2021.
//

import UIKit

final class SplashView: UIView {
    lazy var titleLabel = makeTitleLabel()
    lazy var imageView = makeImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        makeConstraints()
        initialize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private
private extension SplashView {
    func initialize() {
        backgroundColor = Appearance.backgroundColor
    }
}

// MARK: Make constraints
private extension SplashView {
    func makeConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8.scale),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8.scale),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: ScreenSize.isIphoneXFamily ? 131.scale : 60.scale)
        ])
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50.scale),
        ])
    }
}

// MARK: Lazy initialization
private extension SplashView {
    func makeTitleLabel() -> UILabel {
        let attrs1 = TextAttributes()
            .textColor(Appearance.progress1Color)
            .font(Fonts.SFProRounded.bold(size: 40.scale))
            .lineHeight(48.scale)
            .textAlignment(.center)
        
        let attrs2 = TextAttributes()
            .textColor(Appearance.progress2Color)
            .font(Fonts.SFProRounded.bold(size: 45.scale))
            .lineHeight(53.scale)
            .textAlignment(.center)
        
        let string = NSMutableAttributedString()
        string.append("Splash.Title.Part1".localized.attributed(with: attrs1))
        string.append("Splash.Title.Part2".localized.attributed(with: attrs2))
        string.append("Splash.Title.Part3".localized.attributed(with: attrs1))
        
        let view = UILabel()
        view.numberOfLines = 0
        view.attributedText = string
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
    
    func makeImageView() -> UIImageView {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.image = UIImage(named: "Splash.Image")
        view.translatesAutoresizingMaskIntoConstraints = false
        addSubview(view)
        return view
    }
}