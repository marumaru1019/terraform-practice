FROM hashicorp/terraform:0.14.9

WORKDIR /work

COPY . .

RUN /bin/bash ./valiable.sh