From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH] ARM: tegra: devices.c should include devices.h
Date: Wed, 12 Oct 2011 18:01:19 -0700
Message-ID: <1318467679-11927-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Resolves lots of sparse warnings:

arch/arm/mach-tegra/devices.c:102:24: warning: symbol 'tegra_i2c_device1' was not declared. Should it be static?
arch/arm/mach-tegra/devices.c:112:24: warning: symbol 'tegra_i2c_device2' was not declared. Should it be static?
arch/arm/mach-tegra/devices.c:122:24: warning: symbol 'tegra_i2c_device3' was not declared. Should it be static?
arch/arm/mach-tegra/devices.c:132:24: warning: symbol 'tegra_i2c_device4' was not declared. Should it be static?
[...]

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/devices.c |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/devices.c b/arch/arm/mach-tegra/devices.c
index 240d5dc..7a2a02d 100644
--- a/arch/arm/mach-tegra/devices.c
+++ b/arch/arm/mach-tegra/devices.c
@@ -29,7 +29,9 @@
 #include <mach/iomap.h>
 #include <mach/dma.h>
 #include <mach/usb_phy.h>
+
 #include "gpio-names.h"
+#include "devices.h"
 
 static struct resource gpio_resource[] = {
 	[0] = {
-- 
1.7.4.1
