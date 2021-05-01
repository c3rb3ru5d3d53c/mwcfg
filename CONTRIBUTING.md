# Malware Configuration Extraction Contributing Guidelines

**Step 1: Clone the Main Repository:**
```bash
git clone --recursive https://github.com/c3rb3ru5d3d53c/mwcfg.git
cd mwcfg/
```

**Step 2: Create Directory Structure:**
```text
.
├── citadel         # Module Name
│   ├── citadel.py  # Module Code
│   ├── citadel.yar # Module YARA Signature
│   ├── __init__.py # Module Init File (Includes citadel.py)
│   └── README.md   # Description of your Work
├── __init__.py
└── README.md
```

**Step 3: Write your Configuration Extractor**

Use YARA to get offsets of interest in the binary:
```yara
rule citadel : zeus{
    meta:
        author = "CERT.pl"
        module = "citadel"
    strings:
        $briankerbs = "Coded by BRIAN KREBS for personal use only. I love my job & wife."
        $cit_aes_xor = {81 30 [4] 0F B6 50 03 0F B6 78 02 81 70 04 [4] 81 70 08 [4] 81 70 0C [4] C1 E2 08 0B D7 }
        $cit_salt = { 8A D1 80 E2 07 C0 E9 03 47 83 FF 04 }
        $cit_login = { 30 [1-2] 8A 8? [4] 32  }
        $cit_getpes = { 68 [2] 00 00 8D ( 84 24 | 85) [4] 50 8D ( 85 ?? ?? ?? ?? | 44 24 ?? ) 50 E8 [4] B8 [2] 00 00 50 68 }
        $cit_base_off = { 5? 8D 85 [4] E8 [4] 6A 20 68 [4] 8D [2] 50 E8 [4] 8D 85 [4] 50 }
    condition:
        3 of them
}
```

Extract data from offsets obtained using the YARA signature:
```python
import logging

from malduck.extractor import Extractor

log = logging.getLogger(__name__)

__author__  = "CERT.pl"  # Your Username/Nick
__version__ = "1.0.0"    # Version Of the Configuration Extractor

class Citadel(Extractor):
    family = "citadel"      # Malware Family Name
    yara_rules = "citadel", # YARA Signature Name
    overrides = ["zeus"]

    @Extractor.extractor("briankerbs")
    def citadel_found(self, p, addr):
        log.debug('[+] `Coded by Brian Krebs` str @ %X' % addr)
        return {'family': 'citadel'}

    @Extractor.extractor
    def cit_salt(self, p, addr):
        salt = p.uint32v(addr - 8)
        log.debug('[+] Found salt @ %X - %x' % (addr, salt))
        return {'salt': salt}
```

**Step 4: Test Your Configuration Extractor**
```bash
./setup.py install
mwcfg --input tests/citadel/46d9a536783640be69cd247885571266 --debug
```
