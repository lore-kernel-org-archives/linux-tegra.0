From: Jonas Gorski <jonas.gorski@gmail.com>
Subject: [PATCH RFT V3 0/8] clk: make register endianness a run-time property
Date: Thu, 18 Apr 2019 13:12:03 +0200
Message-ID: <20190418111211.10474-1-jonas.gorski@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
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

Currently the endianness for register accesses of basic clocks if fixed
based on the architecture (BE for PowerPC, LE for everyone else). This
is inconvenient for architectures that support both.

To avoid adding more rules to the #ifdef, this patchset adds new flags
to the basic clocks to tag the registers as BE then converts the only
big endian machine PowerPC to use it.

While not used by PowerPC, also add big endian support to clk-fractional-
divider and clk-multiplier, to cover all basic clocks.
Technically clk-multiplier isn't one as it doesn't provide any
registration functions and none of its users set the basic clock flag,
but nevertheless it and its flags are defined clk-provider.h. So I think
it's close enough to a basic clock to still count.

That way we can drop the special casing for PowerPC, and allow other big
endian platforms/drivers to make use of the basic clocks.

In addition, we can now drop clk_readl and clk_writel, and replace them
with normal readl and writel accessors everywhere.

Still RFT because I don't have a PowerPC device to test, and especially
not a 512x one. I did compile test it though!

I looked really hard, and this is the only place I could find where a
PowerPC platform (indirectly) used the clk accessors.

None of the regular drivers in clk/ were selected in any of the powerpc
defconfigs, and this was the only platform code that registered basic
clocks.

Changelog:

V2 -> V3:
 * fix passed arguments to clk_div_readl found by kbuild
 * drop unneeded else in generic read accessors
 * fix a >80 chars line issue in the powerpc patch

V1 -> V2:
 * switch from global flag to per-clock flag
 * also added fractional divider and multiplier clocks, to make all
   basic or quasi basic clocks support big endian
 * reordered the basic clock patches in alphabetical order
 * drop clk_{readl,writel} instead of adding BE variants and use
   common accessors directly
 * dropped the RFC, as I got comments (yay). More always welcome of
   course :-)

Jonas Gorski (8):
  clk: divider: add explicit big endian support
  clk: fractional-divider: add explicit big endian support
  clk: gate: add explicit big endian support
  clk: multiplier: add explicit big endian support
  clk: mux: add explicit big endian support
  powerpc/512x: mark clocks as big endian
  clk: core: remove powerpc special handling
  clk: core: replace clk_{readl,writel} with {readl,writel}

 arch/powerpc/platforms/512x/clock-commonclk.c |  9 +++--
 drivers/clk/clk-divider.c                     | 26 +++++++++++---
 drivers/clk/clk-fractional-divider.c          | 22 ++++++++++--
 drivers/clk/clk-gate.c                        | 22 ++++++++++--
 drivers/clk/clk-multiplier.c                  | 22 ++++++++++--
 drivers/clk/clk-mux.c                         | 22 ++++++++++--
 drivers/clk/clk-xgene.c                       |  6 ++--
 drivers/clk/hisilicon/clk-hisi-phase.c        |  4 +--
 drivers/clk/imx/clk-divider-gate.c            | 20 +++++------
 drivers/clk/imx/clk-sccg-pll.c                | 12 +++----
 drivers/clk/nxp/clk-lpc18xx-ccu.c             |  6 ++--
 drivers/clk/nxp/clk-lpc18xx-cgu.c             | 24 ++++++-------
 drivers/clk/rockchip/clk-ddr.c                |  2 +-
 drivers/clk/rockchip/clk-half-divider.c       |  6 ++--
 drivers/clk/tegra/clk-tegra124.c              |  4 +--
 drivers/clk/tegra/clk-tegra210.c              |  6 ++--
 drivers/clk/zynq/clkc.c                       |  6 ++--
 drivers/clk/zynq/pll.c                        | 18 +++++-----
 include/linux/clk-provider.h                  | 51 +++++++++++----------------
 19 files changed, 181 insertions(+), 107 deletions(-)

-- 
2.13.2
