From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 6/8] ARM: tegra: Device tree changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:19 +0100
Message-ID: <20191102144521.3863321-6-thierry.reding@gmail.com>
References: <20191102144521.3863321-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191102144521.3863321-1-thierry.reding@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: arm@kernel.org
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-arm-kernel@lists.infradead.org, Jon Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm-dt

for you to fetch changes up to 4053aa65c517fba954af05e826bb97b2eaefe92a:

  ARM: tegra: cardhu-a04: Add CPU Operating Performance Points (2019-10-29 20:29:17 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v5.5-rc1

Adds support for CPU frequency scaling on Tegra20 and Tegra30, EMC
frequency scaling on Tegra30, SMMU support for VDE on Tegra30, the
STMPE ADC found on Toradex T30 modules as well as fixes for eDP
support on Venice2.

----------------------------------------------------------------
Dmitry Osipenko (12):
      ARM: tegra: Connect SMMU with Video Decoder Engine on Tegra30
      ARM: tegra: nyan-big: Add timings for RAM codes 4 and 6
      ARM: tegra: Add External Memory Controller node on Tegra30
      ARM: tegra: Add Tegra20 CPU clock
      ARM: tegra: Add Tegra30 CPU clock
      ARM: tegra: Add CPU Operating Performance Points for Tegra20
      ARM: tegra: Add CPU Operating Performance Points for Tegra30
      ARM: tegra: paz00: Set up voltage regulators for DVFS
      ARM: tegra: paz00: Add CPU Operating Performance Points
      ARM: tegra: trimslice: Add CPU Operating Performance Points
      ARM: tegra: cardhu-a04: Set up voltage regulators for DVFS
      ARM: tegra: cardhu-a04: Add CPU Operating Performance Points

Philippe Schenker (1):
      ARM: tegra: Add stmpe-adc DT node to Toradex T30 modules

Thierry Reding (4):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT
      Merge branch 'for-5.5/dt-bindings'
      ARM: tegra: Add SOR0_OUT clock on Tegra124
      ARM: tegra: Add eDP power supplies on Venice2

 arch/arm/boot/dts/tegra124-nyan-big-emc.dtsi     | 7869 +++++++++++++++++-----
 arch/arm/boot/dts/tegra124-venice2.dts           |    3 +
 arch/arm/boot/dts/tegra124.dtsi                  |    3 +-
 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi |  201 +
 arch/arm/boot/dts/tegra20-cpu-opp.dtsi           |  302 +
 arch/arm/boot/dts/tegra20-paz00.dts              |   41 +-
 arch/arm/boot/dts/tegra20-trimslice.dts          |   11 +
 arch/arm/boot/dts/tegra20.dtsi                   |    2 +
 arch/arm/boot/dts/tegra30-apalis-v1.1.dtsi       |   22 +-
 arch/arm/boot/dts/tegra30-apalis.dtsi            |   22 +-
 arch/arm/boot/dts/tegra30-cardhu-a04.dts         |   48 +
 arch/arm/boot/dts/tegra30-colibri.dtsi           |   22 +-
 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi |  801 +++
 arch/arm/boot/dts/tegra30-cpu-opp.dtsi           | 1202 ++++
 arch/arm/boot/dts/tegra30.dtsi                   |   14 +
 include/dt-bindings/clock/tegra124-car-common.h  |    3 +-
 include/dt-bindings/clock/tegra210-car.h         |    3 +-
 17 files changed, 8914 insertions(+), 1655 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp-microvolt.dtsi
 create mode 100644 arch/arm/boot/dts/tegra20-cpu-opp.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
 create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp.dtsi
