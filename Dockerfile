# -------- Stage 1: Build --------
FROM python:3.11-alpine AS builder

WORKDIR /app

# Install dependencies in a clean layer
COPY requirements.txt .
RUN pip install --no-cache-dir --user -r requirements.txt

# -------- Stage 2: Runtime --------
FROM python:3.11-alpine

# Create non-root user and clean up
RUN addgroup -S appgroup && adduser -S appuser -G appgroup && \
    apk add --no-cache bash && \
    rm -rf /var/cache/apk/*

WORKDIR /app

# Copy only required files from builder
COPY --from=builder /root/.local /home/appuser/.local
COPY app ./app

# Set permissions
RUN chown -R appuser:appgroup /app /home/appuser/.local

# Switch to non-root user
USER appuser

# Ensure local bin is in PATH
ENV PATH=/home/appuser/.local/bin:$PATH
ENV PYTHONPATH=/home/appuser/.local/lib/python3.11/site-packages

# Expose application port
EXPOSE 8080

# Run the application
CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "8080"]