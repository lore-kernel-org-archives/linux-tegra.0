From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] phy: tegra: Select USB_COMMON for usb_get_maximum_speed()
Date: Mon, 30 Mar 2020 12:10:38 +0200
Message-ID: <20200330101038.2422389-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Kishon Vijay Abraham I <kishon-l0cyMroinI0@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The usb_get_maximum_speed() function is part of the usb-common module,
so enable it by selecting the corresponding Kconfig symbol.

While at it, also make sure to depend on USB_SUPPORT because USB_PHY
requires that. This can lead to Kconfig conflicts if USB_SUPPORT is not
enabled while attempting to enable PHY_TEGRA_XUSB.

Reported-by: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Suggested-by: Nathan Chancellor <natechancellor-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Hi Greg,

sending this directly to you since it fixes a build issue introduced in
the pull request that you merged last week, so it needs to be applied on
top of that.

Thierry

 drivers/phy/tegra/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/Kconfig b/drivers/phy/tegra/Kconfig
index a208aca4ba7b..c591c958f1eb 100644
--- a/drivers/phy/tegra/Kconfig
+++ b/drivers/phy/tegra/Kconfig
@@ -1,7 +1,8 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config PHY_TEGRA_XUSB
 	tristate "NVIDIA Tegra XUSB pad controller driver"
-	depends on ARCH_TEGRA
+	depends on ARCH_TEGRA && USB_SUPPORT
+	select USB_COMMON
 	select USB_CONN_GPIO
 	select USB_PHY
 	help
-- 
2.24.1
