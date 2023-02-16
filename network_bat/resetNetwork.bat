rem WinSock（Windows Sockets API）の設定情報を初期化
netsh winsock reset

rem IPアドレス設定を初期化
netsh int ip reset

rem DNSキャッシュを初期化
ipconfig /flushdns
