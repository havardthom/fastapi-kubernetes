from functools import lru_cache
from pydantic import BaseSettings


class APISettings(BaseSettings):
    class Config:
        env_prefix = 'api_'
        env_file = '.env'
        env_file_encoding = 'utf-8'

    name: str = "Fast API"
    host: str = "0.0.0.0"
    port: int = 80
    debug: bool = False


@lru_cache()
def get_api_settings():
    return APISettings()