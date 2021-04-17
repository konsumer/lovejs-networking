# this is a simple UDP socket echo-server (send back upper-case)

import socketserver

class MyUDPHandler(socketserver.BaseRequestHandler):
    def handle(self):
        data = self.request[0].strip()
        socket = self.request[1]
        print(f"{self.client_address[0]} wrote: {data}")
        socket.sendto(data.upper(), self.client_address)

print("Starting simple UDP socket server on port 12345")
with socketserver.UDPServer(('0.0.0.0', 12345), MyUDPHandler) as server:
    server.serve_forever()