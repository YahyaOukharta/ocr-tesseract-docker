FROM ubuntu:latest
MAINTAINER Rick Torzynski "ricktorzynski@gmail.com"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y python build-essential curl
RUN apt update && apt install -y libsm6 libxext6
RUN apt-get -y install tesseract-ocr
RUN curl https://bootstrap.pypa.io/get-pip.py --output get-pip.py
RUN python get-pip.py
COPY . /app
WORKDIR /app
RUN pip install pillow
RUN pip install pytesseract
RUN pip install opencv-contrib-python
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]