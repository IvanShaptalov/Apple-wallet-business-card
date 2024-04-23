//
//  ContentView.swift
//  Passmaker
//
//  Created by Chris Williams on 9/2/23.
//

import SwiftUI
import PassKit

struct ContentView: View {
    @State private var qrTest = "ssiddiqui@nexthomerepros.com"
    
    @State private var backgroundColor = Color.white
    @State private var textColor = Color.black
    
    @State private var isLoading = false
    
    @State private var newPass: PKPass?
    
    @State private var passSheetVisible = false
    
    var body: some View {
        VStack {
            Form {
                Section("Website") {
                    TextField("QR Text", text: self.$qrTest)
                }
                
                Section("Add to wallet") {
                    if (self.isLoading) {
                        ProgressView()
                    } else {
                        AddPassToWalletButton {
                            
                        }
                    }
                }
            }
        }
        .navigationTitle("Pass Generator")
        .sheet(isPresented: self.$passSheetVisible) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
