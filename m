From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/1] ARM: tegra: Make variables static
Date: Tue, 27 Nov 2012 09:15:14 +0200
Message-ID: <1354000514-29159-1-git-send-email-hdoyu@nvidia.com>
References: <50B3C36D.9030501@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50B3C36D.9030501-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

No need to be public. Checked with:
  $ touch arch/arm/mach-tegra/*[ch] && make C=1

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/apbio.c               |    2 +-
 arch/arm/mach-tegra/board-dt-tegra20.c    |   10 +++++-----
 arch/arm/mach-tegra/board-dt-tegra30.c    |    2 +-
 arch/arm/mach-tegra/flowctrl.c            |    4 ++--
 arch/arm/mach-tegra/tegra30_clocks_data.c |    6 +++---
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio.c
index d091675..d7aa52e 100644
--- a/arch/arm/mach-tegra/apbio.c
+++ b/arch/arm/mach-tegra/apbio.c
@@ -38,7 +38,7 @@ static void tegra_apb_writel_direct(u32 value, unsigned long offset);
 static struct dma_chan *tegra_apb_dma_chan;
 static struct dma_slave_config dma_sconfig;
 
-bool tegra_apb_dma_init(void)
+static bool tegra_apb_dma_init(void)
 {
 	dma_cap_mask_t mask;
 
diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 0bee85a..bd37515 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -46,31 +46,31 @@
 #include "common.h"
 #include "iomap.h"
 
-struct tegra_ehci_platform_data tegra_ehci1_pdata = {
+static struct tegra_ehci_platform_data tegra_ehci1_pdata = {
 	.operating_mode = TEGRA_USB_OTG,
 	.power_down_on_bus_suspend = 1,
 	.vbus_gpio = -1,
 };
 
-struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config = {
+static struct tegra_ulpi_config tegra_ehci2_ulpi_phy_config = {
 	.reset_gpio = -1,
 	.clk = "cdev2",
 };
 
-struct tegra_ehci_platform_data tegra_ehci2_pdata = {
+static struct tegra_ehci_platform_data tegra_ehci2_pdata = {
 	.phy_config = &tegra_ehci2_ulpi_phy_config,
 	.operating_mode = TEGRA_USB_HOST,
 	.power_down_on_bus_suspend = 1,
 	.vbus_gpio = -1,
 };
 
-struct tegra_ehci_platform_data tegra_ehci3_pdata = {
+static struct tegra_ehci_platform_data tegra_ehci3_pdata = {
 	.operating_mode = TEGRA_USB_HOST,
 	.power_down_on_bus_suspend = 1,
 	.vbus_gpio = -1,
 };
 
-struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
+static struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", TEGRA_SDMMC1_BASE, "sdhci-tegra.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", TEGRA_SDMMC2_BASE, "sdhci-tegra.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", TEGRA_SDMMC3_BASE, "sdhci-tegra.2", NULL),
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index a2b6cf1..ef98400 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -39,7 +39,7 @@
 #include "common.h"
 #include "iomap.h"
 
-struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
+static struct of_dev_auxdata tegra30_auxdata_lookup[] __initdata = {
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", 0x78000000, "sdhci-tegra.0", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", 0x78000200, "sdhci-tegra.1", NULL),
 	OF_DEV_AUXDATA("nvidia,tegra20-sdhci", 0x78000400, "sdhci-tegra.2", NULL),
diff --git a/arch/arm/mach-tegra/flowctrl.c b/arch/arm/mach-tegra/flowctrl.c
index a2250dd..5393eb2 100644
--- a/arch/arm/mach-tegra/flowctrl.c
+++ b/arch/arm/mach-tegra/flowctrl.c
@@ -26,14 +26,14 @@
 #include "flowctrl.h"
 #include "iomap.h"
 
-u8 flowctrl_offset_halt_cpu[] = {
+static u8 flowctrl_offset_halt_cpu[] = {
 	FLOW_CTRL_HALT_CPU0_EVENTS,
 	FLOW_CTRL_HALT_CPU1_EVENTS,
 	FLOW_CTRL_HALT_CPU1_EVENTS + 8,
 	FLOW_CTRL_HALT_CPU1_EVENTS + 16,
 };
 
-u8 flowctrl_offset_cpu_csr[] = {
+static u8 flowctrl_offset_cpu_csr[] = {
 	FLOW_CTRL_CPU0_CSR,
 	FLOW_CTRL_CPU1_CSR,
 	FLOW_CTRL_CPU1_CSR + 8,
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index 7bc8b1d..116f5c3 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1183,7 +1183,7 @@ static struct clk tegra_dsib = {
 	.num_parents = ARRAY_SIZE(mux_plld_out0_plld2_out0),
 };
 
-struct clk *tegra_list_clks[] = {
+static struct clk *tegra_list_clks[] = {
 	&tegra_apbdma,
 	&tegra_rtc,
 	&tegra_kbc,
@@ -1289,7 +1289,7 @@ struct clk *tegra_list_clks[] = {
  * configuration.  List those here to register them twice in the clock lookup
  * table under two names.
  */
-struct clk_duplicate tegra_clk_duplicates[] = {
+static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("uarta",  "serial8250.0", NULL),
 	CLK_DUPLICATE("uartb",  "serial8250.1", NULL),
 	CLK_DUPLICATE("uartc",  "serial8250.2", NULL),
@@ -1339,7 +1339,7 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("pll_p_out3", "tegra-i2c.4", "fast-clk"),
 };
 
-struct clk *tegra_ptr_clks[] = {
+static struct clk *tegra_ptr_clks[] = {
 	&tegra_clk_32k,
 	&tegra_clk_m,
 	&tegra_clk_m_div2,
-- 
1.7.9.5
