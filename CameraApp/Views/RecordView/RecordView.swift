//
//  RecordView.swift
//  CameraApp
//
//  Created by Оксана on 21.12.2021.
//

import UIKit

class RecordView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var recordView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let bundle = Bundle.main
        let nibName = String(describing: Self.self)
        bundle.loadNibNamed(nibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}
