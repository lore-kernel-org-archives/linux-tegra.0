From: Mirza Krak <mirza.krak@gmail.com>
Subject: [PATCH V3 1/6] clk: tegra: add TEGRA20_CLK_NOR to init table
Date: Thu, 27 Oct 2016 16:01:07 +0200
Message-ID: <1477576872-2665-2-git-send-email-mirza.krak@gmail.com>
References: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1477576872-2665-1-git-send-email-mirza.krak@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@wwwdotorg.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: mark.rutland@arm.com, gnurou@gmail.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, pdeschrijver@nvidia.com, Mirza Krak <mirza.krak@gmail.com>, sboyd@codeaurora.org, linux@armlinux.org.uk, linux-kernel@vger.kernel.org, robh+dt@kernel.org, linux-tegra@vger.kernel.org, mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

From: Mirza Krak <mirza.krak@gmail.com>

Add TEGRA20_CLK_NOR to init table and set default rate to 92 MHz which
is max rate.

The maximum rate value of 92 MHz is pulled from the downstream L4T
kernel.

Signed-off-by: Mirza Krak <mirza.krak@gmail.com>
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
Tested-on: Colibri T20/T30 on EvalBoard V3.x and GMI-Memory Board
---

Changes in v2:
- no changes

Changes in v3:
- Added comment in commit message where I got the maximum rates from.

 drivers/clk/tegra/clk-tegra20.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
index 837e5cb..13d3b5a 100644
--- a/drivers/clk/tegra/clk-tegra20.c
+++ b/drivers/clk/tegra/clk-tegra20.c
@@ -1047,6 +1047,7 @@ static struct tegra_clk_init_table init_table[] __initdata = {
 	{ TEGRA20_CLK_SDMMC3, TEGRA20_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA20_CLK_SDMMC4, TEGRA20_CLK_PLL_P, 48000000, 0 },
 	{ TEGRA20_CLK_SPI, TEGRA20_CLK_PLL_P, 20000000, 0 },
+	{ TEGRA20_CLK_NOR, TEGRA20_CLK_PLL_P, 92000000, 0 },
 	{ TEGRA20_CLK_SBC1, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_SBC2, TEGRA20_CLK_PLL_P, 100000000, 0 },
 	{ TEGRA20_CLK_SBC3, TEGRA20_CLK_PLL_P, 100000000, 0 },
--
2.1.4
