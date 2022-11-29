# Project

# Ajax Datatable demo Rails 5

```
ruby: 2.7.1
rails: 5.2.4.4
```

## Install

### Clone the repository

```shell
git clone https://github.com/rksazid/Ajax-Datatable-demo-Rails-5.git
cd Ajax-Datatable-demo-Rails-5
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.7.1`

If not, install the right ruby version using [rbenv](https://gorails.com/setup/ubuntu/22.04) (it could take a while):

```shell
rbenv install 2.7.1
```

### Install dependencies

Using [Bundler](https://github.com/bundler/bundler)

```shell
bundle install
```

### Set environment variables

See [config/env.sample](https://github.com/rksazid/Ajax-Datatable-demo-Rails-5/blob/main/.env.sample) and copy the file with name `.env` and fill-up the required data

### Initialize the database

```shell
rails db:create db:migrate db:seed
```

## Serve

```shell
rails s
```
