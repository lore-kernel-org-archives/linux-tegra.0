From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v1 2/3] firmware: trusted_foundations: Different way of L2 cache enabling after LP2 suspend
Date: Wed, 25 Mar 2020 01:43:34 +0300
Message-ID: <20200324224335.5825-3-digetx@gmail.com>
References: <20200324224335.5825-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200324224335.5825-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, Daniel Lezcano <daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>, Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Heidelberg <david-W22tF5X+A20@public.gmane.org>, Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

ASUS TF300T device may not work properly if firmware is asked to fully
re-initialize L2 cache after resume from LP2 suspend. The downstream
kernel of TF300T uses different opcode to enable cache after resuming
from LP2, this opcode also works fine on Nexus 7 and Ouya devices.
Supposedly, this may be needed by an older firmware versions.

Reported-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Tested-by: Michał Mirosław <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Tested-by: Jasper Korten <jja2000-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: David Heidelberg <david-W22tF5X+A20@public.gmane.org>
Tested-by: Peter Geis <pgwipeout-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 arch/arm/mach-tegra/pm.c                     |  4 ++++
 drivers/firmware/trusted_foundations.c       | 21 ++++++++++++++++++--
 include/linux/firmware/trusted_foundations.h |  1 +
 3 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/pm.c b/arch/arm/mach-tegra/pm.c
index d1e1a61b12cf..6452ebf68d40 100644
--- a/arch/arm/mach-tegra/pm.c
+++ b/arch/arm/mach-tegra/pm.c
@@ -216,6 +216,8 @@ int tegra_pm_enter_lp2(void)
 	restore_cpu_complex();
 	cpu_cluster_pm_exit();
 
+	call_firmware_op(prepare_idle, TF_PM_MODE_NONE);
+
 	return err;
 }
 
@@ -391,6 +393,8 @@ static int tegra_suspend_enter(suspend_state_t state)
 
 	local_fiq_enable();
 
+	call_firmware_op(prepare_idle, TF_PM_MODE_NONE);
+
 	return 0;
 }
 
diff --git a/drivers/firmware/trusted_foundations.c b/drivers/firmware/trusted_foundations.c
index fc544e19b0a1..1389fa9418a7 100644
--- a/drivers/firmware/trusted_foundations.c
+++ b/drivers/firmware/trusted_foundations.c
@@ -19,6 +19,7 @@
 
 #define TF_CACHE_ENABLE		1
 #define TF_CACHE_DISABLE	2
+#define TF_CACHE_REENABLE	4
 
 #define TF_SET_CPU_BOOT_ADDR_SMC 0xfffff200
 
@@ -29,6 +30,7 @@
 #define TF_CPU_PM_S1		0xffffffe4
 #define TF_CPU_PM_S1_NOFLUSH_L2	0xffffffe7
 
+static unsigned long tf_idle_mode = TF_PM_MODE_NONE;
 static unsigned long cpu_boot_addr;
 
 static void tf_generic_smc(u32 type, u32 arg1, u32 arg2)
@@ -85,25 +87,40 @@ static int tf_prepare_idle(unsigned long mode)
 			       cpu_boot_addr);
 		break;
 
+	case TF_PM_MODE_NONE:
+		break;
+
 	default:
 		return -EINVAL;
 	}
 
+	tf_idle_mode = mode;
+
 	return 0;
 }
 
 #ifdef CONFIG_CACHE_L2X0
 static void tf_cache_write_sec(unsigned long val, unsigned int reg)
 {
-	u32 l2x0_way_mask = 0xff;
+	u32 enable_op, l2x0_way_mask = 0xff;
 
 	switch (reg) {
 	case L2X0_CTRL:
 		if (l2x0_saved_regs.aux_ctrl & L310_AUX_CTRL_ASSOCIATIVITY_16)
 			l2x0_way_mask = 0xffff;
 
+		switch (tf_idle_mode) {
+		case TF_PM_MODE_LP2:
+			enable_op = TF_CACHE_REENABLE;
+			break;
+
+		default:
+			enable_op = TF_CACHE_ENABLE;
+			break;
+		}
+
 		if (val == L2X0_CTRL_EN)
-			tf_generic_smc(TF_CACHE_MAINT, TF_CACHE_ENABLE,
+			tf_generic_smc(TF_CACHE_MAINT, enable_op,
 				       l2x0_saved_regs.aux_ctrl);
 		else
 			tf_generic_smc(TF_CACHE_MAINT, TF_CACHE_DISABLE,
diff --git a/include/linux/firmware/trusted_foundations.h b/include/linux/firmware/trusted_foundations.h
index 2549a2db56aa..be5984bda592 100644
--- a/include/linux/firmware/trusted_foundations.h
+++ b/include/linux/firmware/trusted_foundations.h
@@ -32,6 +32,7 @@
 #define TF_PM_MODE_LP1_NO_MC_CLK	2
 #define TF_PM_MODE_LP2			3
 #define TF_PM_MODE_LP2_NOFLUSH_L2	4
+#define TF_PM_MODE_NONE			5
 
 struct trusted_foundations_platform_data {
 	unsigned int version_major;
-- 
2.25.1
