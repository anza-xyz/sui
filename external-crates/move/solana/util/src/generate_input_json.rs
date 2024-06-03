#[cfg(test)]
use binascii::{b32encode, b32decode};

use clap::Parser;

#[derive(Debug, Parser)]
#[clap(author, version, about)]
pub struct Args {
    /// Entry function name
    #[clap(short = 'f', long = "func-name")]
    pub entry_function_name: String,
    // Remaining arguments that we want to serialize as bytes
    #[clap(short = 's', long = "args", default_value = "")]
    pub argstring: String,
}

fn print_as_bytes(data : &str) -> Vec<u8> {
    let length = data.len();
    let input = &data[..length].as_bytes();
    input.to_vec()
}

#[test]
fn test_encode_decode() {
    let data : &str = "counter__owner";
    let input = &data[..data.len()].as_bytes();
    let mut output = [0u8; 500];
    let mut dec_out = [0u8; 200];
    let encoded_output = b32encode(&input, &mut output).ok().unwrap();
    let decoded_output = b32decode(&encoded_output, &mut dec_out).ok().unwrap();
    assert_eq!(input, &decoded_output);
}

#[test]
fn test_print_as_bytes() {
    const ENCODED_DATA : [u8; 11] = [104, 101, 108, 108, 111, 95, 95, 109, 97, 105, 110];
    let b = print_as_bytes("hello__main");
    assert_eq!(b.len(), ENCODED_DATA.len());
    assert_eq!(&ENCODED_DATA, &b[..ENCODED_DATA.len()]);
}

pub fn main() {
    let args = Args::parse();
    let mut b = print_as_bytes(args.entry_function_name.as_str());
    let mut blen = b.len().to_le_bytes().to_vec();
    println!("As bytes: {:?}", b.clone());
    println!("len: {:?}", blen.clone());
    blen.append(&mut b);
    println!("\"instruction_data\": {:?}", blen);
}
