FROM node:16-alpine as runner
WORKDIR /usr/src/app
COPY . .
RUN yarn install --frozen-lockfile
ENV NODE_ENV production

EXPOSE 80
CMD ["yarn", "start"]