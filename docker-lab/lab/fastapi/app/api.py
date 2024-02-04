import uvicorn
from fastapi import FastAPI
from starlette.middleware.cors import CORSMiddleware

def get_application():
    _app = FastAPI(
        title="FastAPI",
        description="Fast API",
        debug=False
    )

    _app.add_middleware(
        CORSMiddleware,
        allow_origins=["*"],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

    return _app

app = get_application()

@app.get("/")
async def root():
    return {"message": "Hello World"}

@app.get("/test")
async def test():
    return {"message": "Test"}

if __name__ == '__main__':
    
    print("Starting server...")
    print("Port:", 80)
    
    # For Development
    uvicorn.run(
        "api:app",
        host="0.0.0.0",
        port=80, #5100
        log_level="info",
        reload=True,
    )