FROM python:3.18


# Install the application dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./ ./
EXPOSE 5000

ENV CELERY_BROKER_URL=$CELERY_BROKER_URL

RUN useradd app
USER app

CMD ["celery -A prj worker --beat --loglevel=info"]
