From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 8/8] arm64: tegra: Device tree changes for v5.5-rc1
Date: Sat,  2 Nov 2019 15:45:21 +0100
Message-ID: <20191102144521.3863321-8-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-arm64-dt

for you to fetch changes up to 47b4e129155fd1e721462fa23d128940c93b5b7b:

  arm64: tegra: Add Jetson Nano SC7 timings (2019-10-29 20:30:09 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.5-rc1

Adds support for DP and XUSB on various boards, enables SMMU support for
more devices and fixes a couple of DTC warnings and inconsistencies that
are reported at runtime.

These changes along with some of the driver changes in other branches
allow suspend/resume support on Tegra210 devices (e.g. Jetson TX1 and
Jetson Nano).

----------------------------------------------------------------
Jon Hunter (2):
      arm64: tegra: Fix 'active-low' warning for Jetson TX1 regulator
      arm64: tegra: Fix 'active-low' warning for Jetson Xavier regulator

Nagarjuna Kristam (3):
      arm64: tegra: Enable XUSB pad controller on Jetson TX2
      arm64: tegra: Enable SMMU for XUSB host on Tegra186
      arm64: tegra: Enable XUSB host controller on Jetson TX2

Sowjanya Komatineni (3):
      arm64: tegra: Enable wake from deep sleep on RTC alarm
      arm64: tegra: Add Jetson TX1 SC7 timings
      arm64: tegra: Add Jetson Nano SC7 timings

Thierry Reding (18):
      dt-bindings: clock: tegra: Rename SOR0_LVDS to SOR0_OUT
      Merge branch 'for-5.5/dt-bindings'
      arm64: tegra: Add CPU and cache topology for Tegra194
      arm64: tegra: Add unit-address for CBB on Tegra194
      arm64: tegra: Add unit-address for ACONNECT on Tegra194
      arm64: tegra: Fix base address for SOR1 on Tegra194
      arm64: tegra: Hook up edp interrupt on Tegra210 SOCTHERM
      arm64: tegra: Fix compatible string for EQOS on Tegra194
      arm64: tegra: Add ethernet alias on Jetson AGX Xavier
      arm64: tegra: Enable SMMU for VIC on Tegra186
      arm64: tegra: Add SOR0_OUT clock on Tegra210
      arm64: tegra: Enable DP support on Jetson Nano
      arm64: tegra: Fix compatible for SOR1
      arm64: tegra: Enable DP support on Jetson TX2
      arm64: tegra: p2888: Rename regulators for consistency
      arm64: tegra: Enable DisplayPort on Jetson AGX Xavier
      arm64: tegra: Add blank lines for better readability
      arm64: tegra: Add PMU on Tegra210

Vidya Sagar (1):
      arm64: tegra: Assume no CLKREQ presence by default

 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  12 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |   4 +-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |  36 ++---
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  33 +++-
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 171 ++++++++++++++++++---
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   7 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   2 +-
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts |  35 +++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  25 ++-
 include/dt-bindings/clock/tegra124-car-common.h    |   3 +-
 include/dt-bindings/clock/tegra210-car.h           |   3 +-
 11 files changed, 278 insertions(+), 53 deletions(-)
