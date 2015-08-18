From: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
Subject: [PATCH] ARM: tegra: Enable CROS_EC_PROTO for ChromeOS EC mfd driver
Date: Tue, 18 Aug 2015 09:06:39 +0200
Message-ID: <1439881599-22348-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Geert Uytterhoeven <geert-Td1EMuHUCqxL1ZNQvxDV9g@public.gmane.org>, Doug Anderson <dianders-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Gwendal Grignou <gwendal-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Sjoerd Simons <sjoerd.simons-ZGY8ohtN/8pPYcu2f3hruQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The ChromeOS mfd driver (MFD_CROS_EC) select the CROS_EC_PROTO config
symbol because the driver uses some communication helper functions in
drivers/platform/chrome/cros_ec_proto.c but other drivers depends on
CROS_EC_PROTO instead. Mixing select and depends can lead to circular
Kconfig dependencies so the MFD_CROS_EC select should be changed to a
depends on CROS_EC_PROTO instead.

But doing so will break git bisect-ability since MFD_CROS_EC will not
be enabled anymore unless the default configs first explicitly enable
the CROS_EC_PROTO dependency.

Also enable CHROME_PLATFORMS since the CROS_EC_PROTO symbol is inside
that submenu.

Signed-off-by: Javier Martinez Canillas <javier-JPH+aEBZ4P+UEJcrhfAQsw@public.gmane.org>
---
 arch/arm/configs/tegra_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/configs/tegra_defconfig b/arch/arm/configs/tegra_defconfig
index 9808581176cc..03e775a70c6e 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -254,6 +254,8 @@ CONFIG_KEYBOARD_NVEC=y
 CONFIG_SERIO_NVEC_PS2=y
 CONFIG_NVEC_POWER=y
 CONFIG_NVEC_PAZ00=y
+CONFIG_CHROME_PLATFORMS=y
+CONFIG_CROS_EC_PROTO=y
 CONFIG_TEGRA_IOMMU_GART=y
 CONFIG_TEGRA_IOMMU_SMMU=y
 CONFIG_MEMORY=y
-- 
2.4.3
