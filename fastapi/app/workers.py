from uvicorn.workers import UvicornWorker

class ConfigurableWorker(UvicornWorker):
    """
    Define a UvicornWorker that can be configured by modifying its class attribute.

    All of the command line options for uvicorn are potential configuration options
    (see https://www.uvicorn.org/settings/ for the complete list).

    """

    #: dict: Set the equivalent of uvicorn command line options as keys.
    CONFIG_KWARGS = {
        "root_path": "/api",
        "proxy_headers": True,
    }