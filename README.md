BuffaloBot
===

Simple Slack bot used in development to emit fresh migration numbers for database operations.

Robot's brain is on a persistent Redis instance.

# Usage
Ready to run inside a container. Dockerfile is complete. Set `HUBOT_SLACK_TOKEN=` to a specific token and `REDIS_URL` to a your Redis URL in the `Dockerfile` or in a `docker-compose.yml`.
