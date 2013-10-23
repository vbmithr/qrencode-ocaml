open Printf

let _ = 
  let input = QRinput.create () in 
  let mode = QRencodeMode.mode_8 () in 
  let rc = QRinput.append input mode "http://www.corefarm.com" in 
  let code = QRcode.encode input in
   QRcode.to_png code 10 4 "/tmp/out.png" 

