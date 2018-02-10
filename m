From: Marcel Ziswiler <marcel@ziswiler.com>
Subject: [PATCH 0/4] dt/bindings & ARM: dts: tegra: updates
Date: Sat, 10 Feb 2018 02:33:21 +0100
Message-ID: <20180210013326.27771-1-marcel@ziswiler.com>
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
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Marcel Ziswiler <marcel@ziswiler.com>, Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org


This series fixes the Tegra GMI controller DT/bindings example, a few
IRQ type definitions, removes some invalid uses of rsvd1 pin muxes on
Beaver and removes a duplicate pcie-1 node on Venice2.


Marcel Ziswiler (4):
  dt/bindings: fix binding examples for tegra gmi controller
  ARM: dts: tegra: use proper irq type definitions
  ARM: dts: tegra: beaver: remove invalid uses of rsvd1
  ARM: dts: tegra: venice2: remove duplicate pcie-1 node

 .../devicetree/bindings/bus/nvidia,tegra20-gmi.txt |  6 ++--
 arch/arm/boot/dts/tegra114-dalmore.dts             |  2 +-
 arch/arm/boot/dts/tegra124-jetson-tk1.dts          |  2 +-
 arch/arm/boot/dts/tegra124-venice2.dts             |  9 ++----
 arch/arm/boot/dts/tegra30-apalis.dtsi              |  4 +--
 arch/arm/boot/dts/tegra30-beaver.dts               | 32 +++++++++++-----------
 arch/arm/boot/dts/tegra30-colibri-eval-v3.dts      |  2 +-
 7 files changed, 25 insertions(+), 32 deletions(-)

-- 
2.14.3
