//
//  HomeViewVM.swift
//  SwiftRun
//
//  Created by 황석현 on 1/9/25.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewVM {
    
    let categoriesRelay = BehaviorRelay<[Category]>(value: [])
    let itemSelected = PublishRelay<Category>()
    
    private let networkManager = NetworkManager.shared
    private let disposeBag = DisposeBag()
    
    init() {
        itemSelected
            .subscribe(onNext: { selectedItem in
                print("Selected Item: \(selectedItem)")
            })
            .disposed(by: disposeBag)
    }
    
    // 카테고리 불러오기
    func fetchAllCategories() {
        guard let url = URL(string: Url.allCategory) else {
            print("Invalid URL")
            return
        }
        
        networkManager.fetch(url: url)
            .subscribe(onSuccess: { [weak self] (categories: [String : Category]) in
                // 카테고리 정렬
                let sortedCategories = categories.sorted { $0.key < $1.key }
                let categoryList = sortedCategories.map { $0.value }
                self?.categoriesRelay.accept(categoryList)
            }, onFailure: { error in
                print("Error fetching categories: \(error.localizedDescription)")
            })
            .disposed(by: disposeBag)
    }
}
