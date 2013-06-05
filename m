From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/4] clk: tegra: override bits for Tegra114 PLLM
Date: Wed, 5 Jun 2013 17:08:27 +0300
Message-ID: <1370441329-8619-3-git-send-email-pdeschrijver@nvidia.com>
References: <1370441329-8619-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370441329-8619-1-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/clk/tegra/clk-tegra114.c |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
index d29ad1d..2774379e 100644
--- a/drivers/clk/tegra/clk-tegra114.c
+++ b/drivers/clk/tegra/clk-tegra114.c
@@ -254,6 +254,16 @@
 /* Tegra CPU clock and reset control regs */
 #define CLK_RST_CONTROLLER_CPU_CMPLX_STATUS	0x470
 
+/* PLLM override registers */
+#define PMC_PLLM_WB0_OVERRIDE 0x1dc
+#define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
+
+#ifdef CONFIG_PM_SLEEP
+static struct cpu_clk_suspend_context {
+	u32 clk_csite_src;
+} tegra114_cpu_clk_sctx;
+#endif
+
 static int periph_clk_enb_refcnt[CLK_OUT_ENB_NUM * 32];
 
 static void __iomem *clk_base;
@@ -398,10 +408,13 @@ static struct tegra_clk_pll_params pll_c3_params = {
 static struct div_nmp pllm_nmp = {
 	.divm_shift = 0,
 	.divm_width = 8,
+	.override_divm_shift = 0,
 	.divn_shift = 8,
 	.divn_width = 8,
+	.override_divn_shift = 8,
 	.divp_shift = 20,
 	.divp_width = 1,
+	.override_divp_shift = 27,
 };
 
 static struct pdiv_map pllm_p[] = {
@@ -434,6 +447,8 @@ static struct tegra_clk_pll_params pll_m_params = {
 	.max_p = 2,
 	.pdiv_tohw = pllm_p,
 	.div_nmp = &pllm_nmp,
+	.pmc_divnm_reg = PMC_PLLM_WB0_OVERRIDE,
+	.pmc_divp_reg = PMC_PLLM_WB0_OVERRIDE_2,
 };
 
 static struct div_nmp pllp_nmp = {
-- 
1.7.7.rc0.72.g4b5ea.dirty
