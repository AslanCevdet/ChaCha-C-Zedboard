
#include "chacha20.h"
#include "xil_printf.h"




int main(){

	ChaCha20 ChaChaBlock;

	char buffer[MAX_STRING_SIZE];

	uint32_t key[8] = {0x00010203, 0x04050607, 0x08090a0b, 0x0c0d0e0f, 0x10111213, 0x14151617, 0x18191a1b, 0x1c1d1e1f};
	uint32_t nonce[3] = {0x00000000, 0x0000004a, 0x00000000};
	uint32_t counter[1] = {0x00000001};

	ChaChaBlock.keySetup(key, nonce, *counter); //çalýþýyor düzgün
	ChaChaBlock.blockCreation(); //1. ve 2. bloðu oluþtur.


	ChaChaBlock.scan(buffer, MAX_STRING_SIZE);

	uint8_t bytes[192];
	int numBytes;

	ChaChaBlock.convertSentenceToBytes(buffer, bytes, numBytes);
	ChaChaBlock.encrypt(bytes, numBytes);
	ChaChaBlock.printEncrypted(bytes, numBytes);
	ChaChaBlock.decrypt(bytes, numBytes);
	ChaChaBlock.convertBytesToCharString(bytes, numBytes);
	ChaChaBlock.printDecrypted(bytes, numBytes);

	return 0;


}









