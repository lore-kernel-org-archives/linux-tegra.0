From: Alan Ott <alan@signal11.us>
Subject: [PATCH 6/8] ARM: tegra: USB_ULPI needs USB
Date: Thu,  1 Mar 2012 14:26:48 -0500
Message-ID: <1330630010-11241-7-git-send-email-alan@signal11.us>
References: <1330630010-11241-1-git-send-email-alan@signal11.us>
Mime-Version: 1.0
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1330630010-11241-1-git-send-email-alan@signal11.us>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, Stephen Warren <swarren@nvidia.com>, Grant Likely <grant.likely@secretlab.ca>, Linus Walleij <linus.walleij@stericsson.com>, Alan Stern <stern@rowland.harvard.edu>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>
List-Id: linux-tegra@vger.kernel.org

From: Arnd Bergmann <arnd@arndb.de>

The USB_ULPI driver is selected by tegra, but can only be
built if at least one of USB or USB_GADGET is enabled.
The kernel fails to link if both are off.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/mach-tegra/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index b2a038e..7ac3011 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -10,6 +10,7 @@ config ARCH_TEGRA_2x_SOC
 	select USB_ARCH_HAS_EHCI if USB_SUPPORT
 	select USB_ULPI if USB_SUPPORT
 	select USB_ULPI_VIEWPORT if USB_SUPPORT
+	select USB_GADGET if USB_SUPPORT && !USB
 	select CPU_FREQ_TABLE if CPU_FREQ
 	help
 	  Support for NVIDIA Tegra AP20 and T20 processors, based on the
-- 
1.7.0.4
