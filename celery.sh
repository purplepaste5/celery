#!/bin/sh -ex

celery -A tasks worker --beat --loglevel=info