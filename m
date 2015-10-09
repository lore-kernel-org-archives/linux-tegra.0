From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v4 0/5] Add RSA signing support
Date: Fri, 9 Oct 2015 14:20:41 -0700
Message-ID: <1444425646-20380-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

V4:
1. Replace constant definition with soc specific supported function
   get_value_size() to obtain a field size.
2. Add byte order swapping function to support tegra rsa related fields
   byte order requirements.
3. Use one simplified sample script to demonstrate how to do rsa signing
   for T210 boot image.

V3: 
1. Address issues found in v2. 
2. Use keyword "RehashBl" instead of "ReSignBl" to re-generate AES hash
   for bootloader (and bct).
3. Add sample scripts to do rsa signing for T210 bootimage.

V2:
1. Split CL1 into two patches.

2. Use openssl utility to generate signature and save to file. Then use
   --update option to load in signature files to update rsa-pss signature
   fields in bct. So, all rsa-pss signing functions and files are removed.

3. Use keyword "ReSignBl" to re-generate AES hash for bootloader (and bct).

V1:
For security fused tegra chip, BR requires to verify rsa_pss_sig before
jumping to next level of boot loader.

The patches here are adding rsa_pss_sig related functions, such as updating
signatures and pubkey, generating signatures on boot loader and bct, and
generating signature on any given binary file.


Jimmy Zhang (5):
  Add support for update pubkey and rsa-pss signatures
  Add support to dump rsa related fields for t210
  Add new configuration keyword "RehashBl"
  Add a sample script to do rsa signing for T210 bootimage
  Bump to version 1.6

 configure.ac             |  2 +-
 rehash.cfg               |  1 +
 rsa_priv.pem             | 27 ++++++++++++++++++
 samples/sign.sh          | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
 src/bct_dump.c           | 39 ++++++++++++++++++++++++++
 src/cbootimage.h         |  1 +
 src/crypto.c             | 54 +++++++++++++++++++++++++++++++++++
 src/crypto.h             | 12 ++++++++
 src/data_layout.c        | 51 +++++++++++++++++++++++++++++++++
 src/data_layout.h        |  2 ++
 src/parse.c              | 44 +++++++++++++++++++++++++++++
 src/parse.h              | 16 +++++++++++
 src/set.c                | 49 ++++++++++++++++++++++++++++++++
 src/set.h                |  5 ++++
 src/t210/nvbctlib_t210.c | 71 +++++++++++++++++++++++++++++++++++++++++++++-
 15 files changed, 445 insertions(+), 2 deletions(-)
 create mode 100644 rehash.cfg
 create mode 100644 rsa_priv.pem
 create mode 100755 samples/sign.sh

-- 
1.8.1.5
