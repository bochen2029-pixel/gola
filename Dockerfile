# ═══════════════════════════════════════════════════════════════════════════════
# GOLA v7.2 — Docker Container
# Security-hardened nginx serving static game files
# ═══════════════════════════════════════════════════════════════════════════════

FROM nginx:alpine

LABEL maintainer="bochen2079"
LABEL version="7.2"
LABEL description="GOLA - Game of Life Automation - OPO Simulation"

# ─────────────────────────────────────────────────────────────────────────────────
# SECURITY: Create non-root user
# ─────────────────────────────────────────────────────────────────────────────────
RUN addgroup -g 1001 -S gola && \
    adduser -S -D -H -u 1001 -h /var/cache/nginx -s /sbin/nologin -G gola gola

# ─────────────────────────────────────────────────────────────────────────────────
# SECURITY: Remove default nginx content
# ─────────────────────────────────────────────────────────────────────────────────
RUN rm -rf /usr/share/nginx/html/*

# ─────────────────────────────────────────────────────────────────────────────────
# COPY: Game files and nginx config
# ─────────────────────────────────────────────────────────────────────────────────
COPY frontend/index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf

# ─────────────────────────────────────────────────────────────────────────────────
# SECURITY: Set proper permissions (read-only game files)
# ─────────────────────────────────────────────────────────────────────────────────
RUN chown -R gola:gola /usr/share/nginx/html && \
    chown -R gola:gola /var/cache/nginx && \
    mkdir -p /var/run && \
    touch /var/run/nginx.pid && \
    chown -R gola:gola /var/run/nginx.pid && \
    chmod -R 555 /usr/share/nginx/html

# ─────────────────────────────────────────────────────────────────────────────────
# EXPOSE: Non-privileged port (8080 instead of 80)
# ─────────────────────────────────────────────────────────────────────────────────
EXPOSE 8080

# ─────────────────────────────────────────────────────────────────────────────────
# SECURITY: Run as non-root user
# ─────────────────────────────────────────────────────────────────────────────────
USER gola

# ─────────────────────────────────────────────────────────────────────────────────
# RUN: Start nginx
# ─────────────────────────────────────────────────────────────────────────────────
CMD ["nginx", "-g", "daemon off;"]
