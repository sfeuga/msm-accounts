FROM ruby:2.7.2-alpine

RUN apk update
RUN apk --no-cache add sudo alpine-sdk

# Add msm user to sudo group
RUN adduser -D --shell /bin/bash msm
RUN echo '%msm ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN mkdir -p /home/msm/app /home/msm/bundle

WORKDIR /home/msm/app

COPY . /home/msm/app/

# Give access to msm user
RUN chown -hR msm:msm /home/msm/app /home/msm/bundle

USER msm

RUN bundle config set clean 'true'
RUN bundle config set path '/bundle'
RUN bundle install --jobs=10

# unicorn
EXPOSE 3000
ENV PORT 3000

CMD ["bundle", "exec", "foreman", "start"]
