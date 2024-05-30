use anyhow::Result;
use solana_sdk::message::Message;
use solana_sdk::hash::Hash;
use solana_sdk::pubkey::Pubkey;
use solana_sdk::instruction::Instruction;
use move_core_types::annotated_value::MoveValue;

pub fn generate_move_call_message(
    program_id: Pubkey,
    recent_block_hash: &Hash,
    payer: Option<&Pubkey>,
    entry_fn_name: &str,
    args: &[MoveValue],
) -> Result<Message> {
    let insn_data = encode_instruction_data(
        entry_fn_name,
        args,
    )?;

    let insn = Instruction::new_with_bytes(
        program_id,
        &insn_data,
        vec![],
    );

    let msg = Message::new_with_blockhash(
        &[insn],
        payer,
        recent_block_hash,
    );

    Ok(msg)
}

fn encode_instruction_data(
    entry_fn_name: &str,
    args: &[MoveValue],
) -> Result<Vec<u8>> {
    let mut insn_data: Vec<u8> = vec![];

    // Encode the data in borsch or bincode format.

    // First encode the entry function name
    {
        let entry_fn_len: u64 = entry_fn_name.len() as u64;
        insn_data.extend(&entry_fn_len.to_le_bytes());
        insn_data.extend(entry_fn_name.as_bytes());
    }

    // encode remaining args of the function
    if !args.is_empty() {
        let arglen = args.len() as u64;
        insn_data.extend(&arglen.to_le_bytes());
        for a in args {
            // serialize each move value.
            // TODO: sui-graphql-rpc/src/types/move_value.rs has more
            // advanced serialization methods to convert to json etc.
            let argstring = match a.simple_serialize() {
                Some(bytes) => bytes,
                None => panic!("Error"),
            };
            insn_data.extend(std::str::from_utf8(&argstring)?.as_bytes());
        }
    }
    // todo

    Ok(insn_data)
}
