FROM python:3.11-slim as builder

# Stage 1: Create virtual environment and install dependencies
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# ---- Production Stage ----
FROM python:3.11-slim

# Copy virtual env from builder
COPY --from=builder /opt/venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

WORKDIR /app
COPY app.py .

# Gunicorn config
ENV PORT=5000
ENV WORKERS=4  
ENV TIMEOUT=120
ENV LOG_LEVEL=info

EXPOSE 5001
# Use this CMD instead for JSON format (hardcoded values)
CMD ["gunicorn", "--bind", "0.0.0.0:5001", "--workers", "4", "--timeout", "120", "app:app"]