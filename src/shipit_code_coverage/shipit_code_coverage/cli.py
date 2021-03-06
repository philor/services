import click

from shipit_code_coverage import codecov


@click.command()
@click.option('--secrets', required=True, help='Taskcluster Secrets path')
@click.option('--client-id', help='Taskcluster Client ID')
@click.option('--client-token', help='Taskcluster Client token')
def main(secrets, client_id, client_token):
    codecov.go(secrets, client_id, client_token)


if __name__ == '__main__':
    main()
