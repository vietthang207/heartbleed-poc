# heartbleed-poc

## building docker image
docker build -t heartbleed-nginx .

## Run docker image
docker run --rm --network host heartbleed-nginx

## Simulate vulnerable victim
python3 alice.py

## Run the exploit script
python2 heartbleed_exploit.py