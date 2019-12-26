FROM mcr.microsoft.com/dotnet/core/sdk:2.1

ENV NSWAG_BUILD="1057"

RUN mkdir -p /opt/ && mkdir -p /app/

RUN curl -O -L https://github.com/RicoSuter/NSwag/releases/download/NSwag-Build-${NSWAG_BUILD}/NSwag.zip \
    && apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && unzip -q ./NSwag.zip -d /opt/NSwag \
    && apt-get remove -y --purge unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f NSwag.zip

WORKDIR /app/
VOLUME /app/
ENTRYPOINT dotnet /opt/NSwag/NetCore21/dotnet-nswag.dll
CMD ["version"]
