import uvicorn
from fastapi import FastAPI, Request

import config

def create_app():
    api_settings = config.get_api_settings()
    app = FastAPI(
        name=api_settings.name,
        host=api_settings.host,
        port=api_settings.port,
        debug=api_settings.debug,
        root_path="/api"
    )

    return app

app = create_app()

@app.get("/")
def read_root(request: Request):
    return {"message": "Hello World", "root_path": request.scope.get("root_path")}


if __name__ == "__main__":
    print("test")
    api_settings = config.get_api_settings()
    print(api_settings)
    uvicorn.run(
        "main:app", 
        host=api_settings.host, 
        port=api_settings.port, 
        reload=True
    )