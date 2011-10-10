From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2 11/14] ARM: tegra: tegra2_clocks: don't export some tables
Date: Sun,  9 Oct 2011 22:28:01 -0700
Message-ID: <1318224484-2090-12-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
 <1318224484-2090-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318224484-2090-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Not used externally, and certainly don't need to be exported.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/tegra2_clocks.c |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 6dd5133..371869d 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -1885,7 +1885,7 @@ static struct clk tegra_clk_audio_2x = {
 	},
 };
 
-struct clk_lookup tegra_audio_clk_lookups[] = {
+static struct clk_lookup tegra_audio_clk_lookups[] = {
 	{ .con_id = "audio", .clk = &tegra_clk_audio },
 	{ .con_id = "audio_2x", .clk = &tegra_clk_audio_2x }
 };
@@ -2125,7 +2125,7 @@ static struct clk tegra_clk_emc = {
 		.parent = _parent,			\
 	}
 
-struct clk tegra_list_clks[] = {
+static struct clk tegra_list_clks[] = {
 	PERIPH_CLK("apbdma",	"tegra-dma",		NULL,	34,	0,	108000000, mux_pclk,			0),
 	PERIPH_CLK("rtc",	"rtc-tegra",		NULL,	4,	0,	32768,     mux_clk_32k,			PERIPH_NO_RESET),
 	PERIPH_CLK("timer",	"timer",		NULL,	5,	0,	26000000,  mux_clk_m,			0),
@@ -2221,7 +2221,7 @@ struct clk tegra_list_clks[] = {
  * configuration.  List those here to register them twice in the clock lookup
  * table under two names.
  */
-struct clk_duplicate tegra_clk_duplicates[] = {
+static struct clk_duplicate tegra_clk_duplicates[] = {
 	CLK_DUPLICATE("uarta",	"tegra_uart.0",	NULL),
 	CLK_DUPLICATE("uartb",	"tegra_uart.1",	NULL),
 	CLK_DUPLICATE("uartc",	"tegra_uart.2",	NULL),
@@ -2252,7 +2252,7 @@ struct clk_duplicate tegra_clk_duplicates[] = {
 		.clk = ck,	\
 	}
 
-struct clk *tegra_ptr_clks[] = {
+static struct clk *tegra_ptr_clks[] = {
 	&tegra_clk_32k,
 	&tegra_pll_s,
 	&tegra_clk_m,
-- 
1.7.4.1
