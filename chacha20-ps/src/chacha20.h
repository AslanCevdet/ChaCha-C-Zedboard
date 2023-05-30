
#include "stdint.h"
#include "string.h"
#include <cstddef>
#include <string>
#include "iostream"
#include "xil_printf.h"
#include "xparameters.h"
#include "xuartps.h"

#define MAX_STRING_SIZE 196

class ChaCha20{

public:
	ChaCha20();

	void keySetup(const uint32_t* key,const uint32_t* nonce, uint32_t counter);
	void quarterRound(int ai, int bi, int ci, int di, uint32_t* block);
	void tenRoundsAndFinalAddition(uint32_t* block);
	void blockCreation();

	void keyStreamGeneration();
	void encrypt(uint8_t* plain_text, size_t len);
	void decrypt(uint8_t* cypher_text, size_t len);

	//utilites
	uint32_t bigEndianToLittleEndian(uint32_t bigEndianValue);
	uint32_t littleEndianToBigEndian(uint32_t littleEndianValue);
	void convertSentenceToBytes(const std::string &sentence, uint8_t *bytes, int &numBytes);
	void convertBytesToCharString(uint8_t* bytes, int numBytes);

	//prints
	void printEncrypted(uint8_t* cipher_text, int len);
	void printDecrypted(uint8_t* plain_text, int len);

	//scan
	void scan(char* buffer, uint32_t max_size);



private:
	uint8_t keystream1[64];
	uint8_t keystream2[64];
	uint32_t block1[16];
	uint32_t block2[16];
	uint32_t state[16];
	XUartPs Uart_PS;

};



