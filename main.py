# Author : Prav
# Objective : build a google cloud build CI/CD workflow
#             Don't aim for any app

from typing import Optional
from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "World - v_0.01"}
