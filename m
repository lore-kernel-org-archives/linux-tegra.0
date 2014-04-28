From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: [PATCH 00/16] Another 16 L2C patches
Date: Mon, 28 Apr 2014 17:56:31 +0100
Message-ID: <20140428165631.GM26756@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-arm-kernel@lists.infradead.org
Cc: Andrew Lunn <andrew@lunn.ch>, kernel@stlinux.com, Linus Walleij <linus.walleij@linaro.org>, Gregory Clement <gregory.clement@free-electrons.com>, Thierry Reding <thierry.reding@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, linux-samsung-soc@vger.kernel.org, Michal Simek <michal.simek@xilinx.com>, bcm-kernel-feedback-list@broadcom.com, Dinh Nguyen <dinguyen@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Stephen Warren <swarren@wwwdotorg.org>, Hauke Mehrtens <hauke@hauke-m.de>, Matt Porter <mporter@linaro.org>, Kukjin Kim <kgene.kim@samsung.com>, linux-tegra@vger.kernel.org, Shawn Guo <shawn.guo@freescale.com>, Maxime Coquelin <maxime.coquelin@st.com>, Barry Song <baohua@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@gmail.com>, Christian Daudt <bcm@fixthebug.org>, Patrice
List-Id: linux-tegra@vger.kernel.org

So, in response to Matt Porter's complaint about breaking prima2, here's
another 16 patches which changes the way the L2 cache is initialised on
many platforms.  This series moves towards a situation where the generic
code initialises the L2 cache itself, with as little help as possible
from board specific code.

A number of platforms are left alone because they're more complex -
these should still eventually be converted.

At some point in the near future, I will see about sorting out their
ordering wrt the previous patch set.  For the time being, they apply
on top of the existing l2c changes.

 arch/arm/include/asm/mach/arch.h  |  3 +++
 arch/arm/kernel/irq.c             | 12 ++++++++++++
 arch/arm/mach-bcm/bcm_5301x.c     |  9 ++-------
 arch/arm/mach-berlin/berlin.c     | 17 ++++++-----------
 arch/arm/mach-exynos/exynos.c     |  8 ++------
 arch/arm/mach-highbank/highbank.c |  9 +++------
 arch/arm/mach-imx/mach-vf610.c    |  9 ++-------
 arch/arm/mach-mvebu/board-v7.c    |  9 ++++++---
 arch/arm/mach-nomadik/cpu-8815.c  | 13 +++----------
 arch/arm/mach-prima2/Makefile     |  1 -
 arch/arm/mach-prima2/common.c     |  6 ++++++
 arch/arm/mach-prima2/l2x0.c       | 17 -----------------
 arch/arm/mach-rockchip/rockchip.c |  9 ++-------
 arch/arm/mach-socfpga/socfpga.c   |  9 ++-------
 arch/arm/mach-sti/board-dt.c      | 20 +++++---------------
 arch/arm/mach-tegra/tegra.c       | 12 +++---------
 arch/arm/mach-vexpress/v2m.c      |  3 ++-
 arch/arm/mach-zynq/common.c       |  8 +++-----
 18 files changed, 62 insertions(+), 112 deletions(-)


-- 
FTTC broadband for 0.8mile line: now at 9.7Mbps down 460kbps up... slowly
improving, and getting towards what was expected from it.
