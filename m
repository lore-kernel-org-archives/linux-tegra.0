From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [RFC 4/7] arm: tegra: Fix PWM clock programming
Date: Tue, 20 Dec 2011 11:32:15 +0100
Message-ID: <1324377138-32129-5-git-send-email-thierry.reding@avionic-design.de>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324377138-32129-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

PWM clock source registers in Tegra 2 have different clock source selection bit
fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0 register
are located at bit field bit[30:28] while others are at bit field bit[31:30] in
their respective clock source register.

This patch updates the clock programming to correctly reflect that, by adding a
flag to indicate the alternate bit field format and checking for it when
selecting a clock source (parent clock).

Also, adjusts for the frequency divider being offset by 1.

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
 arch/arm/mach-tegra/clock.h         |    1 +
 arch/arm/mach-tegra/tegra2_clocks.c |   28 ++++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/clock.h b/arch/arm/mach-tegra/clock.h
index 688316a..ebf4bcd 100644
--- a/arch/arm/mach-tegra/clock.h
+++ b/arch/arm/mach-tegra/clock.h
@@ -39,6 +39,7 @@
 #define PERIPH_MANUAL_RESET	(1 << 12)
 #define PLL_ALT_MISC_REG	(1 << 13)
 #define PLLU			(1 << 14)
+#define PERIPH_SOURCE_CLK_4BIT	(1 << 15)
 #define ENABLE_ON_INIT		(1 << 28)
 
 struct clk;
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 371869d..21729fa 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -69,6 +69,8 @@
 
 #define PERIPH_CLK_SOURCE_MASK		(3<<30)
 #define PERIPH_CLK_SOURCE_SHIFT		30
+#define PERIPH_CLK_SOURCE_4BIT_MASK	(7<<28)
+#define PERIPH_CLK_SOURCE_4BIT_SHIFT	28
 #define PERIPH_CLK_SOURCE_ENABLE	(1<<28)
 #define PERIPH_CLK_SOURCE_DIVU71_MASK	0xFF
 #define PERIPH_CLK_SOURCE_DIVU16_MASK	0xFFFF
@@ -920,9 +922,16 @@ static void tegra2_periph_clk_init(struct clk *c)
 	u32 val = clk_readl(c->reg);
 	const struct clk_mux_sel *mux = NULL;
 	const struct clk_mux_sel *sel;
+	u32 shift;
+
+	if (c->flags & PERIPH_SOURCE_CLK_4BIT)
+		shift = PERIPH_CLK_SOURCE_4BIT_SHIFT;
+	else
+		shift = PERIPH_CLK_SOURCE_SHIFT;
+
 	if (c->flags & MUX) {
 		for (sel = c->inputs; sel->input != NULL; sel++) {
-			if (val >> PERIPH_CLK_SOURCE_SHIFT == sel->value)
+			if (val >> shift == sel->value)
 				mux = sel;
 		}
 		BUG_ON(!mux);
@@ -1035,12 +1044,23 @@ static int tegra2_periph_clk_set_parent(struct clk *c, struct clk *p)
 {
 	u32 val;
 	const struct clk_mux_sel *sel;
+	u32 mask, shift;
+
 	pr_debug("%s: %s %s\n", __func__, c->name, p->name);
+
+	if (c->flags & PERIPH_SOURCE_CLK_4BIT) {
+		mask = PERIPH_CLK_SOURCE_4BIT_MASK;
+		shift = PERIPH_CLK_SOURCE_4BIT_SHIFT;
+	} else {
+		mask = PERIPH_CLK_SOURCE_MASK;
+		shift = PERIPH_CLK_SOURCE_SHIFT;
+	}
+
 	for (sel = c->inputs; sel->input != NULL; sel++) {
 		if (sel->input == p) {
 			val = clk_readl(c->reg);
-			val &= ~PERIPH_CLK_SOURCE_MASK;
-			val |= (sel->value) << PERIPH_CLK_SOURCE_SHIFT;
+			val &= ~mask;
+			val |= (sel->value) << shift;
 
 			if (c->refcnt)
 				clk_enable(p);
@@ -2133,7 +2153,7 @@ static struct clk tegra_list_clks[] = {
 	PERIPH_CLK("i2s2",	"tegra-i2s.1",		NULL,	18,	0x104,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_out",	"spdif_out",		NULL,	10,	0x108,	100000000, mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_in",	"spdif_in",		NULL,	10,	0x10c,	100000000, mux_pllp_pllc_pllm,		MUX | DIV_U71),
-	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71),
+	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71 | PERIPH_SOURCE_CLK_4BIT),
 	PERIPH_CLK("spi",	"spi",			NULL,	43,	0x114,	40000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("xio",	"xio",			NULL,	45,	0x120,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("twc",	"twc",			NULL,	16,	0x12c,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
-- 
1.7.8
