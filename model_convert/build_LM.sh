set -e

pulsar2 llm_build --input_path ../SmolVLM-256M-Instruct --output_path ../SmolVLM-256M-Instruct-AX650 --kv_cache_len 1023 --hidden_state_type bf16 --prefill_len 128 --parallel 32 --chip AX650

bash tools/embed_process.sh  ../SmolVLM-256M-Instruct ../SmolVLM-256M-Instruct-AX650