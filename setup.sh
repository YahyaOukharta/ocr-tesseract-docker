docker build -t ocr .
docker rm -f ocr-con
docker run -d -p 5000:5000 --name ocr-con ocr
