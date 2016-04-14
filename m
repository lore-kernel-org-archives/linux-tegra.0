From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] mfd: cros_ec: Enable cros-ec driver for arm64
Date: Thu, 14 Apr 2016 15:37:51 -0400
Message-ID: <1460662671-13221-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The cros-ec driver should also be enabled for arm64 platforms as there
are platforms, like the tegra210-smaug which make use of the ChromeOS
Embedded Controller.

Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/mfd/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index eea61e349e26..1d63c5fb3f3c 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -134,7 +134,7 @@ config MFD_CROS_EC
 	select MFD_CORE
 	select CHROME_PLATFORMS
 	select CROS_EC_PROTO
-	depends on X86 || ARM || COMPILE_TEST
+	depends on X86 || ARM || ARM64 || COMPILE_TEST
 	help
 	  If you say Y here you get support for the ChromeOS Embedded
 	  Controller (EC) providing keyboard, battery and power services.
-- 
1.9.1
