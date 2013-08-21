From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: [PATCH 1/2] ARM: tegra: enable PINCTRL_PALMAS config
Date: Wed, 21 Aug 2013 18:04:20 +0530
Message-ID: <1377088461-9499-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: swarren@wwwdotorg.org
Cc: linux@arm.linux.org.uk, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Laxman Dewangan <ldewangan@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

PALMAS PMIC is used on Dalmore platform. Enable the pincontrol
driver for Palmas to configure pins of Palmas on desired state.

Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
---
 arch/arm/configs/tegra_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 8c284ff..e5012dc 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -128,6 +128,7 @@ CONFIG_SPI=y
 CONFIG_SPI_TEGRA114=y
 CONFIG_SPI_TEGRA20_SFLASH=y
 CONFIG_SPI_TEGRA20_SLINK=y
+CONFIG_PINCTRL_PALMAS=y
 CONFIG_GPIO_PCA953X_IRQ=y
 CONFIG_GPIO_PALMAS=y
 CONFIG_GPIO_TPS6586X=y
-- 
1.7.1.1
