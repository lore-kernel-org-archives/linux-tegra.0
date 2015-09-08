From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 0/8] Add rsa pss signature support
Date: Tue, 8 Sep 2015 17:19:49 +0000
Message-ID: <1441732756143.23592@nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Could someone help me out?

cbootimage with rsa signing function supported is required for A44 product release.

Thanks,

Jimmy 
________________________________________
From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sent: Wednesday, September 2, 2015 2:19 PM
To: Allen Martin; Stephen Warren
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org; Jimmy Zhang
Subject: [cbootimage PATCH v1 0/8] Add rsa pss signature support

For security fused tegra chip, BR requires to verify rsa_pss_sig before
jumping to next level of boot loader.

The patches here are adding rsa_pss_sig related functions, such as updating
signatures and pubkey, generating signatures on boot loader and bct, and
generating signature on any given binary file.


Jimmy Zhang (8):
  Enable --update | -u option support for t210
  Add bct_dump support for t210
  Add in libmcrypto
  Add new configuration keyword "PkcKey"
  Fix some issues found in libmcrypto
  Add new configuration keyword "ReSignBl"
  Add new command line option "--sign | -n" to sign binary image
  Bump to version 1.6

 configure.ac               |    2 +-
 src/Makefile.am            |   74 ++-
 src/bct_dump.c             |   39 +-
 src/cbootimage.c           |   37 +-
 src/cbootimage.h           |   26 +
 src/crypto.c               |  200 ++++++-
 src/crypto.h               |   76 +++
 src/data_layout.c          |  301 ++++++++++
 src/data_layout.h          |    8 +
 src/libm/base64.c          |  132 +++++
 src/libm/bigdUtils.c       |  208 +++++++
 src/libm/bigdigits.h       |  294 ++++++++++
 src/libm/common.c          |   58 ++
 src/libm/elliptic-ff2n.c   |  347 +++++++++++
 src/libm/elliptic-ff2n.h   |   97 +++
 src/libm/elliptic-ffp.c    | 1403 ++++++++++++++++++++++++++++++++++++++++++++
 src/libm/elliptic-ffp.h    |  232 ++++++++
 src/libm/ff2n.c            |  810 +++++++++++++++++++++++++
 src/libm/ff2n.h            |  127 ++++
 src/libm/galois.c          |  497 ++++++++++++++++
 src/libm/galois.h          |  101 ++++
 src/libm/hash.c            |  114 ++++
 src/libm/hash.h            |   49 ++
 src/libm/mcrypto.h         |   34 ++
 src/libm/md5.c             |  296 ++++++++++
 src/libm/md5.h             |   57 ++
 src/libm/mpAND.c           |    9 +
 src/libm/mpAdd.c           |   41 ++
 src/libm/mpBitLength.c     |   24 +
 src/libm/mpCompare.c       |   21 +
 src/libm/mpComplement.c    |    9 +
 src/libm/mpDivide.c        |  202 +++++++
 src/libm/mpEqual.c         |   19 +
 src/libm/mpGcd.c           |   26 +
 src/libm/mpHalfDiv.c       |   99 ++++
 src/libm/mpHalfMod.c       |   46 ++
 src/libm/mpIsOne.c         |   18 +
 src/libm/mpIsPrime.c       |  124 ++++
 src/libm/mpIsZero.c        |   19 +
 src/libm/mpJacobi.c        |   44 ++
 src/libm/mpLegendre.c      |    8 +
 src/libm/mpModAdd.c        |   32 +
 src/libm/mpModExp.c        |   40 ++
 src/libm/mpModInv.c        |   49 ++
 src/libm/mpModMult.c       |   20 +
 src/libm/mpModSquare.c     |   18 +
 src/libm/mpModSquareRoot.c |   96 +++
 src/libm/mpModSubtract.c   |   38 ++
 src/libm/mpModulo.c        |   37 ++
 src/libm/mpMultiply.c      |   58 ++
 src/libm/mpOR.c            |    9 +
 src/libm/mpSetDigit.c      |   15 +
 src/libm/mpSetEqual.c      |   11 +
 src/libm/mpSetZero.c       |   11 +
 src/libm/mpShiftLeft.c     |   43 ++
 src/libm/mpShiftRight.c    |   45 ++
 src/libm/mpShortAdd.c      |   38 ++
 src/libm/mpShortCmp.c      |   25 +
 src/libm/mpShortDiv.c      |   55 ++
 src/libm/mpShortMod.c      |   22 +
 src/libm/mpShortModMult.c  |   30 +
 src/libm/mpShortMult.c     |   40 ++
 src/libm/mpShortSub.c      |   39 ++
 src/libm/mpSizeof.c        |   14 +
 src/libm/mpSolinasPrime.c  |   41 ++
 src/libm/mpSquare.c        |   65 ++
 src/libm/mpSubtract.c      |   41 ++
 src/libm/mpSwap.c          |   16 +
 src/libm/mpXOR.c           |    9 +
 src/libm/pkcs1-rsa.c       |  788 +++++++++++++++++++++++++
 src/libm/pkcs1-rsa.h       |  120 ++++
 src/libm/sha1.c            |  155 +++++
 src/libm/sha1.h            |   26 +
 src/libm/sha2.c            |  724 +++++++++++++++++++++++
 src/libm/sha2.h            |  128 ++++
 src/libm/spDivide.c        |  175 ++++++
 src/libm/spGcd.c           |   24 +
 src/libm/spIsPrime.c       |   89 +++
 src/libm/spModExp.c        |   64 ++
 src/libm/spModInv.c        |   41 ++
 src/libm/spModMult.c       |   17 +
 src/libm/spMultiply.c      |   76 +++
 src/libm/spPseudoRand.c    |   30 +
 src/parse.c                |  142 +++++
 src/parse.h                |    7 +
 src/rsa_key_parse.c        |  973 ++++++++++++++++++++++++++++++
 src/rsa_key_parse.h        |  107 ++++
 src/set.c                  |   77 ++-
 src/set.h                  |   10 +
 src/t210/nvbctlib_t210.c   |   43 +-
 src/t210/nvboot_bct_t210.h |    2 -
 91 files changed, 11081 insertions(+), 22 deletions(-)
 create mode 100644 src/libm/base64.c
 create mode 100644 src/libm/bigdUtils.c
 create mode 100644 src/libm/bigdigits.h
 create mode 100644 src/libm/common.c
 create mode 100644 src/libm/elliptic-ff2n.c
 create mode 100644 src/libm/elliptic-ff2n.h
 create mode 100644 src/libm/elliptic-ffp.c
 create mode 100644 src/libm/elliptic-ffp.h
 create mode 100644 src/libm/ff2n.c
 create mode 100644 src/libm/ff2n.h
 create mode 100644 src/libm/galois.c
 create mode 100644 src/libm/galois.h
 create mode 100644 src/libm/hash.c
 create mode 100644 src/libm/hash.h
 create mode 100644 src/libm/mcrypto.h
 create mode 100644 src/libm/md5.c
 create mode 100644 src/libm/md5.h
 create mode 100644 src/libm/mpAND.c
 create mode 100644 src/libm/mpAdd.c
 create mode 100644 src/libm/mpBitLength.c
 create mode 100644 src/libm/mpCompare.c
 create mode 100644 src/libm/mpComplement.c
 create mode 100644 src/libm/mpDivide.c
 create mode 100644 src/libm/mpEqual.c
 create mode 100644 src/libm/mpGcd.c
 create mode 100644 src/libm/mpHalfDiv.c
 create mode 100644 src/libm/mpHalfMod.c
 create mode 100644 src/libm/mpIsOne.c
 create mode 100644 src/libm/mpIsPrime.c
 create mode 100644 src/libm/mpIsZero.c
 create mode 100644 src/libm/mpJacobi.c
 create mode 100644 src/libm/mpLegendre.c
 create mode 100644 src/libm/mpModAdd.c
 create mode 100644 src/libm/mpModExp.c
 create mode 100644 src/libm/mpModInv.c
 create mode 100644 src/libm/mpModMult.c
 create mode 100644 src/libm/mpModSquare.c
 create mode 100644 src/libm/mpModSquareRoot.c
 create mode 100644 src/libm/mpModSubtract.c
 create mode 100644 src/libm/mpModulo.c
 create mode 100644 src/libm/mpMultiply.c
 create mode 100644 src/libm/mpOR.c
 create mode 100644 src/libm/mpSetDigit.c
 create mode 100644 src/libm/mpSetEqual.c
 create mode 100644 src/libm/mpSetZero.c
 create mode 100644 src/libm/mpShiftLeft.c
 create mode 100644 src/libm/mpShiftRight.c
 create mode 100644 src/libm/mpShortAdd.c
 create mode 100644 src/libm/mpShortCmp.c
 create mode 100644 src/libm/mpShortDiv.c
 create mode 100644 src/libm/mpShortMod.c
 create mode 100644 src/libm/mpShortModMult.c
 create mode 100644 src/libm/mpShortMult.c
 create mode 100644 src/libm/mpShortSub.c
 create mode 100644 src/libm/mpSizeof.c
 create mode 100644 src/libm/mpSolinasPrime.c
 create mode 100644 src/libm/mpSquare.c
 create mode 100644 src/libm/mpSubtract.c
 create mode 100644 src/libm/mpSwap.c
 create mode 100644 src/libm/mpXOR.c
 create mode 100644 src/libm/pkcs1-rsa.c
 create mode 100644 src/libm/pkcs1-rsa.h
 create mode 100644 src/libm/sha1.c
 create mode 100644 src/libm/sha1.h
 create mode 100644 src/libm/sha2.c
 create mode 100644 src/libm/sha2.h
 create mode 100644 src/libm/spDivide.c
 create mode 100644 src/libm/spGcd.c
 create mode 100644 src/libm/spIsPrime.c
 create mode 100644 src/libm/spModExp.c
 create mode 100644 src/libm/spModInv.c
 create mode 100644 src/libm/spModMult.c
 create mode 100644 src/libm/spMultiply.c
 create mode 100644 src/libm/spPseudoRand.c
 create mode 100644 src/rsa_key_parse.c
 create mode 100644 src/rsa_key_parse.h

--
1.8.1.5
