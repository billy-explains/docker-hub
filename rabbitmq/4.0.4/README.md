# Overview

A pre-configure [RabbitMQ](https://hub.docker.com/_/rabbitmq) to facilitate running multiples instances as a cluster

Just pull and run!

# Configuration

### rabbitmq.conf

    loopback_users.guest = false
    vm_memory_high_watermark.relative = 0.800
    listeners.tcp.default = 5672
    default_pass = Y3VjaG6gcm9ja3Mh42
    default_user = admin
    management.tcp.port = 15672
    disk_free_limit.relative = 2.0

⚠️ Beware! change your **default_pass** if you intent to use this on a QA or PROD environment ⚠️

### Out of the box users

This image injects two users at boot time that you can modify later using the RabbitMQ UI

| User        | Password     | Permissions       |
| ----------- | ------------ | ----------------- |
| b2b_user    | b2b_us3r!    | ".\*" ".\*" ".\*" |
| another_b2b | 4n0th3r_b2b! | ".\*" ".\*" ".\*" |
