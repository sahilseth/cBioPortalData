FROM continuumio/miniconda3

WORKDIR /app

# Create the environment:
COPY environment.yml .
RUN conda env update -n base --file environment.yml

# Make RUN commands use the new environment:
# SHELL ["conda", "run", "-n", "cbioportaldata", "/bin/bash", "-c"]

COPY DESCRIPTION /app
COPY NAMESPACE /app
COPY R /app/R
COPY data /app/data
COPY data-raw /app/data-raw
COPY inst /app/inst
COPY man /app/man
COPY scripts /app/scripts
COPY tests /app/tests
COPY vignettes /app/vignettes

RUN ./scripts/installdev.sh

