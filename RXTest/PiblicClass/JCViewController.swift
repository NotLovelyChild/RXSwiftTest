//
//  JCViewController.swift
//  RXTest
//
//  Created by Jack on 2019/2/28.
//  Copyright © 2019 Jack. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class JCViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  ///点击是否收回键盘  默认false
  func isTapToEndEditing(endEditing:Bool = false){
    let tapBackground = UITapGestureRecognizer()
    view.addGestureRecognizer(tapBackground)
    _ = tapBackground.rx.event
      .subscribe(onNext: { [weak self] _ in
        self?.view.endEditing(true)
      })
  }

}
