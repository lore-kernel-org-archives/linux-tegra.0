From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH v9 14/22] clk: tegra: Share clk and rst register defines with Tegra clock driver
Date: Fri, 16 Aug 2019 12:41:59 -0700
Message-ID: <1565984527-5272-15-git-send-email-skomatineni@nvidia.com>
References: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1565984527-5272-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org, rjw@rjwysocki.net, viresh.kumar@linaro.org, linux-pm@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Move CLK_OUT_ENB and RST_DEVICES registers to clk.h to share these with
Tegra clock driver.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk.c | 45 ---------------------------------------------
 drivers/clk/tegra/clk.h | 45 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 45 insertions(+), 45 deletions(-)

diff --git a/drivers/clk/tegra/clk.c b/drivers/clk/tegra/clk.c
index eb08047fd02f..33ac88ee324a 100644
--- a/drivers/clk/tegra/clk.c
+++ b/drivers/clk/tegra/clk.c
@@ -16,51 +16,6 @@
 
 #include "clk.h"
 
-#define CLK_OUT_ENB_L			0x010
-#define CLK_OUT_ENB_H			0x014
-#define CLK_OUT_ENB_U			0x018
-#define CLK_OUT_ENB_V			0x360
-#define CLK_OUT_ENB_W			0x364
-#define CLK_OUT_ENB_X			0x280
-#define CLK_OUT_ENB_Y			0x298
-#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
-#define CLK_OUT_ENB_SET_L		0x320
-#define CLK_OUT_ENB_CLR_L		0x324
-#define CLK_OUT_ENB_SET_H		0x328
-#define CLK_OUT_ENB_CLR_H		0x32c
-#define CLK_OUT_ENB_SET_U		0x330
-#define CLK_OUT_ENB_CLR_U		0x334
-#define CLK_OUT_ENB_SET_V		0x440
-#define CLK_OUT_ENB_CLR_V		0x444
-#define CLK_OUT_ENB_SET_W		0x448
-#define CLK_OUT_ENB_CLR_W		0x44c
-#define CLK_OUT_ENB_SET_X		0x284
-#define CLK_OUT_ENB_CLR_X		0x288
-#define CLK_OUT_ENB_SET_Y		0x29c
-#define CLK_OUT_ENB_CLR_Y		0x2a0
-
-#define RST_DEVICES_L			0x004
-#define RST_DEVICES_H			0x008
-#define RST_DEVICES_U			0x00C
-#define RST_DEVICES_V			0x358
-#define RST_DEVICES_W			0x35C
-#define RST_DEVICES_X			0x28C
-#define RST_DEVICES_Y			0x2a4
-#define RST_DEVICES_SET_L		0x300
-#define RST_DEVICES_CLR_L		0x304
-#define RST_DEVICES_SET_H		0x308
-#define RST_DEVICES_CLR_H		0x30c
-#define RST_DEVICES_SET_U		0x310
-#define RST_DEVICES_CLR_U		0x314
-#define RST_DEVICES_SET_V		0x430
-#define RST_DEVICES_CLR_V		0x434
-#define RST_DEVICES_SET_W		0x438
-#define RST_DEVICES_CLR_W		0x43c
-#define RST_DEVICES_SET_X		0x290
-#define RST_DEVICES_CLR_X		0x294
-#define RST_DEVICES_SET_Y		0x2a8
-#define RST_DEVICES_CLR_Y		0x2ac
-
 /* Global data of Tegra CPU CAR ops */
 static struct tegra_cpu_car_ops dummy_car_ops;
 struct tegra_cpu_car_ops *tegra_cpu_car_ops = &dummy_car_ops;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 55c4b78280be..ba123ba4a1da 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -10,6 +10,51 @@
 #include <linux/clkdev.h>
 #include <linux/delay.h>
 
+#define CLK_OUT_ENB_L			0x010
+#define CLK_OUT_ENB_H			0x014
+#define CLK_OUT_ENB_U			0x018
+#define CLK_OUT_ENB_V			0x360
+#define CLK_OUT_ENB_W			0x364
+#define CLK_OUT_ENB_X			0x280
+#define CLK_OUT_ENB_Y			0x298
+#define CLK_ENB_PLLP_OUT_CPU		BIT(31)
+#define CLK_OUT_ENB_SET_L		0x320
+#define CLK_OUT_ENB_CLR_L		0x324
+#define CLK_OUT_ENB_SET_H		0x328
+#define CLK_OUT_ENB_CLR_H		0x32c
+#define CLK_OUT_ENB_SET_U		0x330
+#define CLK_OUT_ENB_CLR_U		0x334
+#define CLK_OUT_ENB_SET_V		0x440
+#define CLK_OUT_ENB_CLR_V		0x444
+#define CLK_OUT_ENB_SET_W		0x448
+#define CLK_OUT_ENB_CLR_W		0x44c
+#define CLK_OUT_ENB_SET_X		0x284
+#define CLK_OUT_ENB_CLR_X		0x288
+#define CLK_OUT_ENB_SET_Y		0x29c
+#define CLK_OUT_ENB_CLR_Y		0x2a0
+
+#define RST_DEVICES_L			0x004
+#define RST_DEVICES_H			0x008
+#define RST_DEVICES_U			0x00C
+#define RST_DEVICES_V			0x358
+#define RST_DEVICES_W			0x35C
+#define RST_DEVICES_X			0x28C
+#define RST_DEVICES_Y			0x2a4
+#define RST_DEVICES_SET_L		0x300
+#define RST_DEVICES_CLR_L		0x304
+#define RST_DEVICES_SET_H		0x308
+#define RST_DEVICES_CLR_H		0x30c
+#define RST_DEVICES_SET_U		0x310
+#define RST_DEVICES_CLR_U		0x314
+#define RST_DEVICES_SET_V		0x430
+#define RST_DEVICES_CLR_V		0x434
+#define RST_DEVICES_SET_W		0x438
+#define RST_DEVICES_CLR_W		0x43c
+#define RST_DEVICES_SET_X		0x290
+#define RST_DEVICES_CLR_X		0x294
+#define RST_DEVICES_SET_Y		0x2a8
+#define RST_DEVICES_CLR_Y		0x2ac
+
 /**
  * struct tegra_clk_sync_source - external clock source from codec
  *
-- 
2.7.4
