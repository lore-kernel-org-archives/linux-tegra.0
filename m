From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V4 11/18] clk: tegra210: use fence_udelay during PLLU init
Date: Sun, 23 Jun 2019 20:02:52 -0700
Message-ID: <1561345379-2429-12-git-send-email-skomatineni@nvidia.com>
References: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561345379-2429-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This patch uses fence_udelay rather than udelay during PLLU
initialization to ensure writes to clock registers happens before
waiting for specified delay.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 drivers/clk/tegra/clk-tegra210.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
index ac1d27a8c650..c414cd72d045 100644
--- a/drivers/clk/tegra/clk-tegra210.c
+++ b/drivers/clk/tegra/clk-tegra210.c
@@ -2836,7 +2836,7 @@ static int tegra210_enable_pllu(void)
 	reg = readl_relaxed(clk_base + pllu.params->ext_misc_reg[0]);
 	reg &= ~BIT(pllu.params->iddq_bit_idx);
 	writel_relaxed(reg, clk_base + pllu.params->ext_misc_reg[0]);
-	udelay(5);
+	fence_udelay(5, clk_base);
 
 	reg = readl_relaxed(clk_base + PLLU_BASE);
 	reg &= ~GENMASK(20, 0);
@@ -2844,7 +2844,7 @@ static int tegra210_enable_pllu(void)
 	reg |= fentry->n << 8;
 	reg |= fentry->p << 16;
 	writel(reg, clk_base + PLLU_BASE);
-	udelay(1);
+	fence_udelay(1, clk_base);
 	reg |= PLL_ENABLE;
 	writel(reg, clk_base + PLLU_BASE);
 
@@ -2890,12 +2890,12 @@ static int tegra210_init_pllu(void)
 		reg = readl_relaxed(clk_base + XUSB_PLL_CFG0);
 		reg &= ~XUSB_PLL_CFG0_PLLU_LOCK_DLY_MASK;
 		writel_relaxed(reg, clk_base + XUSB_PLL_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_HW_PWRDN_CFG0);
 		reg |= PLLU_HW_PWRDN_CFG0_SEQ_ENABLE;
 		writel_relaxed(reg, clk_base + PLLU_HW_PWRDN_CFG0);
-		udelay(1);
+		fence_udelay(1, clk_base);
 
 		reg = readl_relaxed(clk_base + PLLU_BASE);
 		reg &= ~PLLU_BASE_CLKENABLE_USB;
-- 
2.7.4
