From: Sowjanya Komatineni <skomatineni@nvidia.com>
Subject: [PATCH V2 12/12] soc/tegra: pmc: configure tegra deep sleep control settings
Date: Tue, 28 May 2019 16:08:56 -0700
Message-ID: <1559084936-4610-13-git-send-email-skomatineni@nvidia.com>
References: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1559084936-4610-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, skomatineni@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Tegra210 and prior Tegra chips have power request signal polarity,
deep sleep entry and wake related timings which are platform specific
that should be configured before entering into deep sleep.

Below are the timings specific configurations for deep sleep and wake.
- Core rail power-on stabilization timer
- OSC clock stabilization timer after SOC rail power is stabilized.
- Core power off time is the minimum wake delay to keep the system
in deep sleep state irrespective of any quick wake event.

These values depends on the discharge time of regulators and turn OFF
time of the PMIC to allow the complete system to finish entering into
deep sleep state.

These values vary based on the platform design and are specified
through the device tree.

This patch has implementation to configure these configurations which
are must to have for deep sleep state.

Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi |  7 +++++++
 drivers/soc/tegra/pmc.c                        | 18 ++++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
index 4dcd0d36189a..7ac5e55a30aa 100644
--- a/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi
@@ -266,6 +266,13 @@
 
 	pmc@7000e400 {
 		nvidia,invert-interrupt;
+		nvidia,suspend-mode = <0>;
+		nvidia,cpu-pwr-good-time = <0>;
+		nvidia,cpu-pwr-off-time = <0>;
+		nvidia,core-pwr-good-time = <4587 3876>;
+		nvidia,core-pwr-off-time = <39065>;
+		nvidia,core-power-req-active-high;
+		nvidia,sys-clock-req-active-high;
 	};
 
 	/* eMMC */
diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index 54dc8409e353..d7e0f5057f16 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -66,6 +66,7 @@
 #define  PMC_CNTRL_SIDE_EFFECT_LP0	BIT(14) /* LP0 when CPU pwr gated */
 #define  PMC_CNTRL_SYSCLK_OE		BIT(11) /* system clock enable */
 #define  PMC_CNTRL_SYSCLK_POLARITY	BIT(10) /* sys clk polarity */
+#define  PMC_CNTRL_PWRREQ_POLARITY	BIT(8)
 #define  PMC_CNTRL_MAIN_RST		BIT(4)
 #define  PMC_CNTRL_LATCH_WAKEUPS	BIT(5)
 
@@ -98,6 +99,8 @@
 
 #define PMC_CPUPWRGOOD_TIMER		0xc8
 #define PMC_CPUPWROFF_TIMER		0xcc
+#define PMC_COREPWRGOOD_TIMER		0x3c
+#define PMC_COREPWROFF_TIMER		0xe0
 
 #define PMC_PWR_DET_VALUE		0xe4
 
@@ -2285,6 +2288,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs = {
 static void tegra20_pmc_init(struct tegra_pmc *pmc)
 {
 	u32 value;
+	unsigned long osc, pmu, off;
 
 	/* Always enable CPU power request */
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
@@ -2298,6 +2302,11 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
 	else
 		value |= PMC_CNTRL_SYSCLK_POLARITY;
 
+	if (pmc->corereq_high)
+		value &= ~PMC_CNTRL_PWRREQ_POLARITY;
+	else
+		value |= PMC_CNTRL_PWRREQ_POLARITY;
+
 	/* configure the output polarity while the request is tristated */
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
 
@@ -2305,6 +2314,15 @@ static void tegra20_pmc_init(struct tegra_pmc *pmc)
 	value = tegra_pmc_readl(pmc, PMC_CNTRL);
 	value |= PMC_CNTRL_SYSCLK_OE;
 	tegra_pmc_writel(pmc, value, PMC_CNTRL);
+
+	osc = DIV_ROUND_UP_ULL(pmc->core_osc_time * 8192, 1000000);
+	pmu = DIV_ROUND_UP_ULL(pmc->core_pmu_time * 32768, 1000000);
+	off = DIV_ROUND_UP_ULL(pmc->core_off_time * 32768, 1000000);
+	if (osc && pmu)
+		tegra_pmc_writel(pmc, ((osc << 8) & 0xff00) | (pmu & 0xff),
+				 PMC_COREPWRGOOD_TIMER);
+	if (off)
+		tegra_pmc_writel(pmc, off, PMC_COREPWROFF_TIMER);
 }
 
 static void tegra20_pmc_setup_irq_polarity(struct tegra_pmc *pmc,
-- 
2.7.4
