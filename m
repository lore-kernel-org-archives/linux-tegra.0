From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/5] clk: tegra: SOR clock rework
Date: Wed, 16 Oct 2019 14:59:14 +0200
Message-ID: <20191016125919.1773898-1-thierry.reding@gmail.com>
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
To: Thierry Reding <thierry.reding@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Mike, Stephen,

this is a small series that I've been carrying around for a while now.
The goal is to rework the SOR clock implementation on older chips to
make it compatible with the implementation on Tegra186 and later. The
reason is that Tegra186 and later implement this as part of the BPMP
(a coprocessor used for boot and power management). BPMP's SOR clock
implementation is slightly different from the implementation that we
currently have in the CCF driver for earlier SoCs.

The SOR clock is used to drive HDMI and DP outputs on Tegra boards and
the differences in the clock handling make it very cumbersome to deal
with the clock in a unified way in the display driver. After these
patches, however, they work similarly enough to allow the same code path
to be used in the display driver.

Given that this set of patches needs to go in at the same time as the
Tegra display driver changes, it'd be great if you could provide an
Acked-by so that I can take these through the Tegra tree (or the Tegra
DRM tree). There aren't any build-time dependencies between this and the
display driver changes, but HDMI/DP won't be functional if this is
merged at a different time than the display driver changes. The display
driver changes themselves are fairly large and it isn't exactly clear
when they will get merged, so things will have to be carefully
coordinated, which will be easier if I do that myself.

Thanks,
Thierry

Thierry Reding (5):
  clk: tegra: Remove last remains of TEGRA210_CLK_SOR1_SRC
  clk: tegra: Move SOR0 implementation to Tegra124
  clk: tegra: Rename sor0_lvds to sor0_out
  clk: tegra: Reimplement SOR clock on Tegra124
  clk: tegra: Reimplement SOR clocks on Tegra210

 drivers/clk/tegra/clk-id.h                    |  4 +-
 drivers/clk/tegra/clk-tegra-periph.c          |  8 --
 drivers/clk/tegra/clk-tegra124.c              | 55 +++++++++++++-
 drivers/clk/tegra/clk-tegra210.c              | 75 ++++++++++++++-----
 .../dt-bindings/clock/tegra124-car-common.h   |  2 +-
 include/dt-bindings/clock/tegra210-car.h      |  5 +-
 6 files changed, 116 insertions(+), 33 deletions(-)

-- 
2.23.0
