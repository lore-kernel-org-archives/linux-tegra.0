From: Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 0/6] soc/tegra: Enable flowctrl support for Tegra132/210
Date: Tue, 28 Mar 2017 13:42:52 +0100
Message-ID: <1490704978-22906-1-git-send-email-jonathanh@nvidia.com>
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
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Russell King <linux@armlinux.org.uk>, Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

The flowctrl modules is supported by both Tegra132 and Tegra210 devices.
These devices already have the flowctrl node defined in their respective
*.dtsi device-tree files. The flowctrl driver is currently located in
the arch/arm/mach-tegra directory and so can only be used for 32-bit
Tegra devices. Move this driver into drivers/soc/tegra so that it can
be used for all Tegra devices that support flowctrl.

I have also added a couple clean-up patches.

Changes since V2:
- Updated Dt compatible strings per Stephen's feedback
- Added patch to update Tegra132 compatible string

Changes since V1:
- Updated warning message per Thierry's feedback
- Added stub functions for public flowctrl APIs
- Added patch to register flowctrl driver as a platform driver
- Updated formatting of DT compatible strings per Thierry's feedback.

Jon Hunter (6):
  ARM: tegra: Remove unnecessary inclusion of flowctrl header
  soc/tegra: Move Tegra flowctrl driver
  soc/tegra: flowctrl: Add basic platform driver
  dt-bindings: tegra: Update compatible strings for Tegra flowctrl
  arm64: tegra: Update the Tegra132 flowctrl compatible string
  soc/tegra: Add initial flowctrl support for Tegra132/210

 .../bindings/arm/tegra/nvidia,tegra20-flowctrl.txt |   8 +-
 arch/arm/mach-tegra/Makefile                       |   1 -
 arch/arm/mach-tegra/cpuidle-tegra20.c              |   3 +-
 arch/arm/mach-tegra/flowctrl.c                     | 179 ----------------
 arch/arm/mach-tegra/flowctrl.h                     |  66 ------
 arch/arm/mach-tegra/platsmp.c                      |   2 +-
 arch/arm/mach-tegra/pm.c                           |   2 +-
 arch/arm/mach-tegra/reset-handler.S                |   2 +-
 arch/arm/mach-tegra/sleep-tegra20.S                |   3 +-
 arch/arm/mach-tegra/sleep-tegra30.S                |   2 +-
 arch/arm/mach-tegra/sleep.S                        |   2 -
 arch/arm/mach-tegra/tegra.c                        |   2 -
 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   2 +-
 drivers/soc/tegra/Kconfig                          |   9 +
 drivers/soc/tegra/Makefile                         |   1 +
 drivers/soc/tegra/flowctrl.c                       | 224 +++++++++++++++++++++
 include/soc/tegra/flowctrl.h                       |  82 ++++++++
 17 files changed, 332 insertions(+), 258 deletions(-)
 delete mode 100644 arch/arm/mach-tegra/flowctrl.c
 delete mode 100644 arch/arm/mach-tegra/flowctrl.h
 create mode 100644 drivers/soc/tegra/flowctrl.c
 create mode 100644 include/soc/tegra/flowctrl.h

-- 
2.7.4
