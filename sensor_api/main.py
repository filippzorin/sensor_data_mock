from datetime import datetime
from random import gauss

from fastapi import FastAPI

app = FastAPI()


@app.get('/sensor_data')
async def root():
    params = {f'param_{i}': gauss(i + 1, 1) for i in range(10)}
    return {
        'sensor_id': "1337",
        'timestamp': datetime.now(),
        **params
    }
