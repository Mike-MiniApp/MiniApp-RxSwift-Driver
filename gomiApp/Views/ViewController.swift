//
//  ViewController.swift
//  gomiApp
//
//  Created by 近藤米功 on 2022/10/02.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    // MARK: - UI Parts
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var outputLabel: UILabel!

    private let disposeBag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBindings()
    }

    private func setupBindings() {
        let viewModel = ViewModel(emailTextField: inputTextField.rx.text.orEmpty.asDriver())
        viewModel.outputLabel
            .drive { result in
                self.outputLabel.text = result
            }
            .disposed(by: disposeBag)
    }
}

