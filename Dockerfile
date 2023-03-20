FROM public.ecr.aws/debian/debian:bullseye as Corkscrew
RUN apt update && apt install -y build-essential git  autoconf 
# run git clone corkscrew repository
WORKDIR /build
RUN git clone https://github.com/bryanpkc/corkscrew.git \
        && cd corkscrew \
        && autoreconf --install \
        && ./configure && make && make install


# example usage of including corkscrow in a docker image
FROM public.ecr.aws/debian/debian:bullseye
COPY --from=Corkscrew /usr/local/bin/corkscrew /usr/local/bin/corkscrew


