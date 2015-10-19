From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v6 0/5] Add RSA signing support
Date: Mon, 19 Oct 2015 12:03:00 -0700
Message-ID: <1445281385-28020-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

V6:
1 Rename function swap_endianness() to reverse_byte_order()
2 Put "size - 1 - i" to a variable to avoid double calculation
3 Remove checking NULL pointer of get_value_size() in function set_rsa_param()
4 Change function prototype for get_value_size()
5 Pass token id to format_function() so that format_rsa_param() will
  call get_value_size() to find out the actual byte length in value
  buffer instead of using a constant.
 

V5:
1. Remove Rehash.cfg from patch 4 and add update.cfg into patch 3 and
   place it under samples directory.

2. Move test key file rsa_priv.pem to samples directory

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
 samples/rsa_priv.pem     | 27 ++++++++++++++++++
 samples/sign.sh          | 73 ++++++++++++++++++++++++++++++++++++++++++++++++
 samples/update.cfg       |  1 +
 src/bct_dump.c           | 65 +++++++++++++++++++++++++++++++++++-------
 src/cbootimage.h         |  1 +
 src/crypto.c             | 63 +++++++++++++++++++++++++++++++++++++++++
 src/crypto.h             | 12 ++++++++
 src/data_layout.c        | 51 +++++++++++++++++++++++++++++++++
 src/data_layout.h        |  2 ++
 src/parse.c              | 49 ++++++++++++++++++++++++++++++++
 src/parse.h              | 18 ++++++++++++
 src/set.c                | 44 +++++++++++++++++++++++++++++
 src/set.h                |  5 ++++
 src/t114/nvbctlib_t114.c |  1 +
 src/t124/nvbctlib_t124.c |  1 +
 src/t210/nvbctlib_t210.c | 63 ++++++++++++++++++++++++++++++++++++++++-
 17 files changed, 466 insertions(+), 12 deletions(-)
 create mode 100644 samples/rsa_priv.pem
 create mode 100755 samples/sign.sh
 create mode 100644 samples/update.cfg

-- 
1.8.1.5
