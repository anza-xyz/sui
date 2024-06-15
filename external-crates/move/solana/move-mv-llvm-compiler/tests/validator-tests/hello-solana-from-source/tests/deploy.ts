import { describe } from 'node:test';
import { assert } from 'chai';
import {deployProgramShell, parseProgramID} from './validator_utils';

describe("deploy-solana", async () => {
  const programPath = 'build/solana/hello.so';
  const programIdLog = await deployProgramShell(programPath);
  const programId = parseProgramID(programIdLog);
  it("Deploy hello!", async () => {
    if (programId) {
      assert(programId.length == 45);
      console.log('Program deployed with', programId);
      return 0;
    }
    return -1;
  });
});
