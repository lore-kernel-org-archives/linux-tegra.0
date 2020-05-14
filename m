From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1] mfd: tps65910: Correct power-off programming sequence
Date: Thu, 14 May 2020 23:50:21 +0300
Message-ID: <20200514205022.7024-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tony Lindgren <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-omap-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This patch fixes system shutdown on a devices that use TPS65910 as a
system's power controller. In accordance to the TPS65910 datasheet, the
PMIC's state-machine transitions into the OFF state only when DEV_OFF
bit of DEVCTRL_REG is set. The ON / SLEEP states also should be cleared,
otherwise PMIC won't get into a proper state on shutdown. Devices like
Nexus 7 tablet and Ouya game console are now shutting down properly.

Tested-by: Zack Pearsall <zpearsall-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/mfd/tps65910.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
index 11959021b50a..22116cee411d 100644
--- a/drivers/mfd/tps65910.c
+++ b/drivers/mfd/tps65910.c
@@ -440,8 +440,16 @@ static void tps65910_power_off(void)
 			DEVCTRL_PWR_OFF_MASK) < 0)
 		return;
 
-	tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
-			DEVCTRL_DEV_ON_MASK);
+	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_SLP_MASK) < 0)
+		return;
+
+	if (tps65910_reg_clear_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_ON_MASK) < 0)
+		return;
+
+	tps65910_reg_set_bits(tps65910, TPS65910_DEVCTRL,
+			DEVCTRL_DEV_OFF_MASK);
 }
 
 static int tps65910_i2c_probe(struct i2c_client *i2c,
-- 
2.26.0
