// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "OutlineAppleLib",
  products: [
    .library(
      name: "Tun2socks",
      targets: ["Tun2socks"]
    ),
    .library(
      name: "OutlineTunnel",
      targets: ["OutlineTunnel"]
    ),
  ],
  targets: [
    .target(
      name: "OutlineTunnel",
      dependencies: [
        "Tun2socks"
      ]
    ),
    .binaryTarget(
      name: "Tun2socks",
      url: "https://github.com/Jigsaw-Code/outline-go-tun2socks/releases/download/v3.4.0/apple.zip",
      checksum: "6c6880fa7d419a5fddc10588edffa0b23b5a44f0f840cf6865372127285bcc42"
    ),
  ]
)
