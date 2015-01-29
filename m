From: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v2] arm64: Kconfig: clean up two no-op Kconfig options from
 CONFIG_ARCH_TEGRA*
Date: Thu, 29 Jan 2015 15:42:45 +0000 (UTC)
Message-ID: <alpine.DEB.2.02.1501291541390.16475@utopia.booyaka.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


Paul Bolle pointed out that commit
d035fdfa27ac124bc8f94c3d7dc82ad069802170 ("arm64: Add Tegra132
support") included two Kconfig symbols that are now no-ops:
USB_ARCH_HAS_EHCI and HAVE_SMP.  So, drop the two symbols.

This second version corrects a thinko in Paul Bolle's E-mail address.

Signed-off-by: Paul Walmsley <paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org>
Cc: Paul Walmsley <pwalmsley-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Cc: Paul Bolle <pebolle-IWqWACnzNjzz+pZb47iToQ@public.gmane.org>
---

Boot-tested on NVIDIA Tegra132 Norrin64 FFD with a extra DTS page for the 
board data (not yet posted upstream).

 arch/arm64/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 3b97e725ebfc..ae18c3d2bb3b 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -180,7 +180,6 @@ config ARCH_TEGRA
 	select CLKSRC_OF
 	select GENERIC_CLOCKEVENTS
 	select HAVE_CLK
-	select HAVE_SMP
 	select PINCTRL
 	select RESET_CONTROLLER
 	help
@@ -190,7 +189,6 @@ config ARCH_TEGRA_132_SOC
 	bool "NVIDIA Tegra132 SoC"
 	depends on ARCH_TEGRA
 	select PINCTRL_TEGRA124
-	select USB_ARCH_HAS_EHCI if USB_SUPPORT
 	select USB_ULPI if USB_PHY
 	select USB_ULPI_VIEWPORT if USB_PHY
 	help
-- 
2.1.4
