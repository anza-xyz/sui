## This is a hello world style example

The test
- Builds the .move files in this project to create a binary in `build` directory
- Deploys a program `build/hello.so` to a running validator
- Invokes the program using a client app
- Checks that the output matches expected output.

Prerequisites:
- Run `yarn install`
- Sufficient account balance in your `~/.config/solana/id.json` account
- A running local validator

To run this test
- Start a local solana validator.
- Run `yarn build` to build move program.
- Run `yarn test` from this directory to deploy and test the program.
- Run `yarn deploy` to deploy the program. Note that `yarn test` deploys program separately regardless of `yarn deploy`.

