From: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH RFT V2 2/8] clk: fractional-divider: add explicit big endian
 support
Date: Mon, 15 Apr 2019 12:10:40 +0200
Message-ID: <20190415101046.5872-3-jonas.gorski@gmail.com>
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
allow runtime configuration of big endian fractional divider clocks.

Signed-off-by: Jonas Gorski <jonas.gorski-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
V1 -> V2:
 * newly added patch

 drivers/clk/clk-fractional-divider.c | 22 +++++++++++++++++++---
 include/linux/clk-provider.h         |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index fdfe2e423d15..b9988d3b3828 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -13,6 +13,22 @@
 #include <linux/slab.h>
 #include <linux/rational.h>
 
+static inline u32 clk_fd_readl(struct clk_fractional_divider *fd)
+{
+	if (fd->flags & CLK_FRAC_DIVIDER_BIG_ENDIAN)
+		return ioread32be(fd->reg);
+	else
+		return clk_readl(fd->reg);
+}
+
+static inline void clk_fd_writel(struct clk_fractional_divider *fd, u32 val)
+{
+	if (fd->flags & CLK_FRAC_DIVIDER_BIG_ENDIAN)
+		iowrite32be(val, fd->reg);
+	else
+		clk_writel(val, fd->reg);
+}
+
 static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 					unsigned long parent_rate)
 {
@@ -27,7 +43,7 @@ static unsigned long clk_fd_recalc_rate(struct clk_hw *hw,
 	else
 		__acquire(fd->lock);
 
-	val = clk_readl(fd->reg);
+	val = clk_fd_readl(fd);
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
@@ -115,10 +131,10 @@ static int clk_fd_set_rate(struct clk_hw *hw, unsigned long rate,
 	else
 		__acquire(fd->lock);
 
-	val = clk_readl(fd->reg);
+	val = clk_fd_readl(fd);
 	val &= ~(fd->mmask | fd->nmask);
 	val |= (m << fd->mshift) | (n << fd->nshift);
-	clk_writel(val, fd->reg);
+	clk_fd_writel(fd, val);
 
 	if (fd->lock)
 		spin_unlock_irqrestore(fd->lock, flags);
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 7117b8cc0c0c..8c07d810acf5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -607,6 +607,9 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
  *	is the value read from the register. If CLK_FRAC_DIVIDER_ZERO_BASED
  *	is set then the numerator and denominator are both the value read
  *	plus one.
+ * CLK_FRAC_DIVIDER_BIG_ENDIAN - By default little endian register accesses are
+ *	used for the divider register.  Setting this flag makes the register
+ *	accesses big endian.
  */
 struct clk_fractional_divider {
 	struct clk_hw	hw;
@@ -627,6 +630,7 @@ struct clk_fractional_divider {
 #define to_clk_fd(_hw) container_of(_hw, struct clk_fractional_divider, hw)
 
 #define CLK_FRAC_DIVIDER_ZERO_BASED		BIT(0)
+#define CLK_FRAC_DIVIDER_BIG_ENDIAN		BIT(1)
 
 extern const struct clk_ops clk_fractional_divider_ops;
 struct clk *clk_register_fractional_divider(struct device *dev,
-- 
2.13.2
