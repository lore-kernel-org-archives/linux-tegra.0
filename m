From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: use IO_ADDRESS for getting virtual address
Date: Fri, 10 Aug 2012 18:33:02 +0530
Message-ID: <1344603782-2541-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org
Cc: linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Use macro IO_ADDRESS for getting virtual address of
corresponding physical address to make the consistency
with rest of Tegra code-base.
This macro calls the IO_TO_VIRT() which is defined in
arch/arm/mach-tegra/include/mach/iomap.h

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/apbio.c |    4 ++--
 arch/arm/mach-tegra/fuse.c  |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/mach-tegra/apbio.c b/arch/arm/mach-tegra/apbio.c
index dc0fe38..643a378 100644
--- a/arch/arm/mach-tegra/apbio.c
+++ b/arch/arm/mach-tegra/apbio.c
@@ -293,12 +293,12 @@ static apbio_write_fptr apbio_write;
 
 static u32 tegra_apb_readl_direct(unsigned long offset)
 {
-	return readl(IO_TO_VIRT(offset));
+	return readl(IO_ADDRESS(offset));
 }
 
 static void tegra_apb_writel_direct(u32 value, unsigned long offset)
 {
-	writel(value, IO_TO_VIRT(offset));
+	writel(value, IO_ADDRESS(offset));
 }
 
 void tegra_apb_io_init(void)
diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
index f946d12..0b7db17 100644
--- a/arch/arm/mach-tegra/fuse.c
+++ b/arch/arm/mach-tegra/fuse.c
@@ -93,9 +93,9 @@ void tegra_init_fuse(void)
 {
 	u32 id;
 
-	u32 reg = readl(IO_TO_VIRT(TEGRA_CLK_RESET_BASE + 0x48));
+	u32 reg = readl(IO_ADDRESS(TEGRA_CLK_RESET_BASE + 0x48));
 	reg |= 1 << 28;
-	writel(reg, IO_TO_VIRT(TEGRA_CLK_RESET_BASE + 0x48));
+	writel(reg, IO_ADDRESS(TEGRA_CLK_RESET_BASE + 0x48));
 
 	reg = tegra_fuse_readl(FUSE_SKU_INFO);
 	tegra_sku_id = reg & 0xFF;
-- 
1.7.1.1
