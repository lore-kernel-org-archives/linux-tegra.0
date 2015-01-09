From: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: [PATCH 2/4] ARM: gpio: tegra: Maintain endianness
Date: Fri,  9 Jan 2015 15:27:09 +0000
Message-ID: <1420817231-8346-3-git-send-email-bob.mottram@codethink.co.uk>
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
 drivers/gpio/gpio-tegra.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-tegra.c b/drivers/gpio/gpio-tegra.c
index 1741981..a83e140 100644
--- a/drivers/gpio/gpio-tegra.c
+++ b/drivers/gpio/gpio-tegra.c
@@ -85,12 +85,12 @@ static struct tegra_gpio_bank *tegra_gpio_banks;

 static inline void tegra_gpio_writel(u32 val, u32 reg)
 {
-	__raw_writel(val, regs + reg);
+	writel_relaxed(val, regs + reg);
 }

 static inline u32 tegra_gpio_readl(u32 reg)
 {
-	return __raw_readl(regs + reg);
+	return readl_relaxed(regs + reg);
 }

 static int tegra_gpio_compose(int bank, int port, int bit)
--
2.1.0
