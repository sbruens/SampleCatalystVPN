//
//  ContentView.swift
//  SampleCatalystVPN
//
//  Created by Sander Bruens on 2/12/24.
//

import NetworkExtension
import SwiftUI

struct ContentView: View {
  let tunnelId: String = NSUUID().uuidString

  @State private var host: String = ""
  @State private var port: String = ""
  @State private var method: String = "chacha20-ietf-poly1305"
  @State private var password: String = ""

  var body: some View {
    VStack {
      TextField("host", text: $host)
      TextField("port", text: $port)
      TextField("method", text: $method)
      TextField("password", text: $password)
      Button(
        action: {
          let configJson: [String: Any] = [
            "host": host,
            "port": port,
            "method": method,
            "password": password,
          ]
          OutlineVpn.shared.start(
            tunnelId,
            configJson: configJson
          ) { errorCode in
            if errorCode == OutlineVpn.ErrorCode.noError {
              NSLog("VPN started")
            } else {
              NSLog("Failed to start VPN: \(errorCode)")
            }
          }
        },
        label: { Text("Start VPN") }
      )
      Spacer().frame(height: 30)
      Button(
        action: {
          OutlineVpn.shared.stop(tunnelId)
        },
        label: { Text("Stop VPN") }
      )
    }
    .padding()
  }
}

#Preview {
  ContentView()
}
