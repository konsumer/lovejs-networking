# this is a simple Uwebsocket echo-server (send back upper-case)

import asyncio
import websockets

async def echo(websocket, path):
    async for message in websocket:
        print(f"{path} wrote: {message}")
        await websocket.send(message.upper())

start_server = websockets.serve(echo, "localhost", 8765)

asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()