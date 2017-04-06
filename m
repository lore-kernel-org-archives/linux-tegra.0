From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [GIT PULL 4/4] arm64: tegra: Device tree changes for v4.12-rc1
Date: Fri,  7 Apr 2017 01:10:20 +0200
Message-ID: <20170406231020.32048-4-thierry.reding@gmail.com>
References: <20170406231020.32048-1-thierry.reding@gmail.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170406231020.32048-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit c1ae3cfa0e89fa1a7ecc4c99031f5e9ae99d9201:

  Linux 4.11-rc1 (2017-03-05 12:59:56 -0800)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.12-arm64-dt

for you to fetch changes up to 18236a14883b718ce973e4c090db6ecb49b38287:

  arm64: tegra: Update the Tegra132 flowctrl compatible string (2017-04-04 17:15:05 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Device tree changes for v4.12-rc1

This adds a bunch of features for Tegra186, such as PMC, ethernet, I2C,
SDHCI and GPIO. It also enables various features on the P2771 devkit.

A small fix is made to the compatible string list for the flow
controller on Tegra132 and the IOMMU is enabled for host1x on Tegra210.

----------------------------------------------------------------
Alexandre Courbot (1):
      arm64: tegra: Add GPU node for Tegra186

Jon Hunter (1):
      arm64: tegra: Update the Tegra132 flowctrl compatible string

Mikko Perttunen (2):
      arm64: tegra: Enable VIC on Tegra210
      arm64: tegra: Enable IOMMU for host1x on Tegra210

Thierry Reding (12):
      arm64: tegra: Add PMC controller on Tegra186
      arm64: tegra: Add ethernet support for Tegra186
      arm64: tegra: Invert the PMC interrupt on P3310
      arm64: tegra: Enable I2C controllers on P3310
      arm64: tegra: Enable ethernet on P3310
      arm64: tegra: Add initial power tree for P3310
      arm64: tegra: Enable SDHCI controllers on P3110
      arm64: tegra: Enable SD/MMC slot on P2771
      arm64: tegra: Enable current monitors on P3310
      arm64: tegra: Add GPIO keys on P2771
      arm64: tegra: Add power monitors on P2771
      arm64: tegra: Add GPIO expanders on P2771

 arch/arm64/boot/dts/nvidia/tegra132.dtsi           |   2 +-
 arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts |  91 ++++++
 arch/arm64/boot/dts/nvidia/tegra186-p3310.dtsi     | 319 ++++++++++++++++++++-
 arch/arm64/boot/dts/nvidia/tegra186.dtsi           |  59 ++++
 arch/arm64/boot/dts/nvidia/tegra210.dtsi           |  19 +-
 5 files changed, 487 insertions(+), 3 deletions(-)
