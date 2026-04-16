import asyncio
import logging
from datetime import timedelta

import ulid
from grctl.client import Client, Connection, get_logger, setup_logging

from workflows.hello import hello

setup_logging(level=logging.INFO)
logger = get_logger(__name__)


async def main() -> None:
    connection = await Connection.connect()
    client = Client(connection=connection)

    result = await client.run_workflow(
        workflow_type=hello.workflow_type,
        workflow_id=str(ulid.ULID()),
        workflow_input={"name": "World"},
        workflow_timeout=timedelta(seconds=30),
    )
    logger.info(f"Workflow result: {result}")
    await connection.close()


if __name__ == "__main__":
    asyncio.run(main())
