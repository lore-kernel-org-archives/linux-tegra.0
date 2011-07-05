From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 0/3] tegra: Use engineering names in DT compatible properties
Date: Tue,  5 Jul 2011 14:29:19 -0600
Message-ID: <1309897762-23564-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Grant, these 3 patches are for the devicetree/test branch. I kept them
separated in the hope they'll squash into existing patches already there.

Stephen Warren (3):
  mmc/tegra: Use engineering names in DT compatible property
  ARM: tegra: Use engineering names in DT compatible property
  dt: docs: tegra: Use engineering names in DT compatible property

 Documentation/devicetree/usage-model |   12 ++--
 arch/arm/boot/dts/tegra-harmony.dts  |    4 +-
 arch/arm/boot/dts/tegra-seaboard.dts |    4 +-
 arch/arm/boot/dts/tegra20.dtsi       |  162 ++++++++++++++++++++++++++++++++++
 arch/arm/boot/dts/tegra250.dtsi      |  162 ----------------------------------
 arch/arm/mach-tegra/board-dt.c       |   32 ++++----
 drivers/mmc/host/sdhci-pltfm.c       |    2 +-
 7 files changed, 189 insertions(+), 189 deletions(-)
 create mode 100644 arch/arm/boot/dts/tegra20.dtsi
 delete mode 100644 arch/arm/boot/dts/tegra250.dtsi
