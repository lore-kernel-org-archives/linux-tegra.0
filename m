From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH RFT V3 3/8] clk: gate: add explicit big endian support
Date: Thu, 18 Apr 2019 13:12:06 +0200
Message-ID: <20190418111211.10474-4-jonas.gorski@gmail.com>
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
allow runtime configuration of big endian gated clocks.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V2 -> V3:
 * drop unneeded else in clk_gate_readl
V1 -> V2:
 * switch from global to local flag

 drivers/clk/clk-gate.c       | 22 +++++++++++++++++++---
 include/linux/clk-provider.h |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index f05823cd9b21..6ced7b1f5585 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -23,6 +23,22 @@
  * parent - fixed parent.  No clk_set_parent support
  */
 
+static inline u32 clk_gate_readl(struct clk_gate *gate)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		return ioread32be(gate->reg);
+
+	return clk_readl(gate->reg);
+}
+
+static inline void clk_gate_writel(struct clk_gate *gate, u32 val)
+{
+	if (gate->flags & CLK_GATE_BIG_ENDIAN)
+		iowrite32be(val, gate->reg);
+	else
+		clk_writel(val, gate->reg);
+}
+
 /*
  * It works on following logic:
  *
@@ -55,7 +71,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 		if (set)
 			reg |= BIT(gate->bit_idx);
 	} else {
-		reg = clk_readl(gate->reg);
+		reg = clk_gate_readl(gate);
 
 		if (set)
 			reg |= BIT(gate->bit_idx);
@@ -63,7 +79,7 @@ static void clk_gate_endisable(struct clk_hw *hw, int enable)
 			reg &= ~BIT(gate->bit_idx);
 	}
 
-	clk_writel(reg, gate->reg);
+	clk_gate_writel(gate, reg);
 
 	if (gate->lock)
 		spin_unlock_irqrestore(gate->lock, flags);
@@ -88,7 +104,7 @@ int clk_gate_is_enabled(struct clk_hw *hw)
 	u32 reg;
 	struct clk_gate *gate = to_clk_gate(hw);
 
-	reg = clk_readl(gate->reg);
+	reg = clk_gate_readl(gate);
 
 	/* if a set bit disables this clk, flip it before masking */
 	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 8c07d810acf5..8576c2dbc639 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -348,6 +348,9 @@ void of_fixed_clk_setup(struct device_node *np);
  *	of this register, and mask of gate bits are in higher 16-bit of this
  *	register.  While setting the gate bits, higher 16-bit should also be
  *	updated to indicate changing gate bits.
+ * CLK_GATE_BIG_ENDIAN - by default little endian register accesses are used for
+ *	the gate register.  Setting this flag makes the register accesses big
+ *	endian.
  */
 struct clk_gate {
 	struct clk_hw hw;
@@ -361,6 +364,7 @@ struct clk_gate {
 
 #define CLK_GATE_SET_TO_DISABLE		BIT(0)
 #define CLK_GATE_HIWORD_MASK		BIT(1)
+#define CLK_GATE_BIG_ENDIAN		BIT(2)
 
 extern const struct clk_ops clk_gate_ops;
 struct clk *clk_register_gate(struct device *dev, const char *name,
-- 
2.13.2
