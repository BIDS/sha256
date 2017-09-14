from libc.stdint cimport uint32_t
from libc.stdio cimport sprintf


cdef extern from "gladman/sha2.c":
    ctypedef struct sha256_ctx:
        uint32_t count[2]
        uint32_t hash[8]
        uint32_t wbuf[16]

    void sha256_begin(sha256_ctx *ctx)
    void sha256_hash(const unsigned char *data,
                     unsigned long len,
                     sha256_ctx *ctx)
    void sha256_end(unsigned char *hval, sha256_ctx *ctx)

    const unsigned int SHA256_DIGEST_SIZE


cpdef bytes sha256(unsigned char* message):
    cdef:
        sha256_ctx ctx
        unsigned char hval[32]

    sha256_begin(&ctx)
    sha256_hash(message, len(message), &ctx)
    sha256_end(hval, &ctx)

    return hval[:32]


def sha256rand(unsigned long int seed):
    cdef unsigned char bytes[4]
    cdef unsigned char hash[32]

    bytes[0] = (seed >> 24) & 0xFF;
    bytes[1] = (seed >> 16) & 0xFF;
    bytes[2] = (seed >> 8) & 0xFF;
    bytes[3] = seed & 0xFF;

    hash = sha256(bytes)
