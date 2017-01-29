FROM alpine

RUN apk add --no-cache python python-dev py2-pip py-cairo git gcc musl-dev

RUN git clone https://github.com/graphite-project/whisper.git /usr/local/src/whisper
RUN cd /usr/local/src/whisper && git checkout master && python setup.py install

RUN git clone https://github.com/graphite-project/carbon.git /usr/local/src/carbon
RUN cd /usr/local/src/carbon && git checkout master && python setup.py install

RUN git clone https://github.com/graphite-project/graphite-web.git /usr/local/src/graphite-web
RUN cd /usr/local/src/graphite-web && git checkout master && python setup.py install

RUN pip install Twisted
RUN pip install django
RUN pip install django-tagging
RUN pip install pytz
RUN pip install pyparsing

ADD content/ /
