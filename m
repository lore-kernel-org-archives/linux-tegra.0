From: Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3] ARM: tegra: enforce PM requirement
Date: Wed, 27 Feb 2019 13:50:28 +0530
Message-ID: <1551255628-4794-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux@armlinux.org.uk, digetx@gmail.com, jhogan@kernel.org
Cc: jonathanh@nvidia.com, treding@nvidia.com, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Sameer Pujar <spujar@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Currently runtime PM is enabled for Tegra HDA driver. One of the concern
raised was about handling !PM case in HDA driver. In this case, there is
a need to manage clocks and power explicitly in the driver and reviewers
were not really convinced about this. The consensus at the end was to
enforce PM requirement to keep things simple, rather driver mentioning a
dependency on PM. This is how it is done for ARM 64-bit Tegra platforms
and the same can be done for 32-bit Tegra platforms too.

Finally the objective is to remove dependency on PM availability for all
Tegra drivers. The detailed discussion can be found in following patch,
https://patchwork.ozlabs.org/patch/1031007/

Signed-off-by: Sameer Pujar <spujar@nvidia.com>
Reviewed-by: Thierry Reding <treding@nvidia.com>
Reviewed-by: Jonathan Hunter <jonathanh@nvidia.com>
---
 arch/arm/mach-tegra/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 7f3b83e..51a8fa3 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -10,6 +10,7 @@ menuconfig ARCH_TEGRA
 	select HAVE_ARM_SCU if SMP
 	select HAVE_ARM_TWD if SMP
 	select PINCTRL
+	select PM
 	select PM_OPP
 	select ARCH_HAS_RESET_CONTROLLER
 	select RESET_CONTROLLER
-- 
2.7.4
