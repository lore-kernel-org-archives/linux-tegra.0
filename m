From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: clock: remove unused clock entry for i2c
Date: Wed, 8 Aug 2012 13:21:34 +0530
Message-ID: <1344412294-2420-5-git-send-email-ldewangan@nvidia.com>
References: <1344412294-2420-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1344412294-2420-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, w.sang-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org, khali-PUYAD+kWke1g9hUCZPvPmw@public.gmane.org
Cc: ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Tegra20 clock table have the entry for clock (tegra_i2c.x, "i2c")
which is no more require as driver acquire clock with name of
"div-clk" and "fast-clk".
Remove these entries from table.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/tegra20_clocks_data.c |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-tegra/tegra20_clocks_data.c
index c1318c2..6516beb 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -893,10 +893,6 @@ PERIPH_CLK(i2c1,	"tegra-i2c.0",		"div-clk", 12,	0x124,	26000000,  mux_pllp_pllc_
 PERIPH_CLK(i2c2,	"tegra-i2c.1",		"div-clk", 54,	0x198,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
 PERIPH_CLK(i2c3,	"tegra-i2c.2",		"div-clk", 67,	0x1b8,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
 PERIPH_CLK(dvc,		"tegra-i2c.3",		"div-clk", 47,	0x128,	26000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U16);
-PERIPH_CLK(i2c1_i2c,	"tegra-i2c.0",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
-PERIPH_CLK(i2c2_i2c,	"tegra-i2c.1",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
-PERIPH_CLK(i2c3_i2c,	"tegra-i2c.2",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
-PERIPH_CLK(dvc_i2c,	"tegra-i2c.3",		"i2c",	0,	0,	72000000,  mux_pllp_out3,			0);
 PERIPH_CLK(uarta,	"tegra-uart.0",		NULL,	6,	0x178,	600000000, mux_pllp_pllc_pllm_clkm,	MUX);
 PERIPH_CLK(uartb,	"tegra-uart.1",		NULL,	7,	0x17c,	600000000, mux_pllp_pllc_pllm_clkm,	MUX);
 PERIPH_CLK(uartc,	"tegra-uart.2",		NULL,	55,	0x1a0,	600000000, mux_pllp_pllc_pllm_clkm,	MUX);
@@ -962,10 +958,6 @@ static struct clk *tegra_list_clks[] = {
 	&tegra_i2c2,
 	&tegra_i2c3,
 	&tegra_dvc,
-	&tegra_i2c1_i2c,
-	&tegra_i2c2_i2c,
-	&tegra_i2c3_i2c,
-	&tegra_dvc_i2c,
 	&tegra_uarta,
 	&tegra_uartb,
 	&tegra_uartc,
-- 
1.7.1.1
