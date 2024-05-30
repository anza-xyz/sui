use solana_sdk::pubkey::Pubkey;
use anyhow::Result;
use clap::Parser;

#[derive(clap::Parser)]
struct Args {
    #[clap(subcommand)]
    cmd: Command,
}

#[derive(clap::Subcommand)]
enum Command {
    Call(CallCommand),
}

#[derive(clap::Args)]
struct CallCommand {
    program_id: String,
    payer: String,
    function: String,
}

fn main() -> Result<()> {
    let args = Args::parse();

    match args.cmd {
        Command::Call(cmd) => {
            cmd.run()
        }
    }
}

impl CallCommand {
    fn run(&self) -> Result<()> {
        let recent_block_hash = {
            todo!()
        };
        let program_id = self.program_id.parse::<Pubkey>()?;
        let payer = self.program_id.parse::<Pubkey>()?;
        let message = move_to_solana::entry_codec::generate_move_call_message(
            program_id,
            &recent_block_hash,
            Some(&payer),
            &self.function,
            &[],
        )?;
    }
}

