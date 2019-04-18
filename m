From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 8/9] arm64: tegra: Device tree changes for v5.2-rc1
Date: Thu, 18 Apr 2019 17:07:19 +0200
Message-ID: <20190418150721.8828-8-thierry.reding@gmail.com>
References: <20190418150721.8828-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190418150721.8828-1-thierry.reding@gmail.com>
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

The following changes since commit 79a3aaa7b82e3106be97842dedfd8429248896e6:

  Linux 5.1-rc3 (2019-03-31 14:39:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.2-arm64-dt

for you to fetch changes up to 2f03e39b5bfe41f3a0d9a8b01231e7e5045cb9c4:

  arm64: tegra: Remove regulator hacks on Jetson TX2 (2019-04-17 16:48:44 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v5.2-rc1

This contains a bunch of changes all across the board. Perhaps the most
notable introduction here is support for the Jetson Nano Developer Kit.

----------------------------------------------------------------
Jon Hunter (1):
      arm64: tegra: Add supply for temperature sensor on P2888

Joseph Lo (6):
      arm64: tegra: Fix timer node for Tegra210
      arm64: tegra: Add CPU idle states properties for Tegra210
      arm64: tegra: Enable CPU idle support for Jetson TX1
      arm64: tegra: Enable CPU idle support for Smaug
      arm64: tegra: Enable CPU idle support for Shield
      arm64: tegra: Add L2 cache topology to Tegra210

Sameer Pujar (1):
      arm64: tegra: Enable aconnect, ADMA and AGIC on Jetson TX1

Sowjanya Komatineni (2):
      arm64: tegra: Fix default tap and trim values
      arm64: tegra: Enable command queue for Tegra186 SDMMC4

Thierry Reding (6):
      arm64: tegra: jetson-tx1: Move PLL power supplies to XUSB pad controller
      arm64: tegra: smaug: Move PLL power supplies to XUSB pad controller
      arm64: tegra: Add NVIDIA Jetson Nano Developer Kit support
      arm64: tegra: Add XUSB and pad controller on Tegra186
      arm64: tegra: Enable XUSB on P2771
      arm64: tegra: Remove regulator hacks on Jetson TX2

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 115 ++++
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     |  42 +-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           | 140 ++++-
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     |   1 +
 arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi     |   6 +
 arch/arm64/boot/dts/nvidia/tegra210-p2371-2180.dts |  12 +
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +
 arch/arm64/boot/dts/nvidia/tegra210-p2894.dtsi     |   6 +
 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 650 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-smaug.dts      |  12 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  41 +-
 12 files changed, 999 insertions(+), 32 deletions(-)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
