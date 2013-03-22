From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v8 09/14] clk: tegra: Workaround for Tegra114 MSENC problem
Date: Fri, 22 Mar 2013 14:39:26 +0200
Message-ID: <1363956029-31873-10-git-send-email-pdeschrijver@nvidia.com>
References: <1363956029-31873-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363956029-31873-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Workaround a hardware bug in MSENC during clock enable.

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-periph-gate.c |    9 +++++++++
 drivers/clk/tegra/clk.h             |    2 ++
 2 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk-periph-gate.c b/drivers/clk/tegra/clk-periph-gate.c
index 6dd5332..c9083fb 100644
--- a/drivers/clk/tegra/clk-periph-gate.c
+++ b/drivers/clk/tegra/clk-periph-gate.c
@@ -43,6 +43,8 @@ static DEFINE_SPINLOCK(periph_ref_lock);
 
 #define periph_clk_to_bit(periph) (1 << (gate->clk_num % 32))
 
+#define LVL2_CLK_GATE_OVRE 0x554
+
 /* Peripheral gate clock ops */
 static int clk_periph_is_enabled(struct clk_hw *hw)
 {
@@ -83,6 +85,13 @@ static int clk_periph_enable(struct clk_hw *hw)
 		}
 	}
 
+	if (gate->flags & TEGRA_PERIPH_WAR_1005168) {
+		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
+		writel_relaxed(BIT(22), gate->clk_base + LVL2_CLK_GATE_OVRE);
+		udelay(1);
+		writel_relaxed(0, gate->clk_base + LVL2_CLK_GATE_OVRE);
+	}
+
 	spin_unlock_irqrestore(&periph_ref_lock, flags);
 
 	return 0;
diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
index 8fbdb8a..fd8ada2 100644
--- a/drivers/clk/tegra/clk.h
+++ b/drivers/clk/tegra/clk.h
@@ -358,6 +358,7 @@ struct tegra_clk_periph_regs {
  * TEGRA_PERIPH_ON_APB - If peripheral is in the APB bus then read the
  *     bus to flush the write operation in apb bus. This flag indicates
  *     that this peripheral is in apb bus.
+ * TEGRA_PERIPH_WAR_1005168 - Apply workaround for Tegra114 MSENC bug
  */
 struct tegra_clk_periph_gate {
 	u32			magic;
@@ -377,6 +378,7 @@ struct tegra_clk_periph_gate {
 #define TEGRA_PERIPH_NO_RESET BIT(0)
 #define TEGRA_PERIPH_MANUAL_RESET BIT(1)
 #define TEGRA_PERIPH_ON_APB BIT(2)
+#define TEGRA_PERIPH_WAR_1005168 BIT(3)
 
 void tegra_periph_reset(struct tegra_clk_periph_gate *gate, bool assert);
 extern const struct clk_ops tegra_clk_periph_gate_ops;
-- 
1.7.7.rc0.72.g4b5ea.dirty
