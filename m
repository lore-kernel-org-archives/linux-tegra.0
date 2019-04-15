From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH RFT V2 6/8] powerpc/512x: mark clocks as big endian
Date: Mon, 15 Apr 2019 12:10:44 +0200
Message-ID: <20190415101046.5872-7-jonas.gorski@gmail.com>
References: <20190415101046.5872-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190415101046.5872-1-jonas.gorski@gmail.com>
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

These clocks' registers are accessed as big endian, so mark them as
such.

Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
---
V1 -> V2:
 * switch from global to local flags

 arch/powerpc/platforms/512x/clock-commonclk.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/512x/clock-commonclk.c b/arch/powerpc/platforms/512x/clock-commonclk.c
index b3097fe6441b..0072330350fa 100644
--- a/arch/powerpc/platforms/512x/clock-commonclk.c
+++ b/arch/powerpc/platforms/512x/clock-commonclk.c
@@ -240,7 +240,8 @@ static inline struct clk *mpc512x_clk_divider(
 	u32 __iomem *reg, u8 pos, u8 len, int divflags)
 {
 	return clk_register_divider(NULL, name, parent_name, clkflags,
-				    reg, pos, len, divflags, &clklock);
+				    reg, pos, len,
+				    divflags | CLK_DIVIDER_BIG_ENDIAN, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_divtable(
@@ -250,7 +251,7 @@ static inline struct clk *mpc512x_clk_divtable(
 {
 	u8 divflags;
 
-	divflags = 0;
+	divflags = CLK_DIVIDER_BIG_ENDIAN;
 	return clk_register_divider_table(NULL, name, parent_name, 0,
 					  reg, pos, len, divflags,
 					  divtab, &clklock);
@@ -261,10 +262,12 @@ static inline struct clk *mpc512x_clk_gated(
 	u32 __iomem *reg, u8 pos)
 {
 	int clkflags;
+	u8 gateflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
+	gateflags = CLK_GATE_BIG_ENDIAN;
 	return clk_register_gate(NULL, name, parent_name, clkflags,
-				 reg, pos, 0, &clklock);
+				 reg, pos, gateflags, &clklock);
 }
 
 static inline struct clk *mpc512x_clk_muxed(const char *name,
@@ -275,7 +278,7 @@ static inline struct clk *mpc512x_clk_muxed(const char *name,
 	u8 muxflags;
 
 	clkflags = CLK_SET_RATE_PARENT;
-	muxflags = 0;
+	muxflags = CLK_MUX_BIG_ENDIAN;
 	return clk_register_mux(NULL, name,
 				parent_names, parent_count, clkflags,
 				reg, pos, len, muxflags, &clklock);
-- 
2.13.2
