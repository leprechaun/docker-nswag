FROM mcr.microsoft.com/dotnet/core/sdk:2.2

ENV NSWAG_BUILD="1082"

RUN curl -O -L https://github.com/RicoSuter/NSwag/releases/download/NSwag-Build-${NSWAG_BUILD}/NSwag.zip \
    && apt-get update \
    && apt-get install -y --no-install-recommends unzip \
    && unzip -q ./NSwag.zip -d NSwag \
    && apt-get remove -y --purge unzip \
    && rm -rf /var/lib/apt/lists/* \
    && rm -f NSwag.zip

ENTRYPOINT dotnet NSwag/NetCore22/dotnet-nswag.dll
CMD ["version"]
