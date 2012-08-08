From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 3/4] ARM: tegra: clock: add connection name in i2c clock entry
Date: Wed, 8 Aug 2012 13:21:33 +0530
Message-ID: <1344412294-2420-4-git-send-email-ldewangan@nvidia.com>
References: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org, w.sang@pengutronix.de, olof@lixom.net, khali@linux-fr.org
Cc: ben-linux@fluff.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Add connection name "div-clk" for the i2c clock entry.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 arch/arm/mach-tegra/tegra20_clocks_data.c |    8 ++++----
 arch/arm/mach-tegra/tegra30_clocks_data.c |   10 +++++-----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index 7312ecd..c1318c2 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -889,10 +889,10 @@ PERIPH_CLK(la,		"la",			NULL,	76,	0x1f8,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX
 PERIPH_CLK(owr,		"tegra_w1",		NULL,	71,	0x1cc,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71);
 PERIPH_CLK(nor,		"nor",			NULL,	42,	0x1d0,	92000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71); /* requires min voltage */
 PERIPH_CLK(mipi,	"mipi",			NULL,	50,	0x174,	60000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71); /* scales with voltage */
-PERIPH_CLK(i2c1,	"tegra-i2c.0",		NULL,	12,	0x124,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
-PERIPH_CLK(i2c2,	"tegra-i2c.1",		NULL,	54,	0x198,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
-PERIPH_CLK(i2c3,	"tegra-i2c.2",		NULL,	67,	0x1b8,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
-PERIPH_CLK(dvc,		"tegra-i2c.3",		NULL,	47,	0x128,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
+PERIPH_CLK(i2c1,	"tegra-i2c.0",		"div-clk", 12,	0x124,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
+PERIPH_CLK(i2c2,	"tegra-i2c.1",		"div-clk", 54,	0x198,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
+PERIPH_CLK(i2c3,	"tegra-i2c.2",		"div-clk", 67,	0x1b8,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
+PERIPH_CLK(dvc,		"tegra-i2c.3",		"div-clk", 47,	0x128,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
 PERIPH_CLK(i2c1_i2c,	"tegra-i2c.0",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
 PERIPH_CLK(i2c2_i2c,	"tegra-i2c.1",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
 PERIPH_CLK(i2c3_i2c,	"tegra-i2c.2",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
diff --git a/arch/arm/mach-tegra/tegra30_clocks_data.c b/arch/arm/mach-tegra/tegra30_clocks_data.c
index eae85b7..45da437 100644
--- a/arch/arm/mach-tegra/tegra30_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra30_clocks_data.c
@@ -1070,11 +1070,11 @@ PERIPH_CLK(la,		"la",			NULL,	76,	0x1f8,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX
 PERIPH_CLK(owr,		"tegra_w1",		NULL,	71,	0x1cc,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71 | PERIPH_ON_APB);
 PERIPH_CLK(nor,		"nor",			NULL,	42,	0x1d0,	127000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71); /* requires min voltage */
 PERIPH_CLK(mipi,	"mipi",			NULL,	50,	0x174,	60000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71 | PERIPH_ON_APB); /* scales with voltage */
-PERIPH_CLK(i2c1,	"tegra-i2c.0",		NULL,	12,	0x124,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
-PERIPH_CLK(i2c2,	"tegra-i2c.1",		NULL,	54,	0x198,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
-PERIPH_CLK(i2c3,	"tegra-i2c.2",		NULL,	67,	0x1b8,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
-PERIPH_CLK(i2c4,	"tegra-i2c.3",		NULL,	103,	0x3c4,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
-PERIPH_CLK(i2c5,	"tegra-i2c.4",		NULL,	47,	0x128,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
+PERIPH_CLK(i2c1,	"tegra-i2c.0",		"div-clk", 12,	0x124,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
+PERIPH_CLK(i2c2,	"tegra-i2c.1",		"div-clk", 54,	0x198,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
+PERIPH_CLK(i2c3,	"tegra-i2c.2",		"div-clk", 67,	0x1b8,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
+PERIPH_CLK(i2c4,	"tegra-i2c.3",		"div-clk", 103,	0x3c4,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
+PERIPH_CLK(i2c5,	"tegra-i2c.4",		"div-clk", 47,	0x128,	26000000,  mux_pllp_clkm,		MUX | DIV_U16 | PERIPH_ON_APB);
 PERIPH_CLK(uarta,	"tegra-uart.0",		NULL,	6,	0x178,	800000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71 | DIV_U71_UART | PERIPH_ON_APB);
 PERIPH_CLK(uartb,	"tegra-uart.1",		NULL,	7,	0x17c,	800000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71 | DIV_U71_UART | PERIPH_ON_APB);
 PERIPH_CLK(uartc,	"tegra-uart.2",		NULL,	55,	0x1a0,	800000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71 | DIV_U71_UART | PERIPH_ON_APB);
-- 
1.7.1.1
