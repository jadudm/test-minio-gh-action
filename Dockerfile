FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y \
        curl \
        unzip

ENV APP /app
ENV THE_DUDES_BUCKET=this-bucket-holds-the-room-together 
ENV AWS_ACCESS_KEY_ID=miniominio 
ENV AWS_SECRET_ACCESS_KEY=miniominio

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && curl https://dl.min.io/client/mc/release/linux-amd64/mc -o /usr/local/bin/mc \
    && chmod +x /usr/local/bin/mc 
