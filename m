From: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] thermal: tegra_soctherm: fix sign bit of temperature
Date: Mon, 29 Feb 2016 17:51:20 +0800
Message-ID: <1456739480-3304-1-git-send-email-wni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rui.zhang-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, MLongnecker-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mikko.perttunen-/1wQRMveznE@public.gmane.org
Cc: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The sign bit of temperature readback is bit 0, not bit 1.
Change to BIT(0) to fix it.

Signed-off-by: Wei Ni <wni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/thermal/tegra_soctherm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/thermal/tegra_soctherm.c b/drivers/thermal/tegra_soctherm.c
index 74ea5765938b..136975220c92 100644
--- a/drivers/thermal/tegra_soctherm.c
+++ b/drivers/thermal/tegra_soctherm.c
@@ -57,7 +57,7 @@
 #define READBACK_VALUE_MASK			0xff00
 #define READBACK_VALUE_SHIFT			8
 #define READBACK_ADD_HALF			BIT(7)
-#define READBACK_NEGATE				BIT(1)
+#define READBACK_NEGATE				BIT(0)
 
 #define FUSE_TSENSOR8_CALIB			0x180
 #define FUSE_SPARE_REALIGNMENT_REG_0		0x1fc
-- 
1.9.1
