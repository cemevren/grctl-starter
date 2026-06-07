from grctl.logging_config import get_logger
from grctl.models import Directive
from grctl.worker.context import Context
from grctl.worker.task import task
from grctl.workflow import Workflow

logger = get_logger(__name__)


hello = Workflow(workflow_type="Hello")


@task
async def call_greeting_api(name: str) -> str:
    logger.info(f"Calling greeting API for: {name}")
    return f"Hello, {name}!"


@task
async def call_farewell_api(name: str) -> str:
    logger.info(f"Calling farewell API for: {name}")
    return f"Goodbye, {name}!"


@hello.start()
async def start(ctx: Context, name: str) -> Directive:
    ctx.logger.info(f"Starting workflow for: {name}")
    ctx.store.put("name", name)

    greeting = await call_greeting_api(name)
    ctx.store.put("greeting", greeting)

    return ctx.next.step(farewell_step)


@hello.step()
async def farewell_step(ctx: Context) -> Directive:
    name = await ctx.store.get("name")
    greeting = await ctx.store.get("greeting")

    farewell = await call_farewell_api(name)

    message = f"{greeting} ... {farewell}"
    ctx.logger.info(f"Final message: {message}")

    return ctx.next.complete(message)
