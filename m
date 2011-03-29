From: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Subject: [GIT PULL 1/6] ARM: tegra: allow ioremap for PCI space
Date: Tue, 29 Mar 2011 10:06:35 +0200
Message-ID: <a33a4a596270756db793d6288d470cd93a2e57d2.1301385131.git.mike@compulab.co.il>
References: <cover.1301385131.git.mike@compulab.co.il>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <cover.1301385131.git.mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Signed-off-by: Mike Rapoport <mike-UTxiZqZC01RS1MOuV/RT9w@public.gmane.org>
---
 arch/arm/mach-tegra/io.c |   17 +++++++++++++++--
 1 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-tegra/io.c b/arch/arm/mach-tegra/io.c
index a1674da..b5a083f 100644
--- a/arch/arm/mach-tegra/io.c
+++ b/arch/arm/mach-tegra/io.c
@@ -80,6 +80,19 @@ void __init tegra_map_common_io(void)
 	iotable_init(tegra_io_desc, ARRAY_SIZE(tegra_io_desc));
 }
 
+static bool is_ioremap_safe(unsigned long p)
+{
+	if (p < SZ_1G)
+		return true;
+
+#ifdef CONFIG_PCI
+	if (p >= 0x80000000 && p < 0xc0000000)
+		return true;
+#endif
+
+	return false;
+}
+
 /*
  * Intercept ioremap() requests for addresses in our fixed mapping regions.
  */
@@ -89,9 +102,9 @@ void __iomem *tegra_ioremap(unsigned long p, size_t size, unsigned int type)
 
 	/*
 	 * __arm_ioremap fails to set the domain of ioremapped memory
-	 * correctly, only use it on physical memory.
+	 * correctly, only use it on physical memory or PCI space.
 	 */
-	if (v == NULL && p < SZ_1G)
+	if (v == NULL && is_ioremap_safe(p))
 		v = __arm_ioremap(p, size, type);
 
 	/*
-- 
1.7.3.1
