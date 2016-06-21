From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH] ALSA: hda/tegra: iomem fixups for sparse warnings
Date: Tue, 21 Jun 2016 19:18:32 +0100
Message-ID: <1466533112-3262-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>, Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The readl/writel are not being passed __iomem annotated
variables, so fix the following sparse warnings by adding
__iomem in:

sound/pci/hda/hda_tegra.c:120:9: warning: incorrect type in argument 2 (different address spaces)
sound/pci/hda/hda_tegra.c:120:9:    expected void volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:120:9:    got unsigned int [usertype] *addr
sound/pci/hda/hda_tegra.c:125:16: warning: incorrect type in argument 1 (different address spaces)
sound/pci/hda/hda_tegra.c:125:16:    expected void const volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:125:16:    got unsigned int [usertype] *addr
sound/pci/hda/hda_tegra.c:134:13: warning: incorrect type in argument 1 (different address spaces)
sound/pci/hda/hda_tegra.c:134:13:    expected void const volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:134:13:    got void *dword_addr
sound/pci/hda/hda_tegra.c:137:9: warning: incorrect type in argument 2 (different address spaces)
sound/pci/hda/hda_tegra.c:137:9:    expected void volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:137:9:    got void *dword_addr
sound/pci/hda/hda_tegra.c:146:13: warning: incorrect type in argument 1 (different address spaces)
sound/pci/hda/hda_tegra.c:146:13:    expected void const volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:146:13:    got void *dword_addr
sound/pci/hda/hda_tegra.c:156:13: warning: incorrect type in argument 1 (different address spaces)
sound/pci/hda/hda_tegra.c:156:13:    expected void const volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:156:13:    got void *dword_addr
sound/pci/hda/hda_tegra.c:159:9: warning: incorrect type in argument 2 (different address spaces)
sound/pci/hda/hda_tegra.c:159:9:    expected void volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:159:9:    got void *dword_addr
sound/pci/hda/hda_tegra.c:168:13: warning: incorrect type in argument 1 (different address spaces)
sound/pci/hda/hda_tegra.c:168:13:    expected void const volatile [noderef] <asn:2>*addr
sound/pci/hda/hda_tegra.c:168:13:    got void *dword_addr
sound/pci/hda/hda_tegra.c:173:23: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
sound/pci/hda/hda_tegra.c:173:23:    expected void ( *reg_writel )( ... )
sound/pci/hda/hda_tegra.c:173:23:    got void ( static [toplevel] *<noident> )( ... )
sound/pci/hda/hda_tegra.c:174:22: warning: incorrect type in initializer (incompatible argument 1 (different address spaces))
sound/pci/hda/hda_tegra.c:174:22:    expected unsigned int ( *reg_readl )( ... )
sound/pci/hda/hda_tegra.c:174:22:    got unsigned int ( static [toplevel] *<noident> )( ... )
sound/pci/hda/hda_tegra.c:175:23: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
sound/pci/hda/hda_tegra.c:175:23:    expected void ( *reg_writew )( ... )
sound/pci/hda/hda_tegra.c:175:23:    got void ( static [toplevel] *<noident> )( ... )
sound/pci/hda/hda_tegra.c:176:22: warning: incorrect type in initializer (incompatible argument 1 (different address spaces))
sound/pci/hda/hda_tegra.c:176:22:    expected unsigned short ( *reg_readw )( ... )
sound/pci/hda/hda_tegra.c:176:22:    got unsigned short ( static [toplevel] *<noident> )( ... )
sound/pci/hda/hda_tegra.c:177:23: warning: incorrect type in initializer (incompatible argument 2 (different address spaces))
sound/pci/hda/hda_tegra.c:177:23:    expected void ( *reg_writeb )( ... )
sound/pci/hda/hda_tegra.c:177:23:    got void ( static [toplevel] *<noident> )( ... )
sound/pci/hda/hda_tegra.c:178:22: warning: incorrect type in initializer (incompatible argument 1 (different address spaces))
sound/pci/hda/hda_tegra.c:178:22:    expected unsigned char ( *reg_readb )( ... )
sound/pci/hda/hda_tegra.c:178:22:    got unsigned char ( static [toplevel] *<noident> )( ... )

Signed-off-by: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
Cc: Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>
Cc: Takashi Iwai <tiwai-IBi9RG/b67k@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
---
 sound/pci/hda/hda_tegra.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/sound/pci/hda/hda_tegra.c b/sound/pci/hda/hda_tegra.c
index 17fd817..0621920 100644
--- a/sound/pci/hda/hda_tegra.c
+++ b/sound/pci/hda/hda_tegra.c
@@ -115,20 +115,20 @@ static int substream_free_pages(struct azx *chip,
 /*
  * Register access ops. Tegra HDA register access is DWORD only.
  */
-static void hda_tegra_writel(u32 value, u32 *addr)
+static void hda_tegra_writel(u32 value, u32 __iomem *addr)
 {
 	writel(value, addr);
 }
 
-static u32 hda_tegra_readl(u32 *addr)
+static u32 hda_tegra_readl(u32 __iomem *addr)
 {
 	return readl(addr);
 }
 
-static void hda_tegra_writew(u16 value, u16 *addr)
+static void hda_tegra_writew(u16 value, u16 __iomem  *addr)
 {
 	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void *dword_addr = (void *)((unsigned long)(addr) & ~0x3);
+	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
 	u32 v;
 
 	v = readl(dword_addr);
@@ -137,20 +137,20 @@ static void hda_tegra_writew(u16 value, u16 *addr)
 	writel(v, dword_addr);
 }
 
-static u16 hda_tegra_readw(u16 *addr)
+static u16 hda_tegra_readw(u16 __iomem *addr)
 {
 	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void *dword_addr = (void *)((unsigned long)(addr) & ~0x3);
+	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
 	u32 v;
 
 	v = readl(dword_addr);
 	return (v >> shift) & 0xffff;
 }
 
-static void hda_tegra_writeb(u8 value, u8 *addr)
+static void hda_tegra_writeb(u8 value, u8 __iomem *addr)
 {
 	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void *dword_addr = (void *)((unsigned long)(addr) & ~0x3);
+	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
 	u32 v;
 
 	v = readl(dword_addr);
@@ -159,10 +159,10 @@ static void hda_tegra_writeb(u8 value, u8 *addr)
 	writel(v, dword_addr);
 }
 
-static u8 hda_tegra_readb(u8 *addr)
+static u8 hda_tegra_readb(u8 __iomem *addr)
 {
 	unsigned int shift = ((unsigned long)(addr) & 0x3) << 3;
-	void *dword_addr = (void *)((unsigned long)(addr) & ~0x3);
+	void __iomem *dword_addr = (void __iomem *)((unsigned long)(addr) & ~0x3);
 	u32 v;
 
 	v = readl(dword_addr);
-- 
2.8.1
