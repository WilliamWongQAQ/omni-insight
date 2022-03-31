# openEuler Insight
A python script to parse all rpm information from openEuler community

## Usage
Dependencies: 
- openEuler distro
- A MySQL DB backend to connect to
- Python runtime: `Python 3.9+`
- rpm packages: `dnf` `dnf-plugins-core` `gcc` `python3-devel`
- pypi packages: check `requirements.txt`
- pypi packages for API server: `uwsgi`

Install：

1. From source:
```shell
git clone https://github.com/omnibuildplatform/omni-insight.git
cd omni-insight && pip install -r requirements.txt
python3 setup.py install
```

2. Using pip(currently you should download the release manually):
```shell
wget https://github.com/omnibuildplatform/omni-insight/releases/download/v0.1.1/omniinsight-0.1.1.tar.gz
pip3 install --prefix / ./omniinsight-0.1.1.tar.gz
```

3. Modify the config file in `/etc/omni-insight/conf.yaml` to match your environment.

4. To start the API server:
```shell
uwsgi --ini /etc/omni-insight/insight.ini
```

4. To run the cli:
```shell
omni-insight --help
```

## TODO list



## Contribute

Welcome to file issues or bugs at:
https://github.com/omnibuildplatform/omni-insight/issues