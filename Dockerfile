FROM node:22.22.3-alpine AS base

ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable && corepack prepare pnpm@11.2.1 --activate
WORKDIR /app
COPY package.json ./pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile
