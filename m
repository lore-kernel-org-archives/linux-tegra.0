From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH] ARM: tegra: support big-endian kernel
Date: Wed, 18 Mar 2015 19:00:17 +0300
Message-ID: <1426694461-7170-1-git-send-email-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: digetx@gmail.com, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Russell King <linux@arm.linux.org.uk>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Now, after making drivers and arch code aware of big-endian CPU mode, NVIDIA
Tegra SoC supports big-endian kernel across all generations. Enable it in Kconfig.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 5d1a318..927f6b3 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -2,6 +2,7 @@ menuconfig ARCH_TEGRA
 	bool "NVIDIA Tegra" if ARCH_MULTI_V7
 	select ARCH_REQUIRE_GPIOLIB
 	select ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
+	select ARCH_SUPPORTS_BIG_ENDIAN
 	select ARM_AMBA
 	select ARM_GIC
 	select CLKSRC_MMIO
-- 
2.3.2
