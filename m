From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 12/19] dmaengine: tegra-apb: Remove handling of unrealistic error condition
Date: Mon,  3 Feb 2020 01:28:47 +0300
Message-ID: <20200202222854.18409-13-digetx@gmail.com>
References: <20200202222854.18409-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200202222854.18409-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vinod Koul <vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Dan Williams <dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux-CoA6ZxLDdyEEUmgCuDUIdw@public.gmane.org>
Cc: dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

The pending_sg_req list can't ever be empty because:

1. If it was empty, then handle_cont_sngl_cycle_dma_done() shall crash
   before of handle_continuous_head_request() invocation.

2. The handle_cont_sngl_cycle_dma_done() can't happen after stopping DMA.

Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/dma/tegra20-apb-dma.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 62d181bd5e62..c7dc27ef1856 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -564,12 +564,6 @@ static bool handle_continuous_head_request(struct tegra_dma_channel *tdc,
 {
 	struct tegra_dma_sg_req *hsgreq;
 
-	if (list_empty(&tdc->pending_sg_req)) {
-		dev_err(tdc2dev(tdc), "DMA is running without req\n");
-		tegra_dma_stop(tdc);
-		return false;
-	}
-
 	/*
 	 * Check that head req on list should be in flight.
 	 * If it is not in flight then abort transfer as
-- 
2.24.0
