From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v3 5/5] Add two sample scripts to do rsa signing for T210 bootimage
Date: Thu, 8 Oct 2015 12:38:29 -0700
Message-ID: <1444333109-3671-7-git-send-email-jimmzhang@nvidia.com>
References: <1444333109-3671-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444333109-3671-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

sign.sh runs openssl and other linux utilities to generate rsa-pss
signatures for a prebuilt bootimage and inject signatures and rsa
modulus into bct directly.

Syntax: sign.sh <bootimage> <rsa_key.pem>

sign-by-update.sh is similar to sign.sh. The difference is the
signatures update are done by cbootimage with configuration
keywords "RsaKeyModulusFile", "RsaPssSigBlFile", and "RsaPssSigBctFile".
Comparing to sign.sh, this script is relatively simple to be ported
to T124/T114.

Syntax: sign-by-update.sh <bootimage> <rsa_key.pem>

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 rehash.cfg        |  1 +
 rsa_priv.pem      | 27 +++++++++++++++++++++++
 sign-by-update.sh | 59 ++++++++++++++++++++++++++++++++++++++++++++++++++
 sign.sh           | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 152 insertions(+)
 create mode 100644 rehash.cfg
 create mode 100644 rsa_priv.pem
 create mode 100755 sign-by-update.sh
 create mode 100755 sign.sh

