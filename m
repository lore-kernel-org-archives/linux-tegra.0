From: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
Subject: [flasher scripts PATCH] Fix flash --flash-image option
Date: Thu, 16 Jun 2016 19:34:35 -0700
Message-ID: <20160617023435.GA22135@jirafa.cyrius.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Pass correct variable to avoid the following error:

  File "./tegra-uboot-flasher", line 139, in func_flash
    flash_img = args.flash_img
AttributeError: 'Namespace' object has no attribute 'flash_img'

Signed-off-by: Martin Michlmayr <tbm-R+vWnYXSFMfQT0dZR+AlfA@public.gmane.org>
---
 tegra-uboot-flasher | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tegra-uboot-flasher b/tegra-uboot-flasher
index 153db0d..ddce70d 100755
--- a/tegra-uboot-flasher
+++ b/tegra-uboot-flasher
@@ -136,7 +136,7 @@ def func_flash():
         print 'u_boot_dtb_size %d 0x%x' % (u_boot_dtb_size, u_boot_dtb_size)
 
     if args.flash_image:
-        flash_img = args.flash_img
+        flash_img = args.flash_image
     else:
         flash_img = os.path.join(out_board_dir, config['flash-image'])
     flash_img_size = os.path.getsize(flash_img)
-- 
2.1.4

-- 
Martin Michlmayr
http://www.cyrius.com/
