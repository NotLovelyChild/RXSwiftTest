//
//  ViewController.swift
//  RXTest
//
//  Created by Jack on 2019/1/3.
//  Copyright © 2019年 Jack. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
  
  var tableView: UITableView?
  
  let musicListViewModel = MusicListViewModel()
  
  //负责对象销毁
  let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    tableView = UITableView(frame: view.frame)
    tableView?.register(MusicTableViewCell.self, forCellReuseIdentifier: "musicCell")
    view.addSubview(tableView!)
    
    musicListViewModel.data.bind(to: (tableView?.rx.items(cellIdentifier: "musicCell"))!){
      (_, music, cell) in
      cell.textLabel?.text = music.name
      cell.detailTextLabel?.text = music.singer
    }.disposed(by: disposeBag)
    
    tableView?.rx.modelSelected(Music.self).subscribe(onNext: { (music) in
      print(music.description)
    }, onError: { (error) in
      print(error)
    }, onCompleted: {
      print("onCompleted")
    }, onDisposed: {
      print("onDisposed")
    }).disposed(by: disposeBag)
    
    
    let observable = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
    
    observable.map{
      "当前索引数：\($0 )"
    }.bind(to: {
      text in
      print(text)
    })
    
  }
  
  
}

