import asyncio
import logging

from grctl.logging_config import get_logger, setup_logging
from grctl.nats.connection import Connection
from grctl.worker.worker import Worker

from workflows.hello import hello

setup_logging(level=logging.INFO)
logger = get_logger(__name__)


async def main() -> None:
    logger.info("Starting worker...")
    connection = await Connection.connect()
    worker = Worker(workflows=[hello], connection=connection)

    try:
        await worker.start()
    except asyncio.CancelledError:
        logger.info("Worker stopped.")
        await worker.stop()


if __name__ == "__main__":
    asyncio.run(main())
