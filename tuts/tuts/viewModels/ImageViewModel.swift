//
//  ImageViewModel.swift
//  tuts
//
//  Created by Apple on 07/05/2021.
//

import SwiftUI
import Combine

class ImageViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    var anyCancellable: Set<AnyCancellable> = Set()
    
    init(url: String) {
         NetworkUtil.getDataImage(urlString: url)
            .receive(on: DispatchQueue.main)
            .sink { (completer) in
                switch completer {
                case .failure(let err): print(err.localizedDescription)
                case .finished: break
                }
            } receiveValue: {[weak self] data in
                self?.image = data
            }
            .store(in: &anyCancellable)

    }
}
