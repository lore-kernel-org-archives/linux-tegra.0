From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: [flasher scripts PATCH] Remove obsolete comment about load address
Date: Tue, 28 Jun 2016 19:34:22 -0700
Message-ID: <20160629023422.GA18059@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Remove the obsolete comment about the hardcoded load address since
it's determined from the binary as of commit 948b56e ("Determine SPL
entry-point automatically").

Signed-off-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index ddce70d..b7eeb2c 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -179,7 +179,6 @@ def func_flash():
     if args.debug:
         print 'pad_size %d 0x%x' % (pad_size, pad_size)
 
-    # 0x00108000 is CONFIG_SYS_TEXT_BASE in U-Boot, minus RAM base
     loadaddr = get_loadaddr()
     flash_image_addr = loadaddr + padded_size
     if args.debug:
-- 
2.1.4

-- 
Martin Michlmayr
http://www.cyrius.com/
