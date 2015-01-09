From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 4/4] ARM: tegra: fix big-endian issue with irq code
Date: Fri,  9 Jan 2015 15:27:11 +0000
Message-ID: <1420817231-8346-5-git-send-email-bob.mottram@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420817231-8346-1-git-send-email-bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
Cc: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Replace the _raw-writel with writel_relaxed to fix issue with
running tegra in big-endian. Tested on Jetson TK1.

Signed-off-by: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
---
 arch/arm/mach-tegra/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/irq.c b/arch/arm/mach-tegra/irq.c
index ab95f53..f4c2857 100644
--- a/arch/arm/mach-tegra/irq.c
+++ b/arch/arm/mach-tegra/irq.c
@@ -94,7 +94,7 @@ static inline void tegra_irq_write_mask(unsigned int irq, unsigned long reg)
 	base = ictlr_reg_base[(irq - FIRST_LEGACY_IRQ) / 32];
 	mask = BIT((irq - FIRST_LEGACY_IRQ) % 32);

-	__raw_writel(mask, base + reg);
+	writel_relaxed(mask, base + reg);
 }

 static void tegra_mask(struct irq_data *d)
--
2.1.0
