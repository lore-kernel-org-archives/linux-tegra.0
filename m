From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: [PATCH 13/14] clk: tegra: Correct Tegra210 UTMIPLL poweron delay
Date: Tue, 25 Jul 2017 13:34:14 +0300
Message-ID: <1500978856-5981-14-git-send-email-pdeschrijver@nvidia.com>
References: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1500978856-5981-1-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Alex Frid <afrid@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Alex Frid <afrid@nvidia.com>

Increased Tegra210 UTMIPLL power on delay to 20us (spec maximum is 15us).
Also remove a few empty lines to make it more clear the ACTIVE_DLY_COUNT
and ENABLE_DLY_COUNT fields.

Signed-off-by: Alex Frid <afrid@nvidia.com>
Reviewed-by: Peter De Schrijver <pdeschrijver@nvidia.com>
Reviewed-by: Jon Mayo <jmayo@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index 4fa7ab3..fd04b0e 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2472,15 +2472,14 @@ static void tegra210_utmi_param_configure(void)
 	reg |= UTMIP_PLL_CFG2_STABLE_COUNT(utmi_parameters[i].stable_count);
 
 	reg &= ~UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(~0);
-
 	reg |=
 	UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(utmi_parameters[i].active_delay_count);
 	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG2);
 
 	/* Program UTMIP PLL delay and oscillator frequency counts */
 	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG1);
-	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
 
+	reg &= ~UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(~0);
 	reg |=
 	UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(utmi_parameters[i].enable_delay_count);
 
@@ -2496,7 +2495,8 @@ static void tegra210_utmi_param_configure(void)
 	reg &= ~UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERDOWN;
 	reg |= UTMIP_PLL_CFG1_FORCE_PLL_ENABLE_POWERUP;
 	writel_relaxed(reg, clk_base + UTMIP_PLL_CFG1);
-	udelay(1);
+
+	udelay(20);
 
 	/* Enable samplers for SNPS, XUSB_HOST, XUSB_DEV */
 	reg = readl_relaxed(clk_base + UTMIP_PLL_CFG2);
-- 
1.9.1
