A Serverless URL Shortener in Ruby
==================================

This is just a tinker project for right now...an excuse to play with some serverless AWS with
Ruby.

You'll need to configure serverless to make this work with your own AWS environment. At the very
least, this means doing `npm install -g serverless` and running `serverless config credentials`.

Deploying to AWS can be done with `yarn deploy`.

Once you've deployed it once (to set up the DynamoDB tables), you can run the Rack app locally
by running `yarn start`. This will use the remote DynamoDB tables, but will run the code itself
off localhost:5000.

If you want to remove the stack from AWS, you can run `yarn destroy-environment`. This will wipe
the DynamoDB tables as well, though, so be prepared to lose any data!!!


