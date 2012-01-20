From: Stephen Warren <swarren@nvidia.com>
Subject: [PATCH 2/4] ARM: tegra: Select PINCTRL Kconfig variables
Date: Fri, 20 Jan 2012 11:22:24 -0700
Message-ID: <1327083746-31430-2-git-send-email-swarren@nvidia.com>
References: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1327083746-31430-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Olof Johansson <olof@lixom.net>, Colin Cross <ccross@android.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

This causes the Tegra pinctrl driver to be built whenever core Tegra
support is enabled.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 arch/arm/mach-tegra/Kconfig |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 373652d..32b420a 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -7,6 +7,8 @@ config ARCH_TEGRA_2x_SOC
 	select CPU_V7
 	select ARM_GIC
 	select ARCH_REQUIRE_GPIOLIB
+	select PINCTRL
+	select PINCTRL_TEGRA20
 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
 	select USB_ULPI if USB_SUPPORT
 	select USB_ULPI_VIEWPORT if USB_SUPPORT
@@ -19,6 +21,8 @@ config ARCH_TEGRA_3x_SOC
 	select CPU_V7
 	select ARM_GIC
 	select ARCH_REQUIRE_GPIOLIB
+	select PINCTRL
+	select PINCTRL_TEGRA30
 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
 	select USB_ULPI if USB_SUPPORT
 	select USB_ULPI_VIEWPORT if USB_SUPPORT
-- 
1.7.0.4
