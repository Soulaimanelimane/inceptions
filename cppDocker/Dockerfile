FROM debian:bookworm

RUN  apt -y update &&  apt install -y  build-essential

COPY . .


RUN c++ main.cpp -o main 

CMD ["./main"]
