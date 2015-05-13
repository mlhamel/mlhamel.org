import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, "README.md")).read()

install_requires = [
    "bumpversion",
    "docopt",
    "htpasswd",
]

setup(
    name="mlhamel.org",
    version="0.0.1",
    description="mlhamel.org deployment tools",
    long_description=README + "\n\n",
    author="Mathieu Leduc-Hamel",
    author_email="mlhamel.org",
    url="http://mlhamel.org",
    packages=find_packages(),
    include_package_data=True,
    zip_safe=False,
    install_requires=install_requires,
    entry_points={
        "console_scripts": [
            "htpwdpy = mlhamel.org.scripts.htpasswd:main"
        ]})
