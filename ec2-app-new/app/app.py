from http.server import HTTPServer, SimpleHTTPRequestHandler
import os

os.chdir('/home/ec2-user/app')

server_address = ('0.0.0.0', 80)
httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
print('Starting simple app on http://0.0.0.0:80')
httpd.serve_forever()
