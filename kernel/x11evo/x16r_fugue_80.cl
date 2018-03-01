
// fugue
  {
    sph_u32 *mixtab0 = AES0, *mixtab1 = AES1, *mixtab2 = AES2, *mixtab3 = AES3;
    sph_u32 S00 = 0, S01 = 0, S02 = 0, S03 = 0, S04 = 0, S05 = 0, S06 = 0, S07 = 0, S08 = 0, S09 = 0; \
    sph_u32 S10 = 0, S11 = 0, S12 = 0, S13 = 0, S14 = 0, S15 = 0, S16 = 0, S17 = 0, S18 = 0, S19 = 0; \
    sph_u32 S20 = 0, S21 = 0, S22 = IV256[0], S23 = IV256[1], S24 = IV256[2], S25 = IV256[3], S26 = IV256[4], S27 = IV256[5], S28 = IV256[6], S29 = IV256[7];

    FUGUE256_5(DEC32BE(block + 0x0), DEC32BE(block + 0x4), DEC32BE(block + 0x8), DEC32BE(block + 0xc), DEC32BE(block + 0x10));
    FUGUE256_5(DEC32BE(block + 0x14), DEC32BE(block + 0x18), DEC32BE(block + 0x1c), DEC32BE(block + 0x20), DEC32BE(block + 0x24));
    FUGUE256_5(DEC32BE(block + 0x28), DEC32BE(block + 0x2c), DEC32BE(block + 0x30), DEC32BE(block + 0x34), DEC32BE(block + 0x38));
    FUGUE256_4(DEC32BE(block + 0x3c), DEC32BE(block + 0x40), DEC32BE(block + 0x44), DEC32BE(block + 0x48));

    TIX2(SWAP4(gid), S06, S07, S14, S16, S00);
    CMIX30(S03, S04, S05, S07, S08, S09, S18, S19, S20);
    SMIX(S03, S04, S05, S06);
    CMIX30(S00, S01, S02, S04, S05, S06, S15, S16, S17);
    SMIX(S00, S01, S02, S03);

    TIX2(0, S00, S01, S08, S10, S24);
    CMIX30(S27, S28, S29, S01, S02, S03, S12, S13, S14);
    SMIX(S27, S28, S29, S00);
    CMIX30(S24, S25, S26, S28, S29, S00, S09, S10, S11);
    SMIX(S24, S25, S26, S27);

    TIX2(0x280, S24, S25, S02, S04, S18);
    CMIX30(S21, S22, S23, S25, S26, S27, S06, S07, S08);
    SMIX(S21, S22, S23, S24);
    CMIX30(S18, S19, S20, S22, S23, S24, S03, S04, S05);
    SMIX(S18, S19, S20, S21);

    CMIX30(S15, S16, S17, S19, S20, S21, S00, S01, S02);
    SMIX(S15, S16, S17, S18);
    CMIX30(S12, S13, S14, S16, S17, S18, S27, S28, S29);
    SMIX(S12, S13, S14, S15);
    CMIX30(S09, S10, S11, S13, S14, S15, S24, S25, S26);
    SMIX(S09, S10, S11, S12);
    CMIX30(S06, S07, S08, S10, S11, S12, S21, S22, S23);
    SMIX(S06, S07, S08, S09);
    CMIX30(S03, S04, S05, S07, S08, S09, S18, S19, S20);
    SMIX(S03, S04, S05, S06);
    CMIX30(S00, S01, S02, S04, S05, S06, S15, S16, S17);
    SMIX(S00, S01, S02, S03);
    CMIX30(S27, S28, S29, S01, S02, S03, S12, S13, S14);
    SMIX(S27, S28, S29, S00);
    CMIX30(S24, S25, S26, S28, S29, S00, S09, S10, S11);
    SMIX(S24, S25, S26, S27);
    CMIX30(S21, S22, S23, S25, S26, S27, S06, S07, S08);
    SMIX(S21, S22, S23, S24);
    CMIX30(S18, S19, S20, S22, S23, S24, S03, S04, S05);
    SMIX(S18, S19, S20, S21);
    S22 ^= S18;
    S03 ^= S18;
    SMIX(S03, S04, S05, S06);
    S07 ^= S03;
    S19 ^= S03;
    SMIX(S19, S20, S21, S22);
    S23 ^= S19;
    S04 ^= S19;
    SMIX(S04, S05, S06, S07);
    S08 ^= S04;
    S20 ^= S04;
    SMIX(S20, S21, S22, S23);
    S24 ^= S20;
    S05 ^= S20;
    SMIX(S05, S06, S07, S08);
    S09 ^= S05;
    S21 ^= S05;
    SMIX(S21, S22, S23, S24);
    S25 ^= S21;
    S06 ^= S21;
    SMIX(S06, S07, S08, S09);
    S10 ^= S06;
    S22 ^= S06;
    SMIX(S22, S23, S24, S25);
    S26 ^= S22;
    S07 ^= S22;
    SMIX(S07, S08, S09, S10);
    S11 ^= S07;
    S23 ^= S07;
    SMIX(S23, S24, S25, S26);
    S27 ^= S23;
    S08 ^= S23;
    SMIX(S08, S09, S10, S11);
    S12 ^= S08;
    S24 ^= S08;
    SMIX(S24, S25, S26, S27);
    S28 ^= S24;
    S09 ^= S24;
    SMIX(S09, S10, S11, S12);
    S13 ^= S09;
    S25 ^= S09;
    SMIX(S25, S26, S27, S28);
    S29 ^= S25;
    S10 ^= S25;
    SMIX(S10, S11, S12, S13);
    S14 ^= S10;
    S26 ^= S10;
    SMIX(S26, S27, S28, S29);
    S00 ^= S26;
    S11 ^= S26;
    SMIX(S11, S12, S13, S14);
    S15 ^= S11;
    S27 ^= S11;
    SMIX(S27, S28, S29, S00);
    S01 ^= S27;
    S12 ^= S27;
    SMIX(S12, S13, S14, S15);
    S16 ^= S12;
    S28 ^= S12;
    SMIX(S28, S29, S00, S01);
    S02 ^= S28;
    S13 ^= S28;
    SMIX(S13, S14, S15, S16);
    S17 ^= S13;
    S29 ^= S13;
    SMIX(S29, S00, S01, S02);
    S03 ^= S29;
    S14 ^= S29;
    SMIX(S14, S15, S16, S17);
    S18 ^= S14;
    S00 ^= S14;
    SMIX(S00, S01, S02, S03);
    S04 ^= S00;
    S15 ^= S00;
    SMIX(S15, S16, S17, S18);
    S19 ^= S15;
    S01 ^= S15;
    SMIX(S01, S02, S03, S04);

    S05 ^= S01;
    S16 ^= S01;

    // bool result = ((((sph_u64) SWAP4(S19) << 32) | SWAP4(S18)) <= target);
    // if (result)
    // output[output[0xFF]++] = SWAP4(gid);

    hash->h4[0] = SWAP4(S01);
    hash->h4[1] = SWAP4(S02);
    hash->h4[2] = SWAP4(S03);
    hash->h4[3] = SWAP4(S04);
    hash->h4[4] = SWAP4(S09);
    hash->h4[5] = SWAP4(S10);
    hash->h4[6] = SWAP4(S11);
    hash->h4[7] = SWAP4(S12);
    hash->h4[8] = SWAP4(S18);
    hash->h4[9] = SWAP4(S19);
    hash->h4[10] = SWAP4(S20);
    hash->h4[11] = SWAP4(S21);
    hash->h4[12] = SWAP4(S27);
    hash->h4[13] = SWAP4(S28);
    hash->h4[14] = SWAP4(S29);
    hash->h4[15] = SWAP4(S30);
  }