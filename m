From: Thierry Reding <thierry.reding@gmail.com>
Subject: [GIT PULL 7/7] arm64: tegra: Device tree changes for v4.17-rc1
Date: Fri, 16 Mar 2018 15:18:50 +0100
Message-ID: <20180316141850.4876-7-thierry.reding@gmail.com>
References: <20180316141850.4876-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20180316141850.4876-1-thierry.reding@gmail.com>
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

The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1b2:

  Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.17-arm64-dt

for you to fetch changes up to 0f2754cee38fd2bc42f446d299ff0c53815dc5bd:

  arm64: tegra: Enable AHCI on Jetson TX1 (2018-03-14 17:34:51 +0100)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v4.17-rc1

Adds initial support for the P2972-0000 development board based on
Tegra194 and enables the AHCI controller on Jetson TX1.

----------------------------------------------------------------
Mikko Perttunen (2):
      arm64: tegra: Add Tegra194 chip device tree
      arm64: tegra: Add device tree for the Tegra194 P2972-0000 board

Preetham Ramchandra (2):
      arm64: tegra: Add SATA node for Tegra210
      arm64: tegra: Enable AHCI on Jetson TX1

 arch/arm64/boot/dts/nvidia/Makefile                |   1 +
 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi     | 248 +++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts |  16 +
 arch/arm64/boot/dts/nvidia/tegra194.dtsi           | 344 +++++++++++++++++++++
 arch/arm64/boot/dts/nvidia/tegra210-p2597.dtsi     |   5 +
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  16 +
 include/dt-bindings/clock/tegra194-clock.h         | 321 +++++++++++++++++++
 include/dt-bindings/gpio/tegra194-gpio.h           |  61 ++++
 include/dt-bindings/power/tegra194-powergate.h     |  35 +++
 include/dt-bindings/reset/tegra194-reset.h         | 152 +++++++++
 10 files changed, 1199 insertions(+)
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p2972-0000.dts
 create mode 100644 arch/arm64/boot/dts/nvidia/tegra194.dtsi
 create mode 100644 include/dt-bindings/clock/tegra194-clock.h
 create mode 100644 include/dt-bindings/gpio/tegra194-gpio.h
 create mode 100644 include/dt-bindings/power/tegra194-powergate.h
 create mode 100644 include/dt-bindings/reset/tegra194-reset.h
