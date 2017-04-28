import gzip
import time
import requests

from cli_common.log import get_logger


logger = get_logger(__name__)


def upload(data):
    r = requests.post('https://coveralls.io/api/v1/jobs', files={
        'json_file': ('json_file', gzip.compress(data), 'gzip/json')
    })

    try:
        result = r.json()
        logger.info('Uploaded build to Coveralls: %s' % r.text)
    except ValueError:
        raise Exception('Failure to submit data. Response [%s]: %s' % (r.status_code, r.text))  # NOQA

    # Wait until the build has been injested by Coveralls.
    url = result['url'] + '.json'
    while True:
        r = requests.get(url)
        result = r.json()
        if result['covered_percent']:
            break
        time.sleep(60)
