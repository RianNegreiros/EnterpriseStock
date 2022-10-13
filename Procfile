web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}
resque: QUEUE=* rake resque:work
release: bundle exec rails db:migrate