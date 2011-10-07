From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH 01/14] ARM: tegra: add __force to IO_ADDRESS
Date: Thu,  6 Oct 2011 19:54:11 -0700
Message-ID: <1317956064-17650-2-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1317956064-17650-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-wEGCiKHe2LqWVfeAwA7xHQ@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Kills loads of sparse errors such as:

arch/arm/mach-tegra/fuse.c:44:12: warning: incorrect type in argument 1 (different base types)
arch/arm/mach-tegra/fuse.c:44:12:    expected void const volatile [noderef] <asn:2>*<noident>
arch/arm/mach-tegra/fuse.c:44:12:    got unsigned int

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/include/mach/io.h |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/arch/arm/mach-tegra/include/mach/io.h b/arch/arm/mach-tegra/include/mach/io.h
index 4cea2230..d27e340 100644
--- a/arch/arm/mach-tegra/include/mach/io.h
+++ b/arch/arm/mach-tegra/include/mach/io.h
@@ -71,7 +71,7 @@
 void __iomem *tegra_ioremap(unsigned long phys, size_t size, unsigned int type);
 void tegra_iounmap(volatile void __iomem *addr);
 
-#define IO_ADDRESS(n) ((void __iomem *) IO_TO_VIRT(n))
+#define IO_ADDRESS(n) ((void __force __iomem *) IO_TO_VIRT(n))
 
 #ifdef CONFIG_TEGRA_PCI
 extern void __iomem *tegra_pcie_io_base;
-- 
1.7.4.1
