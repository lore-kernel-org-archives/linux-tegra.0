From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFT V2 4/8] clk: multiplier: add explicit big endian support
Date: Mon, 15 Apr 2019 12:10:42 +0200
Message-ID: <20190415101046.5872-5-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
In-Reply-To: <20190415101046.5872-1-jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-rockchip/>
List-Post: <mailto:linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Help: <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-rockchip>,
 <mailto:linux-rockchip-request-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org?subject=subscribe>
Sender: "Linux-rockchip" <linux-rockchip-bounces-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Errors-To: linux-rockchip-bounces+glpar-linux-rockchip=m.gmane.org-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
To: linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linuxppc-dev-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-rockchip-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Fabio Estevam <festevam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Heiko Stuebner <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Benjamin Herrenschmidt <benh-XVmvHMARGAS8U2dJNN8I7kB+6BGkLq7r@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Michal Simek <michal.simek-gjFFaj9aHVfQT0dZR+AlfA@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Paul Mackerras <paulus-eUNUBHrolfbYtjvyW6yDsg@public.gmane.org>, NXP Linux Team <linux-imx-3arQi8VN3Tc@public.gmane.org>, Pengutronix Kernel Team <kernel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Michael Ellerman <mpe-Gsx/Oe8HsFggBc27wqDAHg@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Anatolij Gustschin <agust-ynQEQJNshbs@public.gmane.org>, Shawn Guo <shawnguo-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian multiplier clocks.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
V1 -> V2:
 * newly added patch

 drivers/clk/clk-multiplier.c | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-multiplier.c b/drivers/clk/clk-multiplier.c
index 3c86f859c199..fb032f7dd407 100644
--- a/drivers/clk/clk-multiplier.c
+++ b/drivers/clk/clk-multiplier.c
@@ -11,6 +11,22 @@
 #include <linux/of.h>
 #include <linux/slab.h>
 
+static inline u32 clk_mult_readl(struct clk_multiplier *mult)
+{
+	if (mult->flags & CLK_MULTIPLIER_BIG_ENDIAN)
+		return ioread32be(mult->reg);
+	else
+		return clk_readl(mult->reg);
+}
+
+static inline void clk_mult_writel(struct clk_multiplier *mult, u32 val)
+{
+	if (mult->flags & CLK_MULTIPLIER_BIG_ENDIAN)
+		iowrite32be(val, mult->reg);
+	else
+		clk_writel(val, mult->reg);
+}
+
 static unsigned long __get_mult(struct clk_multiplier *mult,
 				unsigned long rate,
 				unsigned long parent_rate)
@@ -27,7 +43,7 @@ static unsigned long clk_multiplier_recalc_rate(struct clk_hw *hw,
 	struct clk_multiplier *mult = to_clk_multiplier(hw);
 	unsigned long val;
 
-	val = clk_readl(mult->reg) >> mult->shift;
+	val = clk_mult_readl(mult) >> mult->shift;
 	val &= GENMASK(mult->width - 1, 0);
 
 	if (!val && mult->flags & CLK_MULTIPLIER_ZERO_BYPASS)
@@ -118,10 +134,10 @@ static int clk_multiplier_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__acquire(mult->lock);
 
-	val = clk_readl(mult->reg);
+	val = clk_mult_readl(mult);
 	val &= ~GENMASK(mult->width + mult->shift - 1, mult->shift);
 	val |= factor << mult->shift;
-	clk_writel(val, mult->reg);
+	clk_mult_writel(mult, val);
 
 	if (mult->lock)
 		spin_unlock_irqrestore(mult->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8576c2dbc639..9df78e3fb62b 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -667,6 +667,9 @@ void clk_hw_unregister_fractional_divider(struct clk_hw *hw);
  *	leaving the parent rate unmodified.
  * CLK_MULTIPLIER_ROUND_CLOSEST - Makes the best calculated divider to be
  *	rounded to the closest integer instead of the down one.
+ * CLK_MULTIPLIER_BIG_ENDIAN - By default little endian register accesses are
+ *	used for the multiplier register.  Setting this flag makes the register
+ *	accesses big endian.
  */
 struct clk_multiplier {
 	struct clk_hw	hw;
@@ -681,6 +684,7 @@ struct clk_multiplier {
 
 #define CLK_MULTIPLIER_ZERO_BYPASS		BIT(0)
 #define CLK_MULTIPLIER_ROUND_CLOSEST	BIT(1)
+#define CLK_MULTIPLIER_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_multiplier_ops;
 
-- 
2.13.2
