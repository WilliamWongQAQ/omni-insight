FROM python:3.8.12 as BUILDER
LABEL maintainer="ZhengZhenyu<zheng.zhenyu@openeuler.sh>"
WORKDIR /omni-insight
COPY . /omni-insight
RUN pip3 install -r requirements.txt && python3 setup.py install bdist_wheel

FROM openeuler/openeuler:21.09
WORKDIR /omni-imager
COPY --chown=root --from=BUILDER /omni-insight/dist/ .
COPY --chown=root ./etc/ /etc/
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm get-pip.py && pip3 install *

ENTRYPOINT ["omni-insight"]
