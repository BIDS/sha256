from sha256 import sha256 as c_sha256, sha256rand
from hashlib import sha256
import time


print('Verifying integrity of hashes between Python and C SHA256:')

for i in range(1000):
    message = b"counter,%d" % i
    result0 = c_sha256(message)

    s = sha256()
    s.update(message)
    result1 = s.digest()

    assert result0 == result1
    print('.', end='')


N = 1*10**6
print(f'\n\nBenchmarking over {N} runs')

print('C library:', end='')
tic = time.time()
for i in range(N):
    message = b"counter,%d" % i
    h = c_sha256(message)
print('%.2fs' % (time.time() - tic))

print('Python library:', end='')
tic = time.time()
for i in range(N):
    message = b"counter,%d" % i
    s = sha256()
    s.update(message)
    h = s.digest()
print('%.2fs' % (time.time() - tic))

print('\nGenerating a random number:')
import codecs
print(codecs.encode(sha256rand(16), 'hex'))
