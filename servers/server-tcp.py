# this is a simple TCP socket echo-server (send back upper-case)

import socketserver

class MyTCPHandler(socketserver.BaseRequestHandler):
    def handle(self):
        self.data = self.request.recv(1024).strip()
        print(f"{self.client_address[0]} wrote: {self.data}")
        self.request.sendall(self.data.upper())

if __name__ == "__main__":
    with socketserver.TCPServer(('0.0.0.0', 12345), MyTCPHandler) as server:
        server.serve_forever()