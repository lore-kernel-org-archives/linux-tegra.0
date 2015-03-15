From: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
Subject: [PATCH] pinctrl: tegra: use signed bitfields for optional fields
Date: Sun, 15 Mar 2015 01:05:52 +0100
Message-ID: <1426377952-12383-1-git-send-email-stefan@agner.ch>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stefan-XLVq0VzYD2Y@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Optional fields are set to -1 by various preprocessor macros. Make
sure the struct fields can actually store them.

Signed-off-by: Stefan Agner <stefan-XLVq0VzYD2Y@public.gmane.org>
---
This lead to a lot of warnings when compiling the Tegra pinctrl drivers
using LLVM/clang:

drivers/pinctrl/pinctrl-tegra124.c:2048:2: warning: implicit truncation from
'int' to bitfield changes value from -1 to 63 [-Wbitfield-constant-conversion]
        MIPI_PAD_CTRL_PINGROUP(dsi_b,   0x820, 1, CSI, DSI_B)
        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
drivers/pinctrl/pinctrl-tegra124.c:1807:18: note: expanded from macro
'MIPI_PAD_CTRL_PINGROUP'
                .rcv_sel_bit = -1,                                      \
                               ^~

However, I did not check if this could actually lead to an unintended
pin configuration...

 drivers/pinctrl/pinctrl-tegra.h | 48 ++++++++++++++++++++---------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-tegra.h b/drivers/pinctrl/pinctrl-tegra.h
index 8d94d13..0711ae62 100644
--- a/drivers/pinctrl/pinctrl-tegra.h
+++ b/drivers/pinctrl/pinctrl-tegra.h
@@ -135,30 +135,30 @@ struct tegra_pingroup {
 	s16 pupd_reg;
 	s16 tri_reg;
 	s16 drv_reg;
-	u32 mux_bank:2;
-	u32 pupd_bank:2;
-	u32 tri_bank:2;
-	u32 drv_bank:2;
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
+	u8 mux_bank:2;
+	u8 pupd_bank:2;
+	u8 tri_bank:2;
+	u8 drv_bank:2;
+	s8 mux_bit:6;
+	s8 pupd_bit:6;
+	s8 tri_bit:6;
+	s8 einput_bit:6;
+	s8 odrain_bit:6;
+	s8 lock_bit:6;
+	s8 ioreset_bit:6;
+	s8 rcv_sel_bit:6;
+	s8 hsm_bit:6;
+	s8 schmitt_bit:6;
+	s8 lpmd_bit:6;
+	s8 drvdn_bit:6;
+	s8 drvup_bit:6;
+	s8 slwr_bit:6;
+	s8 slwf_bit:6;
+	s8 drvtype_bit:6;
+	s8 drvdn_width:6;
+	s8 drvup_width:6;
+	s8 slwr_width:6;
+	s8 slwf_width:6;
 };
 
 /**
-- 
2.3.3
