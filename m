From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH RFT V3 2/8] clk: fractional-divider: add explicit big endian
 support
Date: Thu, 18 Apr 2019 13:12:05 +0200
Message-ID: <20190418111211.10474-3-jonas.gorski@gmail.com>
References: <20190418111211.10474-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418111211.10474-1-jonas.gorski@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Fabio Estevam <festevam@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Stephen Boyd <sboyd@kernel.org>, Benjamin Herrenschmidt <benh@kernel.crashing.org>, Michael Turquette <mturquette@baylibre.com>, Michal Simek <michal.simek@xilinx.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Paul Mackerras <paulus@samba.org>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Michael Ellerman <mpe@ellerman.id.au>, Thierry Reding <thierry.reding@gmail.com>, Anatolij Gustschin <agust@denx.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>
List-Id: linux-tegra@vger.kernel.org

Add a clock specific flag to switch register accesses to big endian, to
allow runtime configuration of big endian fractional divider clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * drop unneeded else in clk_fd_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-fractional-divider.c | 22 +++++++++++++++++++---
 include/linux/clk-provider.h         |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-fractional-divider.c b/drivers/clk/clk-fractional-divider.c
index fdfe2e423d15..f88df265e787 100644
--- a/drivers/clk/clk-fractional-divider.c
+++ b/drivers/clk/clk-fractional-divider.c
@@ -13,6 +13,22 @@
 #include <linux/slab.h>
 #include <linux/rational.h>
 
+static inline u32 clk_fd_readl(struct clk_fractional_divider *fd)
+{
+	if (fd->flags & CLK_FRAC_DIVIDER_BIG_ENDIAN)
+		return ioread32be(fd->reg);
+
+	return clk_readl(fd->reg);
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
