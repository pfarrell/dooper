# Dooper

Exposes some objects that allow simple interaction with S3, WebHcat, HDFS, and YARN

## Installation

    gem 'dooper'
    gem install dooper


## Environment vars
  We let this gem pull in credentials and metadata from environment variables

  * AMAZON_SECRET_ACCESS_KEY
  * AMAZON_ACCESS_KEY_ID
  * AWS_REGION
  * WEBHCAT_URL (defaults to localhost:50111)
  * WEBHCAT_USER
  * YARN_URL  (defaults to localhost:8088)
  * HDFS_HOST (defaults to localhost)
  * HDFS_PORT (defaults to 50070)

## Usage

TODO: Write usage instructions here

## References

* [S3 v2 API](https://github.com/aws/aws-sdk-core-ruby)
* [WebHDFS REST API](https://hadoop.apache.org/docs/current/hadoop-project-dist/hadoop-hdfs/WebHDFS.html)
* [WebHCat REST API](https://cwiki.apache.org/confluence/display/Hive/WebHCat)
* [YARN REST API](https://hadoop.apache.org/docs/current/hadoop-yarn/hadoop-yarn-site/WebServicesIntro.html)


