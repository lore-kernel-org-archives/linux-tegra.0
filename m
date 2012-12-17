From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: =?UTF-8?q?=5BPATCH=5D=20ARM=3A=20tegra=3A=20dynamically=20calculate=20pll=5Fd=20parameters?=
Date: Mon, 17 Dec 2012 18:58:23 +0100
Message-ID: <1355767103-5303-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mark Zhang <nvmarkzhang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Calculate PLL_D parameters in a dynamically instead of using a fixed
table. This allows TegraDRM to drive outputs with CVT compliant modes.

Signed-off-by: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
---
Maybe we can generalize this a bit and reuse this for other PLLs. But
for now the calculation is specific to PLL_D. To make this useable for
other PLLs we need to push cpcon and valid P values into the structure
that defines a PLL.
---
 arch/arm/mach-tegra/tegra20_clocks.c      | 88 +++++++++++++++++++++++=
++++++++
 arch/arm/mach-tegra/tegra20_clocks.h      |  1 +
 arch/arm/mach-tegra/tegra20_clocks_data.c | 28 +---------
 3 Dateien ge=C3=A4ndert, 91 Zeilen hinzugef=C3=BCgt(+), 26 Zeilen entf=
ernt(-)

diff --git a/arch/arm/mach-tegra/tegra20_clocks.c b/arch/arm/mach-tegra=
/tegra20_clocks.c
index 4eb6bc8..04b0ff59 100644
--- a/arch/arm/mach-tegra/tegra20_clocks.c
+++ b/arch/arm/mach-tegra/tegra20_clocks.c
@@ -894,6 +894,94 @@ struct clk_ops tegra_plle_ops =3D {
 	.round_rate =3D tegra20_pll_clk_round_rate,
 };
