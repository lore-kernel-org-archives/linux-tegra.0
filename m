From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: [tegrarcm PATCH 1/2] Fix command in man page
Date: Thu, 23 Jun 2016 11:53:12 -0700
Message-ID: <20160623185312.GA29066@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The command .fi is used after .nf to turn on paragraph filling mode
again.  Fix the obvious typo.

Signed-off-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
---
 src/tegrarcm.1.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/src/tegrarcm.1.in b/src/tegrarcm.1.in
index 2b91f49..210f2e4 100644
--- a/src/tegrarcm.1.in
+++ b/src/tegrarcm.1.in
@@ -151,7 +151,7 @@ $ lsusb
 Bus 003 Device 039: ID 0955:7721 NVidia Corp.
 Bus 003 Device 045: ID 0955:7140 NVidia Corp.
 ...
-fi
+.fi
 
 Then, to determine the USB port path, do one of:
 
-- 
2.1.4

-- 
Martin Michlmayr
http://www.cyrius.com/
