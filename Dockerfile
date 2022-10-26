FROM node:16-alpine as dependencies
WORKDIR /usr/src/app
COPY package.json yarn.lock ./
RUN yarn install --frozen-lockfile

FROM node:16-alpine as runner
WORKDIR /usr/src/app
ENV NODE_ENV production
COPY --from=dependencies /usr/src/app/node_modules ./node_modules
COPY --from=dependencies /usr/src/app/package.json ./package.json

EXPOSE 8000
CMD ["yarn", "start"]