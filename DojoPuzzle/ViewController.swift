//
//  ViewController.swift
//  DojoPuzzle
//
//  Created by Bruno Lopes de Mello on 05/02/19.
//  Copyright © 2019 Bruno Lopes de Mello. All rights reserved.
//

/*
 Este problema foi utilizado em 226 Dojo(s).
 Dado um cheque com o seu valor por extenso, desenvolva um programa que retorne o seu valor numérico.
 Por exemplo se informarmos "dois mil quinhentos e vinte e três reais e dezoito centavos", o seu programa deve retornar "2523,18"
 */

//http://dojopuzzles.com/problemas/exibe/lendo-um-cheque/#

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var valueCurrency: UITextField!
    @IBOutlet weak var generateButton: UIButton!
    @IBOutlet weak var valueInExtensionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        valueCurrency.inputAccessoryView = Utils.toolBar(forTextField: "Ok", target: self, andSelector: #selector(textFieldShouldReturn(_:)))
    }

    @IBAction func genrateSpellOut(_ sender: Any) {
        
        guard valueCurrency.text?.count ?? 0 > 0 else {return}
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        formatter.locale = Locale(identifier: "pt_BR")
        
        var valorLimpo = valueCurrency.text?.replacingOccurrences(of: "R$", with: "")
            .trimmingCharacters(in: .whitespaces)
            .replacingOccurrences(of: ",", with: "").replacingOccurrences(of: ".", with: "")

        let lastTwoDigits = valorLimpo?.suffix(2)
        valorLimpo = String(valorLimpo?.dropLast(2) ?? "")
        
        let prefixo = NSNumber(value: Int(valorLimpo!)!)
        let sufixo = NSNumber(value: Int(lastTwoDigits!)!)
        let texto = "\(formatter.string(from: prefixo) ?? "") reais e \(formatter.string(from: sufixo) ?? "") centavos"
        
        valueInExtensionLabel.text = texto
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if !string.isEmpty {
            let texto = textField.text! + string
            textField.text = texto.currencyInputFormatting()
            return false
        } else if string.isEmpty {
            let texto = textField.text!
            textField.text = texto.currencyInputFormatting()
        }
        
        return true
    }
}

