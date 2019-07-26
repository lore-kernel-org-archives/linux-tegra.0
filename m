From: Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.2 11/85] dmaengine: tegra-apb: Error out if DMA_PREP_INTERRUPT flag is unset
Date: Fri, 26 Jul 2019 09:38:21 -0400
Message-ID: <20190726133936.11177-11-sashal@kernel.org>
References: <20190726133936.11177-1-sashal@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <20190726133936.11177-1-sashal@kernel.org>
Sender: stable-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc: Dmitry Osipenko <digetx@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Vinod Koul <vkoul@kernel.org>, Sasha Levin <sashal@kernel.org>, dmaengine@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

From: Dmitry Osipenko <digetx@gmail.com>

[ Upstream commit dc161064beb83c668e0f85766b92b1e7ed186e58 ]

Apparently driver was never tested with DMA_PREP_INTERRUPT flag being
unset since it completely disables interrupt handling instead of skipping
the callbacks invocations, hence putting channel into unusable state.

The flag is always set by all of kernel drivers that use APB DMA, so let's
error out in otherwise case for consistency. It won't be difficult to
support that case properly if ever will be needed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
Acked-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/tegra20-apb-dma.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index ef317c90fbe1..79e9593815f1 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -977,8 +977,12 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_slave_sg(
 		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
+	if (flags & DMA_PREP_INTERRUPT) {
 		csr |= TEGRA_APBDMA_CSR_IE_EOC;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
 
 	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 
@@ -1120,8 +1124,12 @@ static struct dma_async_tx_descriptor *tegra_dma_prep_dma_cyclic(
 		csr |= tdc->slave_id << TEGRA_APBDMA_CSR_REQ_SEL_SHIFT;
 	}
 
-	if (flags & DMA_PREP_INTERRUPT)
+	if (flags & DMA_PREP_INTERRUPT) {
 		csr |= TEGRA_APBDMA_CSR_IE_EOC;
+	} else {
+		WARN_ON_ONCE(1);
+		return NULL;
+	}
 
 	apb_seq |= TEGRA_APBDMA_APBSEQ_WRAP_WORD_1;
 
-- 
2.20.1
