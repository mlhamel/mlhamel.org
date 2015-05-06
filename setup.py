import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, "README.md")).read()
CHANGES = open(os.path.join(here, "CHANGES.txt")).read()

setup(
    name="mlhamel.org",
    version="0.0.1",
    description="mlhamel.org deployment tools",
    long_description=README + "\n\n" + CHANGES,
    author="Mathieu Leduc-Hamel",
    author_email="mlhamel.org",
    url="http://mlhamel.org",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=[],
    entry_points="""\
        [console_scripts]
        boxberry-db = boxberry.scripts.db_manage:main
        [paste.app_factory]
        main = boxberry:main
    """)
