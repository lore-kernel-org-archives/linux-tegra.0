From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 2/2] dma: tegra: add support for Tegra114 SoC
Date: Sun, 6 Jan 2013 21:52:03 +0530
Message-ID: <1357489323-21359-3-git-send-email-ldewangan@nvidia.com>
References: <1357489323-21359-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1357489323-21359-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org
Cc: djbw-b10kYP2dOMg@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

NVIDIA's Tegra114 has APB DMA controller which has 32 dma channels
and support support channel wise pause control.

Add support for Tegra114 which uses the channel wise pause control
hardware feature.

Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 1f3ea0f..d33c1ae 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -1217,8 +1217,19 @@ static const struct tegra_dma_chip_data tegra30_dma_chip_data = {
 	.support_channel_pause	= false,
 };
 
+/* Tegra114 specific DMA controller information */
+static const struct tegra_dma_chip_data tegra114_dma_chip_data = {
+	.nr_channels		= 32,
+	.max_dma_count		= 1024UL * 64,
+	.support_channel_pause	= true,
+};
+
+
 static const struct of_device_id tegra_dma_of_match[] = {
 	{
+		.compatible = "nvidia,tegra114-apbdma",
+		.data = &tegra114_dma_chip_data,
+	}, {
 		.compatible = "nvidia,tegra30-apbdma",
 		.data = &tegra30_dma_chip_data,
 	}, {
-- 
1.7.1.1
