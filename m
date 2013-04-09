From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [GIT PULL 7/8] ARM: tegra: multi-platform conversion
Date: Tue, 9 Apr 2013 22:01:18 +0200
Message-ID: <201304092201.18950.arnd@arndb.de>
References: <1365181426-11547-1-git-send-email-swarren@wwwdotorg.org> <1365181426-11547-7-git-send-email-swarren@wwwdotorg.org> <201304091659.08376.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201304091659.08376.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tuesday 09 April 2013, Arnd Bergmann wrote:
> On Friday 05 April 2013, Stephen Warren wrote:
> > This branch converts Tegra to support multi-platform/single-zImage.

> I had to reorder the branches in arm-soc to avoid starting a
> next/multiplatform2 branch, but I saw nothing that prevents us from
> having multiplatform after soc.

I've applied this patch on top.

From 1939e142b04d91b97a8643dd68c4b3fae48a136b Mon Sep 17 00:00:00 2001
From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Date: Tue, 9 Apr 2013 21:58:38 +0200
Subject: [PATCH] ARM: tegra: build assembly files with -march=armv7-a

The tegra assembly files are written for ARMv7 and are not compatible
with ARMv6, which leads to build warnings when compiling a dual
ARMv6/v7 kernel. Since this code is only ever run on Tegra ARMv7
hardware, we can tell the assembler which architecture level to
use.

Signed-off-by: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index e40326d..bfc5b07 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -1,3 +1,5 @@
+asflags-y				+= -march=armv7-a
+
 obj-y                                   += common.o
 obj-y                                   += io.o
 obj-y                                   += irq.o
