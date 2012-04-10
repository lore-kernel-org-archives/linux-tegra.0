From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v6 06/17] ARM: tegra: Fix PWM clock programming
Date: Tue, 10 Apr 2012 17:06:29 +0200
Message-ID: <1334070400-25013-7-git-send-email-thierry.reding@avionic-design.de>
References: <1334070400-25013-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1334070400-25013-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Cc: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Bernhard Walle <walle-pDveNdigDaDu9UdzE1sIFA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>

PWM clock source registers in Tegra 2 have different clock source selection bit
fields than other registers.  PWM clock source bits in CLK_SOURCE_PWM_0 register
are located at bit field bit[30:28] while others are at bit field bit[31:30] in
their respective clock source register.

This patch updates the clock programming to correctly reflect that, by adding a
flag to indicate the alternate bit field format and checking for it when
selecting a clock source (parent clock).

Signed-off-by: Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Acked-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
---
Changes in v4:
  - reuse PWM flag from Tegra 30 clock programming
  - mask out bit 31 explicitly

 arch/arm/mach-tegra/tegra2_clocks.c |   32 ++++++++++++++++++++++++++++----
 1 file changed, 28 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra2_clocks.c
index 592a4ee..64735bd 100644
--- a/arch/arm/mach-tegra/tegra2_clocks.c
+++ b/arch/arm/mach-tegra/tegra2_clocks.c
@@ -69,6 +69,8 @@
 
 #define PERIPH_CLK_SOURCE_MASK		(3<<30)
 #define PERIPH_CLK_SOURCE_SHIFT		30
+#define PERIPH_CLK_SOURCE_PWM_MASK	(7<<28)
+#define PERIPH_CLK_SOURCE_PWM_SHIFT	28
 #define PERIPH_CLK_SOURCE_ENABLE	(1<<28)
 #define PERIPH_CLK_SOURCE_DIVU71_MASK	0xFF
 #define PERIPH_CLK_SOURCE_DIVU16_MASK	0xFFFF
@@ -908,9 +910,20 @@ static void tegra2_periph_clk_init(struct clk *c)
 	u32 val = clk_readl(c->reg);
 	const struct clk_mux_sel *mux = NULL;
 	const struct clk_mux_sel *sel;
+	u32 shift;
+	u32 mask;
+
+	if (c->flags & MUX_PWM) {
+		shift = PERIPH_CLK_SOURCE_PWM_SHIFT;
+		mask = PERIPH_CLK_SOURCE_PWM_MASK;
+	} else {
+		shift = PERIPH_CLK_SOURCE_SHIFT;
+		mask = PERIPH_CLK_SOURCE_MASK;
+	}
+
 	if (c->flags & MUX) {
 		for (sel = c->inputs; sel->input != NULL; sel++) {
-			if (val >> PERIPH_CLK_SOURCE_SHIFT == sel->value)
+			if ((val & mask) >> shift == sel->value)
 				mux = sel;
 		}
 		BUG_ON(!mux);
@@ -1023,12 +1036,23 @@ static int tegra2_periph_clk_set_parent(struct clk *c, struct clk *p)
 {
 	u32 val;
 	const struct clk_mux_sel *sel;
+	u32 mask, shift;
+
 	pr_debug("%s: %s %s\n", __func__, c->name, p->name);
+
+	if (c->flags & MUX_PWM) {
+		shift = PERIPH_CLK_SOURCE_PWM_SHIFT;
+		mask = PERIPH_CLK_SOURCE_PWM_MASK;
+	} else {
+		shift = PERIPH_CLK_SOURCE_SHIFT;
+		mask = PERIPH_CLK_SOURCE_MASK;
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
@@ -2146,7 +2170,7 @@ static struct clk tegra_list_clks[] = {
 	PERIPH_CLK("i2s2",	"tegra-i2s.1",		NULL,	18,	0x104,	26000000,  mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_out",	"spdif_out",		NULL,	10,	0x108,	100000000, mux_pllaout0_audio2x_pllp_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("spdif_in",	"spdif_in",		NULL,	10,	0x10c,	100000000, mux_pllp_pllc_pllm,		MUX | DIV_U71),
-	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71),
+	PERIPH_CLK("pwm",	"pwm",			NULL,	17,	0x110,	432000000, mux_pllp_pllc_audio_clkm_clk32,	MUX | DIV_U71 | MUX_PWM),
 	PERIPH_CLK("spi",	"spi",			NULL,	43,	0x114,	40000000,  mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("xio",	"xio",			NULL,	45,	0x120,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
 	PERIPH_CLK("twc",	"twc",			NULL,	16,	0x12c,	150000000, mux_pllp_pllc_pllm_clkm,	MUX | DIV_U71),
-- 
1.7.9.6
