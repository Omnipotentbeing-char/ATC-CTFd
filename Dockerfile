FROM ctfd/ctfd:latest

RUN pip install psycopg2-binary

ENV WORKERS=1
ENV LOG_FOLDER=/opt/CTFd/logs
CMD echo $DATABASE_URL && gunicorn "CTFd:create_app()" --bind 0.0.0.0:${PORT:-8000}

CMD gunicorn "CTFd:create_app()" \
    --bind 0.0.0.0:${PORT:-8000} \
    --workers 1 \
    --threads 4