=20
+static int tegra20_plld_clk_set_rate(struct clk_hw *hw, unsigned long =
rate,
+		unsigned long parent_rate)
+{
+	struct clk_tegra *c =3D to_clk_tegra(hw);
+	unsigned long input_rate =3D parent_rate;
+	u64 n =3D 0;
+	int m_max, m_min, m =3D 0;
+	u32 val, rem =3D 0;
+	u8 cpcon =3D 0;
+
+	m_max =3D input_rate / c->u.pll.cf_min;
+	m_min =3D (input_rate / c->u.pll.cf_max) + 1;
+
+	for (m =3D m_min; m <=3D m_max; m++) {
+		n =3D (u64)rate * m;
+		rem =3D do_div(n, input_rate);
+		if (!rem)
+			break;
+	}
+
+	if (rem)
+		return -EINVAL;
+
+	c->mul =3D n;
+	c->div =3D n;
+
+	val =3D clk_readl(c->reg + PLL_BASE);
+	val &=3D ~(PLL_BASE_DIVP_MASK | PLL_BASE_DIVN_MASK |
+		 PLL_BASE_DIVM_MASK);
+	val |=3D (m << PLL_BASE_DIVM_SHIFT) | (n << PLL_BASE_DIVN_SHIFT);
+	clk_writel(val, c->reg + PLL_BASE);
+
+	if (n <=3D 50)
+		cpcon =3D 2;
+	else if (n <=3D 300)
+		cpcon =3D 4;
+	else if (n <=3D 600)
+		cpcon =3D 8;
+	else if (n <=3D 1000)
+		cpcon =3D 12;
+
+	val =3D clk_readl(c->reg + PLL_MISC(c));
+	val &=3D ~PLL_MISC_CPCON_MASK;
+	val |=3D cpcon << PLL_MISC_CPCON_SHIFT;
+	clk_writel(val, c->reg + PLL_MISC(c));
+
+
+	if (c->state =3D=3D ON)
+		tegra20_pll_clk_enable(hw);
+
+	return 0;
+}
+
+static long tegra20_plld_clk_round_rate(struct clk_hw *hw, unsigned lo=
ng rate,
+				unsigned long *prate)
+{
+	struct clk_tegra *c =3D to_clk_tegra(hw);
+	unsigned long input_rate =3D *prate;
+	u64 n;
+	u32 rem;
+	int m_max, m_min, m;
+
+	if (rate < c->u.pll.vco_min || rate > c->u.pll.vco_max)
+		return -EINVAL;
+
+	m_max =3D input_rate / c->u.pll.cf_min;
+	m_min =3D (input_rate / c->u.pll.cf_max) + 1;
+
+	/* check if we can find an matching integer N */
+	for (m =3D m_min; m <=3D m_max; m++) {
+		n =3D (u64)rate * m;
+		rem =3D do_div(n, input_rate);
+		if (!rem)
+			return rate;
+	}
+
+	return -EINVAL;
+}
+
+struct clk_ops tegra_plld_ops =3D {
+	.is_enabled =3D tegra20_pll_clk_is_enabled,
+	.enable =3D tegra20_pll_clk_enable,
+	.disable =3D tegra20_pll_clk_disable,
+	.set_rate =3D tegra20_plld_clk_set_rate,
+	.recalc_rate =3D tegra20_pll_clk_recalc_rate,
+	.round_rate =3D tegra20_plld_clk_round_rate,
+};
+
 /* Clock divider ops */
 static int tegra20_pll_div_clk_is_enabled(struct clk_hw *hw)
 {
diff --git a/arch/arm/mach-tegra/tegra20_clocks.h b/arch/arm/mach-tegra=
/tegra20_clocks.h
index 8bfd31b..b7bfe87 100644
--- a/arch/arm/mach-tegra/tegra20_clocks.h
+++ b/arch/arm/mach-tegra/tegra20_clocks.h
@@ -21,6 +21,7 @@ extern struct clk_ops tegra_clk_32k_ops;
 extern struct clk_ops tegra_pll_ops;
 extern struct clk_ops tegra_clk_m_ops;
 extern struct clk_ops tegra_pll_div_ops;
+extern struct clk_ops tegra_plld_ops;
 extern struct clk_ops tegra_pllx_ops;
 extern struct clk_ops tegra_plle_ops;
 extern struct clk_ops tegra_clk_double_ops;
diff --git a/arch/arm/mach-tegra/tegra20_clocks_data.c b/arch/arm/mach-=
tegra/tegra20_clocks_data.c
index a23a073..5a190ec 100644
--- a/arch/arm/mach-tegra/tegra20_clocks_data.c
+++ b/arch/arm/mach-tegra/tegra20_clocks_data.c
@@ -240,33 +240,9 @@ DEFINE_PLL(pll_a, PLL_HAS_CPCON, 0xb0, 73728000, 2=
000000, 31000000, 1000000,
 DEFINE_PLL_OUT(pll_a_out0, DIV_U71, 0xb4, 0, 73728000,
 		tegra_pll_div_ops, pll_a, 0);
=20
-static struct clk_pll_freq_table tegra_pll_d_freq_table[] =3D {
-	{ 12000000, 216000000, 216, 12, 1, 4},
-	{ 13000000, 216000000, 216, 13, 1, 4},
-	{ 19200000, 216000000, 135, 12, 1, 3},
-	{ 26000000, 216000000, 216, 26, 1, 4},
-
-	{ 12000000, 297000000,  99,  4, 1, 4 },
-	{ 12000000, 339000000, 113,  4, 1, 4 },
-
-	{ 12000000, 594000000, 594, 12, 1, 8},
-	{ 13000000, 594000000, 594, 13, 1, 8},
-	{ 19200000, 594000000, 495, 16, 1, 8},
-	{ 26000000, 594000000, 594, 26, 1, 8},
-
-	{ 12000000, 616000000, 616, 12, 1, 8},
-
-	{ 12000000, 1000000000, 1000, 12, 1, 12},
-	{ 13000000, 1000000000, 1000, 13, 1, 12},
-	{ 19200000, 1000000000, 625,  12, 1, 8},
-	{ 26000000, 1000000000, 1000, 26, 1, 12},
-
-	{ 0, 0, 0, 0, 0, 0 },
-};
-
 DEFINE_PLL(pll_d, PLL_HAS_CPCON | PLLD, 0xd0, 1000000000, 2000000, 400=
00000,
-		1000000, 6000000, 40000000, 1000000000, tegra_pll_d_freq_table,
-		1000, tegra_pll_ops, 0, clk_m);
+		1000000, 6000000, 40000000, 1000000000, NULL,
+		1000, tegra_plld_ops, 0, clk_m);
=20
 DEFINE_PLL_OUT(pll_d_out0, DIV_2 | PLLD, 0, 0, 500000000,
 		tegra_pll_div_ops, pll_d, CLK_SET_RATE_PARENT);
--=20
1.7.11.7
