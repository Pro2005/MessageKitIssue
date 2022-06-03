//
//  ViewController.swift
//  MessageKitIssue
//
//  Created by Denysov Illia on 03.06.2022.
//

import UIKit
import MessageKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    private func makeTestAttributedString() -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "Test\n\n\t•\tItems with testmultiline issueend")
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: .init(location: 0, length: 6))
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = NSTextAlignment.natural
        paragraphStyle.lineSpacing = 0
        paragraphStyle.paragraphSpacing = 0
        paragraphStyle.headIndent = 30
        paragraphStyle.tailIndent = 0
        paragraphStyle.firstLineHeadIndent = 0
        paragraphStyle.lineBreakMode = .byWordWrapping
        paragraphStyle.tabStops = [.init(textAlignment: .right, location: 22, options: [:]), .init(textAlignment: .left, location: 30, options: [:])]
        attributedText.addAttributes([
            .font: UIFont.systemFont(ofSize: 15),
                .paragraphStyle: paragraphStyle
        ], range: .init(location: 6, length: 3))
        attributedText.addAttribute(.font, value: UIFont.systemFont(ofSize: 15), range: .init(location: 9, length: 33))
        return attributedText
    }
    
    private func labelSize(for attributedText: NSAttributedString, considering maxWidth: CGFloat) -> CGSize {
        let constraintBox = CGSize(width: maxWidth, height: .greatestFiniteMagnitude)
        let rect = attributedText.boundingRect(with: constraintBox, options: [.usesLineFragmentOrigin, .usesFontLeading], context: nil).integral

        return rect.size
    }
    
    override func loadView() {
        let view = UIView()
        view.backgroundColor = .white

        let attributedText = makeTestAttributedString()
        let size = labelSize(for: attributedText, considering: 270)
        
        let messageLabel = MessageLabel(frame: .init(origin: .init(x: 0, y: 50), size: size))
        messageLabel.backgroundColor = .green
        messageLabel.attributedText = attributedText
        view.addSubview(messageLabel)
        
        
        let label = UILabel(frame: .init(origin: .init(x: 0, y: 200), size: .init(width: size.width, height: size.height)))
        label.numberOfLines = 0
        label.backgroundColor = .green
        label.attributedText = attributedText
        view.addSubview(label)
        
        self.view = view
    }


}

