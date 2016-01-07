FROM python:2.7

MAINTAINER Cássio Botaro <cassiobotaro@gmail.com>

ADD . /my_app
ADD supervisord.conf /etc/supervisor/conf.d/my_app.conf

WORKDIR /my_app

RUN pip install supervisor gunicorn
RUN pip install -r requirements.txt

RUN mkdir logs
RUN touch logs/supervisor.log

EXPOSE 8000

CMD ["supervisord"]
