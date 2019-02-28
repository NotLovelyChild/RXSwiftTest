//
//  MusicListViewModel.swift
//  RXTest
//
//  Created by Jack on 2019/2/22.
//  Copyright © 2019 Jack. All rights reserved.
//

import Foundation
import RxSwift
//歌曲列表数据源
struct MusicListViewModel {
  let data = Observable.just(
    [
      Music(name: "无条件", singer: "陈奕迅"),
      Music(name: "你曾是少年", singer: "S.H.E"),
      Music(name: "从前的我", singer: "陈洁仪"),
      Music(name: "在木星", singer: "朴树")
    ]
  )
}
