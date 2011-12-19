From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/3] arm/tegra: Make MACH_TEGRA_DT depend on ARCH_TEGRA_2x_SOC
Date: Mon, 19 Dec 2011 12:24:04 -0700
Message-ID: <1324322645-30653-2-git-send-email-swarren@nvidia.com>
References: <1324322645-30653-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1324322645-30653-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Now that Tegra20 and Tegra30 device tree board files are separate,
MACH_TEGRA_DT (which enables the Tegra20 device tree board file) should
depend on Tegra20 support being enabled.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index b3d78fc..373652d 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -66,6 +66,7 @@ config MACH_SEABOARD
 
 config MACH_TEGRA_DT
 	bool "Generic Tegra20 board (FDT support)"
+	depends on ARCH_TEGRA_2x_SOC
 	select USE_OF
 	help
 	  Support for generic NVIDIA Tegra20 boards using Flattened Device Tree
-- 
1.7.0.4
