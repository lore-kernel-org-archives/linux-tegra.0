From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] pinctrl: tegra: avoid parked_reg and parked_bank
Date: Tue, 3 May 2016 00:17:32 +0530
Message-ID: <1462214852-26915-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra210 support the park bit to make pinmux configuration
enable/disable. If parked bit is 1 then configuration does not apply
and if it is 0 then pinmux configuration applies. This is to support
to avoid any glitch in pinmux configurations.

The parked bit is part of mux register and mux bank and hence it is
not required to have member for the parked_reg and parked bank very
similar to other bit field of the same register.

Remove the need of the parked register and parked bank and get whether
parked function supported or not by parked_bit.

This is to make the parked bit handling same as other fields of mux
registers.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

---
Changes from V1:
- Only check if parked_bit is >=0 for validity.

 drivers/pinctrl/tegra/pinctrl-tegra.c    | 8 ++++----
 drivers/pinctrl/tegra/pinctrl-tegra.h    | 6 +-----
 drivers/pinctrl/tegra/pinctrl-tegra114.c | 4 ++--
 drivers/pinctrl/tegra/pinctrl-tegra124.c | 4 ++--
 drivers/pinctrl/tegra/pinctrl-tegra20.c  | 4 ++--
 drivers/pinctrl/tegra/pinctrl-tegra210.c | 4 +---
 drivers/pinctrl/tegra/pinctrl-tegra30.c  | 4 ++--
 7 files changed, 14 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.c b/drivers/pinctrl/tegra/pinctrl-tegra.c
index 861baf2..c68c5fc 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.c
@@ -632,11 +632,11 @@ static void tegra_pinctrl_clear_parked_bits(struct tegra_pmx *pmx)
 	u32 val;
 
 	for (i = 0; i < pmx->soc->ngroups; ++i) {
-		if (pmx->soc->groups[i].parked_reg >= 0) {
-			g = &pmx->soc->groups[i];
-			val = pmx_readl(pmx, g->parked_bank, g->parked_reg);
+		g = &pmx->soc->groups[i];
+		if (g->parked_bit >= 0) {
+			val = pmx_readl(pmx, g->mux_bank, g->mux_reg);
 			val &= ~(1 << g->parked_bit);
-			pmx_writel(pmx, val, g->parked_bank, g->parked_reg);
+			pmx_writel(pmx, val, g->mux_bank, g->mux_reg);
 		}
 	}
 }
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra.h b/drivers/pinctrl/tegra/pinctrl-tegra.h
index d2ced17..33b17cb 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra.h
+++ b/drivers/pinctrl/tegra/pinctrl-tegra.h
@@ -93,9 +93,7 @@ struct tegra_function {
  * @tri_reg:		Tri-state register offset.
  * @tri_bank:		Tri-state register bank.
  * @tri_bit:		Tri-state register bit.
- * @parked_reg:		Parked register offset. -1 if unsupported.
- * @parked_bank:	Parked register bank. 0 if unsupported.
- * @parked_bit:		Parked register bit. 0 if unsupported.
+ * @parked_bit:		Parked register bit. -1 if unsupported.
  * @einput_bit:		Enable-input register bit.
  * @odrain_bit:		Open-drain register bit.
  * @lock_bit:		Lock register bit.
@@ -138,12 +136,10 @@ struct tegra_pingroup {
 	s16 pupd_reg;
 	s16 tri_reg;
 	s16 drv_reg;
-	s16 parked_reg;
 	u32 mux_bank:2;
 	u32 pupd_bank:2;
 	u32 tri_bank:2;
 	u32 drv_bank:2;
-	u32 parked_bank:2;
 	s32 mux_bit:6;
 	s32 pupd_bit:6;
 	s32 tri_bit:6;
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra114.c b/drivers/pinctrl/tegra/pinctrl-tegra114.c
index 4851d16..952132c 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra114.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra114.c
@@ -1578,7 +1578,7 @@ static struct tegra_function tegra114_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -1599,7 +1599,7 @@ static struct tegra_function tegra114_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra124.c b/drivers/pinctrl/tegra/pinctrl-tegra124.c
index a0ce723..bca239e 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra124.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra124.c
@@ -1747,7 +1747,7 @@ static struct tegra_function tegra124_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = PINGROUP_BIT_##rcv_sel(9),		\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -1768,7 +1768,7 @@ static struct tegra_function tegra124_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra20.c b/drivers/pinctrl/tegra/pinctrl-tegra20.c
index 09bad69..91254d0 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra20.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra20.c
@@ -1994,7 +1994,7 @@ static struct tegra_function tegra20_functions[] = {
 		.tri_reg = ((tri_r) - TRISTATE_REG_A),		\
 		.tri_bank = 0,					\
 		.tri_bit = tri_b,				\
-		.parked_reg = -1,				\
+		.parked_bit = -1,				\
 		.einput_bit = -1,				\
 		.odrain_bit = -1,				\
 		.lock_bit = -1,					\
@@ -2014,7 +2014,7 @@ static struct tegra_function tegra20_functions[] = {
 		.pupd_bank = 2,					\
 		.pupd_bit = pupd_b,				\
 		.drv_reg = -1,					\
-		.parked_reg = -1,				\
+		.parked_bit = -1,				\
 	}
 
 /* Pin groups for drive strength registers (configurable version) */
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
index 2d856af..2b70e93 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
@@ -1310,8 +1310,6 @@ static struct tegra_function tegra210_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = -1,					\
 		.rcv_sel_bit = PINGROUP_BIT_##e_io_hv(10),		\
-		.parked_reg = PINGROUP_REG(r),				\
-		.parked_bank = 1,					\
 		.parked_bit = 5,					\
 		.hsm_bit = PINGROUP_BIT_##hsm(9),			\
 		.schmitt_bit = 12,					\
@@ -1345,7 +1343,7 @@ static struct tegra_function tegra210_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.hsm_bit = -1,						\
 		.schmitt_bit = -1,					\
 		.lpmd_bit = -1,						\
diff --git a/drivers/pinctrl/tegra/pinctrl-tegra30.c b/drivers/pinctrl/tegra/pinctrl-tegra30.c
index fb7817f..474ac6d 100644
--- a/drivers/pinctrl/tegra/pinctrl-tegra30.c
+++ b/drivers/pinctrl/tegra/pinctrl-tegra30.c
@@ -2139,7 +2139,7 @@ static struct tegra_function tegra30_functions[] = {
 		.lock_bit = 7,						\
 		.ioreset_bit = PINGROUP_BIT_##ior(8),			\
 		.rcv_sel_bit = -1,					\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.drv_reg = -1,						\
 	}
 
@@ -2160,7 +2160,7 @@ static struct tegra_function tegra30_functions[] = {
 		.rcv_sel_bit = -1,					\
 		.drv_reg = DRV_PINGROUP_REG(r),				\
 		.drv_bank = 0,						\
-		.parked_reg = -1,					\
+		.parked_bit = -1,					\
 		.hsm_bit = hsm_b,					\
 		.schmitt_bit = schmitt_b,				\
 		.lpmd_bit = lpmd_b,					\
-- 
2.1.4
