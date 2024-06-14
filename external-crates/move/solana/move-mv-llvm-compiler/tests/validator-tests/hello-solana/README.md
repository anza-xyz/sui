## This is a hello world style example

The test
- Deploys a program `bin/hello_solana_move_program.so` to a running validator
- Invokes the program using a client app
- Checks that the output matches expected output.

Prerequisites:
- Run `yarn install`
- Sufficient account balance in your `~/.config/solana/id.json` account
- A running local validator

To run this test
- Start a local solana validator.
- Run `yarn test` from this directory.

