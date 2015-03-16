From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH v2] pinctrl: tegra: use signed bitfields for optional fields
Date: Mon, 16 Mar 2015 22:42:34 +0100
Message-ID: <1426542154-31072-1-git-send-email-stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Optional fields are set to -1 by various preprocessor macros. Make
sure the fields can actually store them.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
With that, sizes are back to normal:

   text	   data	    bss	    dec	    hex	filename
   5406	    180	      1	   5587	   15d3	drivers/pinctrl/pinctrl-tegra-xusb.o
   5256	     64	      0	   5320	   14c8	drivers/pinctrl/pinctrl-tegra.o
  18072	   1032	      0	  19104	   4aa0	drivers/pinctrl/pinctrl-tegra114.o
  19214	   1128	      0	  20342	   4f76	drivers/pinctrl/pinctrl-tegra124.o
  18352	    876	      0	  19228	   4b1c	drivers/pinctrl/pinctrl-tegra20.o
  24621	   1068	      0	  25689	   6459	drivers/pinctrl/pinctrl-tegra30.o

 drivers/pinctrl/pinctrl-tegra.h | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index 8d94d13..b8a82a3 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -139,26 +139,26 @@ struct tegra_pingroup {
 	u32 pupd_bank:2;
 	u32 tri_bank:2;
 	u32 drv_bank:2;
-	u32 mux_bit:6;
-	u32 pupd_bit:6;
-	u32 tri_bit:6;
-	u32 einput_bit:6;
-	u32 odrain_bit:6;
-	u32 lock_bit:6;
-	u32 ioreset_bit:6;
-	u32 rcv_sel_bit:6;
-	u32 hsm_bit:6;
-	u32 schmitt_bit:6;
-	u32 lpmd_bit:6;
-	u32 drvdn_bit:6;
-	u32 drvup_bit:6;
-	u32 slwr_bit:6;
-	u32 slwf_bit:6;
-	u32 drvtype_bit:6;
-	u32 drvdn_width:6;
-	u32 drvup_width:6;
-	u32 slwr_width:6;
-	u32 slwf_width:6;
+	s32 mux_bit:6;
+	s32 pupd_bit:6;
+	s32 tri_bit:6;
+	s32 einput_bit:6;
+	s32 odrain_bit:6;
+	s32 lock_bit:6;
+	s32 ioreset_bit:6;
+	s32 rcv_sel_bit:6;
+	s32 hsm_bit:6;
+	s32 schmitt_bit:6;
+	s32 lpmd_bit:6;
+	s32 drvdn_bit:6;
+	s32 drvup_bit:6;
+	s32 slwr_bit:6;
+	s32 slwf_bit:6;
+	s32 drvtype_bit:6;
+	s32 drvdn_width:6;
+	s32 drvup_width:6;
+	s32 slwr_width:6;
+	s32 slwf_width:6;
 };
 
 /**
-- 
2.3.3
