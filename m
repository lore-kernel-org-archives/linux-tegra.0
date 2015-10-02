From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH v2 0/4]  Enable --update option support for t210
Date: Fri, 2 Oct 2015 13:56:56 -0700
Message-ID: <1443819420-26562-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Addressed comments made in v1:

1. Split CL1 into two patches.

2. Use openssl utility to generate signature and save to file. Then use
   --update option to load in signature files to update rsa-pss signature
   fields in bct. So, all rsa-pss signing functions and files are removed.

3. Use keyword "ReSignBl" to re-generate AES hash for bootloader (and bct).


Jimmy Zhang (4):
  Enable -u | --update option support for t210
  Add support for update pubkey and rsa-pss signatures
  Add support to dump rsa related fields for t210
  Add new configuration keyword "ReSignBl"

 src/bct_dump.c             | 38 ++++++++++++++++++++++++++++++++++
 src/cbootimage.c           |  9 ++++----
 src/cbootimage.h           |  5 +++++
 src/crypto.c               | 34 +++++++++++++++++++++++++++++++
 src/crypto.h               |  6 ++++++
 src/data_layout.c          | 51 ++++++++++++++++++++++++++++++++++++++++++++++
 src/data_layout.h          |  2 ++
 src/parse.c                | 44 +++++++++++++++++++++++++++++++++++++++
 src/parse.h                |  5 +++++
 src/set.c                  | 39 +++++++++++++++++++++++++++++++++++
 src/set.h                  |  5 +++++
 src/t210/nvbctlib_t210.c   | 39 ++++++++++++++++++++++++++++++++++-
 src/t210/nvboot_bct_t210.h |  2 --
 13 files changed, 272 insertions(+), 7 deletions(-)

-- 
1.8.1.5
