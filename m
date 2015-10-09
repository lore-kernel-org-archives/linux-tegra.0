From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [cbootimage PATCH v4 4/5] Add a sample script to do rsa signing for T210 bootimage
Date: Fri, 9 Oct 2015 14:20:45 -0700
Message-ID: <1444425646-20380-5-git-send-email-jimmzhang@nvidia.com>
References: <1444425646-20380-1-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1444425646-20380-1-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

sign.sh runs openssl and other linux utilities to generate rsa-pss
signatures for a prebuilt bootimage and then uses cbootimage option
--update to update bootimage's rsa signatures and rsa modulus.

Syntax: sign.sh <bootimage> <rsa_key.pem>

Signed-off-by: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 rehash.cfg      |  1 +
 rsa_priv.pem    | 27 +++++++++++++++++++++
 samples/sign.sh | 73 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 101 insertions(+)
 create mode 100644 rehash.cfg
 create mode 100644 rsa_priv.pem
 create mode 100755 samples/sign.sh

diff --git a/rehash.cfg b/rehash.cfg
new file mode 100644
index 000000000000..c5c741bad536
--- /dev/null
+++ b/rehash.cfg
@@ -0,0 +1 @@
+RehashBl;
diff --git a/rsa_priv.pem b/rsa_priv.pem
new file mode 100644
index 000000000000..a02d77fc438c
--- /dev/null
+++ b/rsa_priv.pem
@@ -0,0 +1,27 @@
+-----BEGIN RSA PRIVATE KEY-----
+MIIEpQIBAAKCAQEA2L0jolLgp2pKAzn/JeZuxgGPY1Yz4ZNkttzvBlVhozEynj2x
+Lttz1gZ6fYUb/ObM8v2PoeOlrwkGoWMscuMS4MnLG2NcJlWmlsLTyfw3EwxblM3D
+DniscakhMexNK3J7uxmmRkQTfldec4JHjsAN6d9cZQ0POdsA7j5lKNG0KgCohKk6
+p+lMYXFqgxx3IQWcynhuKVtVFm/UJJBC+a4ibbXcpnio96ySVrPO/ZpEOhEpPTWX
+VLeiqBB3dsu//9X0vDfShyBlctaonx2Z7xWQWotubze0iIvyU6U+T69aDOXfHQfu
+kNMX3Dj4VCndW/FUrrg5k/y9dMA1We3Ng1A0NQIDAQABAoIBABcWRqZy15VdwBaJ
+5gDeg+w5nFGDjDE6Jx9Hd3qgO69LfU3X2njYTYV92SxnsmyFFU3I7rTa7/ouJvOo
+AcMXJxqkxCrdsaIvu3gRtsesQx2XUmYOaPmwpwXQc0XDGxFGt6FdgRW5CK6LlfcN
+6JtvH8xKy6fD9Vw/VOEL6nCnrd5PU3UNU/Ng7h/SZ+5NEALJE7+gaMvmK9o9lX3a
+/tze6bwKKF+a2luTs2aVGxjUYBud6YOE2KPG7zltuHUHUeEgJ/X/sgWYiHsqpK3l
+rIrjCVIQnrRCCtCHg5BbqtwStl5Gz+Y431DXU9Sv6fVqIFgveweePhhDux/YV+KY
+rvq5RiECgYEA7OHr8BYWkeZKuU/IkGdsdiPEEB7mNOJHwE4OXdwLIIygQGtQCuJG
+EHMQv9kE/1ibVRIxqnliFb/CupZ5wwyvjFgUq5XZl7s6XpNOBhJHV0U5AJSvS0rb
+YNU2PBfRmMMI/gRdF/onUpopY7ZWLv7u+VF7ZgtM5hQr2jwcjwBzbRkCgYEA6jsK
+tB6SGIO2c5E+CLAY5J4eJca6ORaVcKw1OfDL346UJYkvqOLBc8KwFs87gDbwhmjn
+GJUWlhk5iUoWZrFJpTj8+hVNxKumtZ5x8MQkNXL7WBNYcVxobuGVW8c6jZU3C/al
+Im9DRTPXhgvMy7mu4slVaAhhrmUJRdl6fwmCR30CgYEA5FoxwML6RPGUrSl9Nb+N
+riFyWvv+fZJ5Cqf0b4S08U6/GPqaMbPJSQgzaE3D5Ie9Tff5CtZyuHagOJDglie/
+fvJWEsak+QETFqK3/2BVh4qClc2/YjyqWKGQ48MuWS4CmCUKvRd4GsfkCGx4jltR
+ceSbqVZRbiaZ04pJGY2ct9kCgYEArWaaLO/4zgcsGfArUXk0ZIMd5G9zS3IJnckO
++l7mPxEpYYRm8Qs1lcJKZAh0jx2dAJRGiO9OMj5oVtevL8UNtTA0L9t3oCJHH2s2
+BLzf5WXC5tgjgICdm4CK9s/N7CTMBKJKa+yci22un0C7ExLagm/0NzkFP3ry22/9
+/HAIr20CgYEAnUGwciM7Z9aMpPkX3iaRG/zm1FWbsuJldNa5IZQ6CamDIZhb+u2u
+1yuCUJZ7zY51RO4n2Hi/1OU1XS7XlevoT22i7xJmIjPVoWzumUwMjmhYVqxK/X50
+Hcd+qL1Xs6KmsWrlg2sgFliX79RawE3jl/yZrFMuHvWiItXO92YFuOI=
+-----END RSA PRIVATE KEY-----
diff --git a/samples/sign.sh b/samples/sign.sh
new file mode 100755
index 000000000000..d6c67b3715f5
--- /dev/null
+++ b/samples/sign.sh
@@ -0,0 +1,73 @@
+#!/bin/bash
+#
+# Copyright (c) 2015, NVIDIA CORPORATION.  All rights reserved.
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+# You should have received a copy of the GNU General Public License
+# along with this program.  If not, see <http://www.gnu.org/licenses/>.
+#
+# See file CREDITS for list of people who contributed to this
+# project.
+#
+set -e
+IMAGE_FILE=$1
+KEY_FILE=$2
+TARGET_IMAGE=$IMAGE_FILE
+CONFIG_FILE=update.cfg
+
+CBOOTIMAGE=../src/cbootimage
+BCT_DUMP=../src/bct_dump
+OBJCOPY=objcopy
+OPENSSL=openssl
+DD=dd
+RM=rm
+MV=mv
+XXD=xxd
+CUT=cut
+
+echo "Get rid of all temporary files: *.sig, *.tosig, *.tmp *.mod"
+$RM -f *.sig *.tosig *.tmp *.mod
+
+echo "Get bl length "
+BL_LENGTH=`$BCT_DUMP $IMAGE_FILE | grep "Bootloader\[0\].Length"\
+ | awk -F ' ' '{print $4}' | awk -F ';' '{print $1}'`
+
+echo "Extract bootloader to $IMAGE_FILE.bl.tosig, length $BL_LENGTH"
+$DD bs=1 skip=32768 if=$IMAGE_FILE of=$IMAGE_FILE.bl.tosig count=$BL_LENGTH
+
+echo "Calculate rsa signature for bootloader and save to $IMAGE_FILE.bl.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bl.sig $IMAGE_FILE.bl.tosig
+
+echo "Update bootloader's rsa signature, aes hash and bct's aes hash"
+echo "RsaPssSigBlFile = $IMAGE_FILE.bl.sig;" > $CONFIG_FILE
+echo "RehashBl;" >> $CONFIG_FILE
+$CBOOTIMAGE -s tegra210 -u $CONFIG_FILE $IMAGE_FILE $IMAGE_FILE.tmp
+
+echo "Extract the part of bct which needs to be rsa signed"
+$DD bs=1 if=$IMAGE_FILE.tmp of=$IMAGE_FILE.bct.tosig count=8944 skip=1296
+
+echo "Calculate rsa signature for bct and save to $IMAGE_FILE.bct.sig"
+$OPENSSL dgst -sha256 -sigopt rsa_padding_mode:pss -sigopt rsa_pss_saltlen:-1 \
+ -sign $KEY_FILE -out $IMAGE_FILE.bct.sig $IMAGE_FILE.bct.tosig
+
+echo "Create public key modulus from key file $KEY_FILE and save to $KEY_FILE.mod"
+$OPENSSL rsa -in $KEY_FILE -noout -modulus -out $KEY_FILE.mod
+# remove prefix
+$CUT -d= -f2 < $KEY_FILE.mod > $KEY_FILE.mod.tmp
+
+# convert from hexdecimal to binary
+$XXD -r -p -l 256 $KEY_FILE.mod.tmp $KEY_FILE.mod.bin
+
+echo "Update bct's rsa signature and modulus"
+echo "RsaPssSigBctFile = $IMAGE_FILE.bct.sig;" > $CONFIG_FILE
+echo "RsaKeyModulusFile = $KEY_FILE.mod.bin;" >> $CONFIG_FILE
+$CBOOTIMAGE -s tegra210 -u $CONFIG_FILE $IMAGE_FILE.tmp $TARGET_IMAGE
-- 
1.8.1.5