diff --git a/rehash.cfg b/rehash.cfg
new file mode 100644
index 000000000000..c5c741bad536
--- /dev/null
+++ b/rehash.cfg
@@ -0,0 +1 @@
+RehashBl;
diff --git a/rsa_priv.pem b/rsa_priv.pem
new file mode 100644
index 000000000000..cbafc03ba35a
--- /dev/null
+++ b/rsa_priv.pem
@@ -0,0 +1,27 @@
+-----BEGIN RSA PRIVATE KEY-----
+MIIEpAIBAAKCAQEAs3Lf87UkomlfVHdw/FEz+owzgO+ZFu6/72qT+jSu7aEDZeZj
+l2cgTQOnHjlmBYj6KoqwXQmY6ZWPNBT7xDqzGdvimCVRC3OGRee2uD+Itu/Qwo1F
+FOb7v+l3v6lODGqDJ06aIxLicEiqK55dk5z+7dP8yyJ3pRhwiDPE4tNtlLOWgmJ/
+hENyqBHbMMzg67Qwb+aa89wfq2FRrvGOpfmrKlhqtikDnwJALBfkr7hsZGZOszHC
+ii2L5T3eCaI/me2/VIGlQSjGxmaDkiG/aIZVTuIX/LuOyi4sLXJ9cIFQ7Ty/0PAk
+6Ia6VyEGETQt6+JeLETX4Zc+XCnfbE/Flhs5PwIDAQABAoIBAQCMcmM/Xc4PY0Ne
+W6FNicyR0vtYda4u2avVGWg50tP6XiPHtDrMO8V3IV3B9RCZUmzhsOx51NIeN5T+
+IVIvcfXNTmCZzdMRkFhODB3hNLCu5SFRs7mWs3Xj7TlxA3R3mUGPGSDgRJ5/XQ/6
+1ZbNunl38IuQ/SgBShCBOWtmUC4ay+ctm1CzBZ/7AYlauOxdoKiU2nzlwpMrX9+C
+vaVKRQVYbE7EYJsWKOx6vRPU5Kjoq6StlSW4caG0ReRu9tO+xL7kZnqp1BWl3KHw
+OfzLy1CmwDkV3bKFclRWWPR97nN7F95SUFIJ3bOVjU/K2TKuLtMYPPVdG4CBBeB5
+eK2Qae7ZAoGBAOprwiAvcRNWJ2W5JoCkh0L6AHXx2z+S1Bbt0laz4NyqyfPX2SMl
+DJRxm/IoYRfwZf7fussI1bG7g4UP8HjfrlAzSEWVgPNMSWftOFzkv4QNr2ySjk0/
+nZRsd+zj2kxhc8ukDhiORkyEEg5gtsEUqbtdZHOiqtkNbKOPD6EGKeP7AoGBAMP3
+q5NUh9pJ2RGSkdKutloXNe0HPI6sjsCX3HHWAaFyqBtXWvRU3fIaMUpGQcPaqDCt
+LhzVoNlPXdeQ7vTkBPtiYQBcs0NPI+58pnD5fgR00yTX/5ZIGKbX0NnpZ3spsQAQ
+FQTXGy80+JyGMmJCDf32VGC96I9Ey5w49U23kXiNAoGAGEtiqwM/rMlY++ncW6ix
+e/d85LxUBJqq8FVlXyb1PulUVLkh/8pvK1M63jXhGiIH8Aovyar4upq8XqXwPhaw
+cg9ehhegbZaSZProxHfQgVcJvy7RIKBfLGqxYxOaJCBVZ91wuIrGLlfhpyvOxOPn
+U0uyhWluW2BQygKhlAaXgNECgYAKDAif5RWR+3dFj14qjwqKU+ZP4K8aIX6wIRkM
+PQyYWmiD/laLcE5wuycLx85XXD6DQF283LcCbS9CfgvCQm5+9OxEOHx4VvZgo8Nk
+x2XOlK6+lNRlwAyDgU0T3wOPLPQGLMznEqAyK2UToU2z++77tkVdMF9b+Qr3V3Q8
+J80tgQKBgQCW2OHHUfnfRMns/d1sp/QNMag19flOT+IjvZXI5ZMy9yojlpcTSdSq
+NzaahUZKtEankjMlXw2RHMYrXjtAJgwXlV4rMWxkaqUrVqq99v6M1QNx/SHjnVB+
+SYQ8PZHp0mPk/opRPydP/U5WKDcP10KRuSNRSQmvacD5gzs3B6Jhqg==
+-----END RSA PRIVATE KEY-----
diff --git a/sign-by-update.sh b/sign-by-update.sh
new file mode 100755
index 000000000000..b3f010a41d0e
--- /dev/null
+++ b/sign-by-update.sh
@@ -0,0 +1,59 @@
+IMAGE_FILE=$1
+KEY_FILE=$2
+TARGET_IMAGE=$IMAGE_FILE
+CONFIG_FILE=update.cfg
+
+CBOOTIMAGE=src/cbootimage
+BCT_DUMP=src/bct_dump
+OBJCOPY=objcopy
+OPENSSL=openssl
+DD=dd
+RM=rm
+MV=mv
+XXD=xxd
+
+echo " Get rid of all temporary files: *.sig, *.tosig, *.tmp *.mod *.rev"
+$RM -f *.sig *.tosig *.tmp *.mod *.rev
+
+echo " Get bl length "
+BL_LENGTH=`$BCT_DUMP $IMAGE_FILE | grep "Bootloader\[0\].Length" \
+ | awk -F ' ' '{print $4}' | awk -F ';' '{print $1}'`
+
+echo " Extract bootloader to $IMAGE_FILE.bl.tosig, length $BL_LENGTH "
+$DD bs=1 skip=32768 if=$IMAGE_FILE of=$IMAGE_FILE.bl.tosig count=$BL_LENGTH
+
+echo " Calculate rsa signature for bl and save to $IMAGE_FILE.bl.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.tosig
+
+echo " Reverse bl signature to meet tegra soc signature ordering"
+$OBJCOPY -I binary --reverse-bytes=256 $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.sig.rev
+
+echo "# Update bootloader's rsa signature, aes hash and bct's aes hash"
+echo "RsaPssSigBlFile = $IMAGE_FILE.bl.sig.rev;" > $CONFIG_FILE
+echo "RehashBl;" >> $CONFIG_FILE
+$CBOOTIMAGE -s tegra210 -u $CONFIG_FILE $IMAGE_FILE $IMAGE_FILE.tmp
+
+echo " Extract the part of bct which needs to be rsa signed"
+$DD bs=1 if=$IMAGE_FILE.tmp of=$IMAGE_FILE.bct.tosig count=8944 skip=1296
+
+echo " Calculate rsa signature for bct and save to $IMAGE_FILE.bct.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bct.sig $IMAGE_FILE.bct.tosig
+
+echo " Reverse bct signature to meet tegra soc signature ordering"
+$OBJCOPY -I binary --reverse-bytes=256 $IMAGE_FILE.bct.sig $IMAGE_FILE.bct.sig.rev
+
+echo " Create public key modulus from key file $KEY_FILE and save to $KEY_FILE.mod"
+$OPENSSL rsa -in $KEY_FILE -noout -modulus -out $KEY_FILE.mod
+# remove prefix and LF
+$DD bs=1 if=$KEY_FILE.mod of=$KEY_FILE.mod.tmp skip=8 count=512
+# convert format from hexdecimal to binary
+$XXD -r -p -l 256 $KEY_FILE.mod.tmp $KEY_FILE.mod.bin
+# reverse byte order"
+$OBJCOPY -I binary --reverse-bytes=256 $KEY_FILE.mod.bin $KEY_FILE.mod.bin.rev
+
+echo "# Update bct's rsa signature and modulus"
+echo "RsaPssSigBctFile = $IMAGE_FILE.bct.sig.rev;" > $CONFIG_FILE
+echo "RsaKeyModulusFile = $KEY_FILE.mod.bin.rev;" >> $CONFIG_FILE
+$CBOOTIMAGE -s tegra210 -u $CONFIG_FILE $IMAGE_FILE.tmp $TARGET_IMAGE
diff --git a/sign.sh b/sign.sh
new file mode 100755
index 000000000000..8f8a353fe19f
--- /dev/null
+++ b/sign.sh
@@ -0,0 +1,65 @@
+IMAGE_FILE=$1
+KEY_FILE=$2
+TARGET_IMAGE=$IMAGE_FILE
+CONFIG_FILE=rehash.cfg
+
+CBOOTIMAGE=src/cbootimage
+BCT_DUMP=src/bct_dump
+OBJCOPY=objcopy
+OPENSSL=openssl
+DD=dd
+RM=rm
+MV=mv
+XXD=xxd
+
+echo " Get rid of all temporary files: *.sig, *.tosig, *.tmp *.mod *.rev"
+$RM -f *.sig *.tosig *.tmp *.mod *.rev
+
+echo " Get bl length "
+BL_LENGTH=`$BCT_DUMP $IMAGE_FILE | grep "Bootloader\[0\].Length" \
+ | awk -F ' ' '{print $4}' | awk -F ';' '{print $1}'`
+
+echo " Extract bootloader to $IMAGE_FILE.bl.tosig, length $BL_LENGTH "
+$DD bs=1 skip=32768 if=$IMAGE_FILE of=$IMAGE_FILE.bl.tosig count=$BL_LENGTH
+
+echo " Calculate rsa signature for bl and save to $IMAGE_FILE.bl.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.tosig
+
+echo " Reverse bl signature to meet tegra soc signature ordering"
+$OBJCOPY -I binary --reverse-bytes=256 $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.sig.rev
+
+echo " Inject bl signature into bct"
+$DD conv=notrunc bs=1 if=$IMAGE_FILE.bl.sig.rev of=$IMAGE_FILE seek=9052 count=256
+
+echo " Update bct aes hash and output to $IMAGE_FILE.tmp"
+$CBOOTIMAGE -s tegra210 -u $CONFIG_FILE $IMAGE_FILE $IMAGE_FILE.tmp
+
+echo " Extract the part of bct which needs to be rsa signed"
+$DD bs=1 if=$IMAGE_FILE.tmp of=$IMAGE_FILE.bct.tosig count=8944 skip=1296
+
+echo " Calculate rsa signature for bct and save to $IMAGE_FILE.bct.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bct.sig $IMAGE_FILE.bct.tosig
+
+echo " Reverse bct signature to meet tegra soc signature ordering"
+$OBJCOPY -I binary --reverse-bytes=256 $IMAGE_FILE.bct.sig $IMAGE_FILE.bct.sig.rev
+
+echo " Inject bct signature into bct"
+$DD conv=notrunc bs=1 if=$IMAGE_FILE.bct.sig.rev of=$IMAGE_FILE.tmp seek=800 count=256
+
+echo " Create public key modulus from key file $KEY_FILE and save to $KEY_FILE.mod"
+$OPENSSL rsa -in $KEY_FILE -noout -modulus -out $KEY_FILE.mod
+# remove prefix and LF
+$DD bs=1 if=$KEY_FILE.mod of=$KEY_FILE.mod.tmp skip=8 count=512
+# convert format from hexdecimal to binary
+$XXD -r -p -l 256 $KEY_FILE.mod.tmp $KEY_FILE.mod.bin
+# reverse byte order"
+$OBJCOPY -I binary --reverse-bytes=256 $KEY_FILE.mod.bin $KEY_FILE.mod.bin.rev
+
+echo " Inject public key modulus into bct"
+$DD conv=notrunc bs=1 if=$KEY_FILE.mod.bin.rev of=$IMAGE_FILE.tmp seek=528 count=256
+
+echo " Copy the signed binary to the target file $TARGET_IMAGE"
+$MV $IMAGE_FILE.tmp $TARGET_IMAGE
+
-- 
1.8.1.5
