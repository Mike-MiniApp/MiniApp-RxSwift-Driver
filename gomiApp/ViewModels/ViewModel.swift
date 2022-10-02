//
//  ViewModel.swift
//  gomiApp
//
//  Created by 近藤米功 on 2022/10/02.
//

import Foundation
import RxSwift
import RxCocoa
import RxRelay

protocol EmailViewModelInputs {
    var inputTextField: Driver<String> { get }
}

protocol EmailViewModelOutputs{
    var outputLabel: Driver<String> { get }
}

class ViewModel: EmailViewModelInputs,EmailViewModelOutputs {
    // Inputs
    var inputTextField: Driver<String>

    // Outputs
    var outputLabel: Driver<String>
    
    init(emailTextField: Driver<String>) {
        self.inputTextField = emailTextField
        let emailModel = EmailModel()
        outputLabel = self.inputTextField
            .map { text in
                emailModel.addQuestionModel(text: text)
            }.asDriver(onErrorJustReturn: "")
    }
}
