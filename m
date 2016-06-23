From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH 2/2] Avoid man warning about unknown macro
Date: Thu, 23 Jun 2016 11:54:16 -0700
Message-ID: <20160623185416.GA29091@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

man --warnings shows this warning because some dots at the beginning
of the line are not escaped:

> usr/share/man/man1/tegrarcm.1.gz 111: warning: macro `..' not defined

Put the ellipsis in brackets to avoid this.

This was found thanks to lintian, the Debian package checker.

Signed-off-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
---
 src/tegrarcm.1.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 210f2e4..852af96 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -147,10 +147,10 @@ state of any other USB devices so you don't confuse yourself).
 
 .nf
 $ lsusb
-...
+[...]
 Bus 003 Device 039: ID 0955:7721 NVidia Corp.
 Bus 003 Device 045: ID 0955:7140 NVidia Corp.
-...
+[...]
 .fi
 
 Then, to determine the USB port path, do one of:
-- 
2.1.4

-- 
Martin Michlmayr
http://www.cyrius.com/
