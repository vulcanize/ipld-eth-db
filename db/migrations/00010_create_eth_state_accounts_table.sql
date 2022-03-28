-- +goose Up
CREATE TABLE IF NOT EXISTS eth.state_accounts (
    block_number          BIGINT NOT NULL,
    header_id             VARCHAR(66) NOT NULL,
    state_path            BYTEA NOT NULL,
    balance               NUMERIC NOT NULL,
    nonce                 BIGINT NOT NULL,
    code_hash             BYTEA NOT NULL,
    storage_root          VARCHAR(66) NOT NULL,
    FOREIGN KEY (state_path, header_id) REFERENCES eth.state_cids (state_path, header_id) ON DELETE CASCADE DEFERRABLE INITIALLY DEFERRED,
    PRIMARY KEY (state_path, header_id)
);

-- +goose Down
DROP TABLE eth.state_accounts;
