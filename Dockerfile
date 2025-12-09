FROM python:3.13.11-alpine3.23

WORKDIR /app

# copy code
COPY src/ /app/


# #Install deps
RUN pip install --upgrade pip
RUN pip install pipenv
RUN pipenv install


EXPOSE 8080

# Start server
ENTRYPOINT [ "./entrypoint.sh" ]
