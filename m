From: JC Kuo <jckuo@nvidia.com>
Subject: [PATCH v1 0/2] enable Tegra194 fuse
Date: Fri, 3 Jan 2020 16:30:16 +0800
Message-ID: <20200103083018.10575-1-jckuo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: gregkh@linuxfoundation.org, thierry.reding@gmail.com, robh@kernel.org, jonathanh@nvidia.com
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, JC Kuo <jckuo@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This patch series enables Tegra194 fuse registers access.

JC Kuo (2):
  soc/tegra: fuse: Add Tegra194 support
  arm64: tegra: Add fuse/apbmisc node on Tegra194

 arch/arm64/boot/dts/nvidia/tegra194.dtsi | 13 +++++++++++
 drivers/soc/tegra/fuse/fuse-tegra.c      |  3 +++
 drivers/soc/tegra/fuse/fuse-tegra30.c    | 29 ++++++++++++++++++++++++
 drivers/soc/tegra/fuse/fuse.h            |  4 ++++
 drivers/soc/tegra/fuse/tegra-apbmisc.c   |  1 +
 5 files changed, 50 insertions(+)

-- 
2.17.1
