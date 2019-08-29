open Qrencode

let _ =
  let input = QRinput.create () in
  let mode = QRencodeMode.mode_8 () in
  let _rc = QRinput.append input mode "http://www.tezos.com" in
  let code = QRcode.encode input in
  QRcode.to_png code 10 4 "/tmp/out.png"
