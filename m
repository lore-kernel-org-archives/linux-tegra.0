From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 0/4] ARM: tegra: dalmore: add regulators
Date: Wed, 20 Mar 2013 19:14:26 +0530
Message-ID: <1363787070-14801-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-doc-owner@vger.kernel.org>
Sender: linux-doc-owner@vger.kernel.org
To: swarren@wwwdotorg.org
Cc: devicetree-discuss@lists.ozlabs.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This series add the regulators for Dalmore platform.
Dalmore also have the Palma PMIC as primary PMIC but
dt population will be send later once DT documentation
finalize.

Laxman Dewangan (4):
  ARM: tegra: enable Tegra114 based platform PMICs
  ARM: tegra: dalmore: add cpu regulator's node
  ARM: tegra: dalmore: add dt node for TPS65090's regulators
  ARM: tegra: dalmore: add fixed regulator's node

 .../devicetree/bindings/regulator/tps65090.txt     |    4 +-
 arch/arm/boot/dts/tegra114-dalmore.dts             |  160 ++++++++++++++++++++
 arch/arm/configs/tegra_defconfig                   |    7 +
 3 files changed, 169 insertions(+), 2 deletions(-)

