//
//  ContentView.swift
//  TextCompare
//
//  Created by Ovidiu Padeanu on 20.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var TXT_PANEL_1: String = ""
    @State private var TXT_PANEL_2: String = ""
    var body: some View {
        HStack {
            TextField("Place your text here", text: $TXT_PANEL_1)
                .frame(height: 500.0)
            Button("Compare", action: compare_panels)
            TextField("Place your text here", text: $TXT_PANEL_2)
                .frame(height: 500.0)
        }
        .padding()
    }
    
    func compare_panels()
    {
        if TXT_PANEL_1.count != TXT_PANEL_2.count
        {
            if TXT_PANEL_1.count < TXT_PANEL_2.count
            {
                TXT_PANEL_1 = add_string_padding(string_to_pad: TXT_PANEL_1, padding_length: TXT_PANEL_2.count - TXT_PANEL_1.count)
            }
            else
            {
                TXT_PANEL_2 = add_string_padding(string_to_pad: TXT_PANEL_2, padding_length: TXT_PANEL_1.count - TXT_PANEL_2.count)
            }
        }
        for (char_panel_1, char_panel_2) in zip(TXT_PANEL_1, TXT_PANEL_2)
        {
            if char_panel_1 != char_panel_2
            {
                print(char_panel_1, "!", char_panel_2)
            }
        }
    }
    
    func add_string_padding(string_to_pad: String, padding_length: Int) -> String
    {
        // Folosita pentru a adauga padding si a egala numarul de caractere din panele
        var inner_cpy: String = string_to_pad
        for _ in 1...padding_length
        {
            inner_cpy += " "
        }
        return inner_cpy
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
