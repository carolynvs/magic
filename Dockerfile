FROM ubuntu:16.04

COPY bin/Linux/x86_64/magic /

CMD ["/magic"]
