FROM python:3.14.0a3-alpine3.21


# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./
EXPOSE 5000

ENV CELERY_BROKER_URL=$CELERY_BROKER_URL

RUN echo $CELERY_BROKER_URL

CMD ["celery -A prj worker --beat --loglevel=info"]
