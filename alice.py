import requests
c = {
    'session': 'ultr@_s3cr3t_c00kie'
}
print("sending req with cookie:", c)
print()
requests.get('https://127.0.0.1:11443', cookies=c, verify=False)
