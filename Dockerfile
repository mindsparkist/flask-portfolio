FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt ./

# Install dependencies (Gunicorn will be installed here if added to requirements.txt)
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

EXPOSE 5000

# Start the app using Gunicorn instead of the dev server
# --workers 4 allows it to handle multiple requests simultaneously
# "app:app" tells Gunicorn to look in app.py for the Flask instance named 'app'
CMD ["gunicorn", "--workers", "4", "--bind", "0.0.0.0:5000", "app:app"]