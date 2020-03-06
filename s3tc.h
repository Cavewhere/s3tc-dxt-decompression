#ifndef S3TC_H
#define S3TC_H

#if defined(S3TC_LIB)
#  define S3TC_LIB_EXPORT __declspec(dllexport)
#else
#  define S3TC_LIB_EXPORT __declspec(dllimport)
#endif


namespace s3tc {

S3TC_LIB_EXPORT unsigned int PackRGBA(unsigned char r, unsigned char g, unsigned char b, unsigned char a);
S3TC_LIB_EXPORT void DecompressBlockDXT1(unsigned int x, unsigned int y, unsigned int width, const unsigned char *blockStorage, unsigned int *image);
S3TC_LIB_EXPORT void BlockDecompressImageDXT1(unsigned int width, unsigned int height, const unsigned char *blockStorage, unsigned int *image);
S3TC_LIB_EXPORT void DecompressBlockDXT5(unsigned int x, unsigned int y, unsigned int width, const unsigned char *blockStorage, unsigned int *image);
S3TC_LIB_EXPORT void BlockDecompressImageDXT5(unsigned int width, unsigned int height, const unsigned char *blockStorage, unsigned int *image);

}

#endif // S3TC_H
