From: Joseph Lo <josephl@nvidia.com>
Subject: [PATCH V2 0/2] mmc: tegra: use mmc_of_parse to get support of standard MMC DT binding
Date: Fri, 22 Feb 2013 11:23:38 +0800
Message-ID: <1361503420-16473-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-mmc-owner@vger.kernel.org>
Sender: linux-mmc-owner@vger.kernel.org
To: Chris Ball <cjb@laptop.org>, Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, linux-mmc@vger.kernel.org, Joseph Lo <josephl@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The 2nd patch of this series depends on two patches below.

"mmc: provide a standard MMC device-tree binding parser centrally"
(available on next-20130219)
mmc: tegra: assume CONFIG_OF, remove platform data
(available on next-20130220)

V2:
* add cd-gpio fix for Tamonten-based board
* add cd-gpio fix for Toradex-based board (assume it also need this fix)
* some modifications for sdhci_tegra_parse_dt()

Verified on Seaboard ,Cardhu and Tamonten-based board.

Joseph Lo (2):
  ARM: dts: tegra: fix the activate polarity of cd-gpio in mmc host
  mmc: tegra: use mmc_of_parse to get the support of standard MMC DT
    bindings

 arch/arm/boot/dts/tegra20-colibri-512.dtsi |  2 +-
 arch/arm/boot/dts/tegra20-harmony.dts      |  4 +-
 arch/arm/boot/dts/tegra20-paz00.dts        |  2 +-
 arch/arm/boot/dts/tegra20-seaboard.dts     |  2 +-
 arch/arm/boot/dts/tegra20-tamonten.dtsi    |  2 +-
 arch/arm/boot/dts/tegra20-trimslice.dts    |  2 +-
 arch/arm/boot/dts/tegra20-ventana.dts      |  2 +-
 arch/arm/boot/dts/tegra20-whistler.dts     |  1 +
 arch/arm/boot/dts/tegra30-beaver.dts       |  2 +-
 arch/arm/boot/dts/tegra30-cardhu.dtsi      |  2 +-
 drivers/mmc/host/sdhci-tegra.c             | 92 ++++--------------------------
 11 files changed, 21 insertions(+), 92 deletions(-)

-- 
1.8.1.1

