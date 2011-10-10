From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: [PATCH v2 12/14] ARM: tegra: dma: staticify some tables and functions
Date: Sun,  9 Oct 2011 22:28:02 -0700
Message-ID: <1318224484-2090-13-git-send-email-olof@lixom.net>
References: <1317956064-17650-1-git-send-email-olof@lixom.net>
 <1318224484-2090-1-git-send-email-olof@lixom.net>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1318224484-2090-1-git-send-email-olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

None of them are used externally.

Signed-off-by: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
---
 arch/arm/mach-tegra/dma.c |   14 +++++++++-----
 1 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/mach-tegra/dma.c b/arch/arm/mach-tegra/dma.c
index f4ef5eb..c0cf967 100644
--- a/arch/arm/mach-tegra/dma.c
+++ b/arch/arm/mach-tegra/dma.c
@@ -105,13 +105,17 @@
 
 #define NV_DMA_MAX_TRASFER_SIZE 0x10000
 
-const unsigned int ahb_addr_wrap_table[8] = {
+static const unsigned int ahb_addr_wrap_table[8] = {
 	0, 32, 64, 128, 256, 512, 1024, 2048
 };
 
-const unsigned int apb_addr_wrap_table[8] = {0, 1, 2, 4, 8, 16, 32, 64};
+static const unsigned int apb_addr_wrap_table[8] = {
+	0, 1, 2, 4, 8, 16, 32, 64
+};
 
-const unsigned int bus_width_table[5] = {8, 16, 32, 64, 128};
+static const unsigned int bus_width_table[5] = {
+	8, 16, 32, 64, 128
+};
 
 #define TEGRA_DMA_NAME_SIZE 16
 struct tegra_dma_channel {
@@ -157,7 +161,7 @@ void tegra_dma_dequeue(struct tegra_dma_channel *ch)
 	return;
 }
 
-void tegra_dma_stop(struct tegra_dma_channel *ch)
+static void tegra_dma_stop(struct tegra_dma_channel *ch)
 {
 	u32 csr;
 	u32 status;
@@ -174,7 +178,7 @@ void tegra_dma_stop(struct tegra_dma_channel *ch)
 		writel(status, ch->addr + APB_DMA_CHAN_STA);
 }
 
-int tegra_dma_cancel(struct tegra_dma_channel *ch)
+static int tegra_dma_cancel(struct tegra_dma_channel *ch)
 {
 	u32 csr;
 	unsigned long irq_flags;
-- 
1.7.4.1
