# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.8-slim-buster
# FROM continuumio/anaconda3

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# Install pip requirements
COPY requirements.txt .
RUN python -m pip install -r requirements.txt

WORKDIR /app

EXPOSE 8000

COPY . /app

# Creates a non-root user and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN useradd appuser && chown -R appuser /app
USER appuser

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]

ENTRYPOINT ["python","docker"]

# docker build --tag sentiment .
# docker images
# docker run -p 5000:5000 -t -i sentiment
# docker run --publish 5000:5000 sentiment
# curl localhost:5000/I hate you

# docker run -d -p 5000:5000 sentiment
# curl localhost:5000/I hate you
# docker save python-docker > C:\Users\61433\Documents\TextClassification\sentiment.tar
# docker load < C:\Users\61433\Documents\TextClassification\sentiment.tar