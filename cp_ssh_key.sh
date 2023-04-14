#!/bin/bash
docker cp batch-container:/home/testuser/.ssh/id_rsa.pub ./id_rsa.pub.batch && \
	docker cp ./id_rsa.pub.batch host-container:/home/testuser/.ssh/authorized_keys && \
	docker exec -it host-container sh -c 'chmod 600 /home/testuser/.ssh/authorized_keys && chown testuser:testuser /home/testuser/.ssh/authorized_keys' && \
	rm ./id_rsa.pub.batch
