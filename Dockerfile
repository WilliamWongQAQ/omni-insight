FROM python:3.8.12 as BUILDER
LABEL maintainer="ZhengZhenyu<zheng.zhenyu@openeuler.sh>"
WORKDIR /omni-insight
COPY . /omni-insight
RUN pip3 install -r requirements.txt && python3 setup.py install bdist_wheel

FROM openeuler/openeuler:21.09
WORKDIR /omni-insight
COPY config/openEuler.repo /etc/yum.repos.d/openEuler.repo
COPY --chown=root --from=BUILDER /omni-insight/dist/ .
RUN yum -y update && yum -y install gcc python3-devel git
RUN curl -L https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python3 get-pip.py && rm -rf get-pip.py && pip3 install * && pip3 install uwsgi
# TODO: Remove me when pip install omni-insight is fully work
COPY --chown=root ./etc/ /etc/omni-insight/

ENTRYPOINT ["uwsgi", "--ini", "/etc/omni-insight/insight.ini"]
