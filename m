From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: [PATCH v2 2/2] Add PAZ00 to tegra_defconfig
Date: Mon,  7 Mar 2011 21:01:32 +0100
Message-ID: <cca9e47acefe58552c4d5754cf230481f467cb07.1299526691.git.marvin24@gmx.de>
References: <cover.1299526691.git.marvin24@gmx.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1299526691.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
In-Reply-To: <cover.1299526691.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
References: <cover.1299526691.git.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Subject says it all, this one adds PAZ00 to tegra_defconfig.

Signed-off-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 7a9267e..3fcf6f5 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -21,6 +21,7 @@ CONFIG_MODULE_FORCE_UNLOAD=y
 # CONFIG_IOSCHED_CFQ is not set
 CONFIG_ARCH_TEGRA=y
 CONFIG_MACH_HARMONY=y
+CONFIG_MACH_PAZ00=y
 CONFIG_TEGRA_DEBUG_UARTD=y
 CONFIG_ARM_ERRATA_742230=y
 CONFIG_NO_HZ=y
-- 
1.7.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
