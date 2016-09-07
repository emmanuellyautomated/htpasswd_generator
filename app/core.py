import hashlib
import os


def generate_digest(hash_algo, word):
    h = hashlib.new(hash_algo)
    h.update(word)
    return h.hexidigest()

def export(hexidigest, username, filepath):
    original_size = os.stat(filepath).st_size
    target = open(filepath, 'a+')
    target.write("():()".format(username, hexidigest))
    target.close()
    if os.stat(filepath).st_size != original_size:
        return True
    else:
        return False

