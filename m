From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 0/5] Enable --update option support for t210
Date: Wed, 7 Oct 2015 17:40:40 -0700
Message-ID: <1444264845-16741-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

1. Addressed issues found in v2. 
2. Use keyword "RehashBl" instead of "ReSignBl" to re-generate AES hash
   for bootloader (and bct).
3. Add a sample script to do rsa signing for a bootimage for T210.

Jimmy Zhang (5):
  Enable -u | --update option support for t210
  Add support for update pubkey and rsa-pss signatures
  Add support to dump rsa related fields for t210
  Add new configuration keyword "RehashBl"
  Add sample shell script to sign bootimage for T210

 rehash.cfg                 |  1 +
 rsa_priv.pem               | 27 +++++++++++++++++++
 sign.sh                    | 65 ++++++++++++++++++++++++++++++++++++++++++++++
 src/bct_dump.c             | 38 +++++++++++++++++++++++++++
 src/cbootimage.c           |  9 ++++---
 src/cbootimage.h           |  4 +++
 src/crypto.c               | 34 ++++++++++++++++++++++++
 src/crypto.h               |  6 +++++
 src/data_layout.c          | 52 +++++++++++++++++++++++++++++++++++++
 src/data_layout.h          |  2 ++
 src/parse.c                | 44 +++++++++++++++++++++++++++++++
 src/parse.h                |  5 ++++
 src/set.c                  | 38 +++++++++++++++++++++++++++
 src/set.h                  |  5 ++++
 src/t210/nvbctlib_t210.c   | 39 +++++++++++++++++++++++++++-
 src/t210/nvboot_bct_t210.h |  2 --
 16 files changed, 364 insertions(+), 7 deletions(-)
 create mode 100644 rehash.cfg
 create mode 100644 rsa_priv.pem
 create mode 100755 sign.sh

-- 
1.8.1.5
