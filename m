Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E84371D1F;
	Sat, 26 Sep 2026 16:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790438590; cv=none; b=gpw8QDAOxAXYZ9/0akXou8yiERrJSalphzGrtEXcvNYBz1fW1TzzMhpk24TcOgvaqrC1VJhv17Jwxdss35Ji4deJZkELy4lcXO4p+hxD78iXsTQ0YCDeqtHEfBHwU2qEn5O5by0rngOtzYEW3iqW4LSFleflsvb5AVo4RQgOIFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790438590; c=relaxed/simple;
	bh=BWy9ymt+C3TfKogDDaUHpq9X5L8DGo37UtF+7eLoNBQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EM2TNIH3ywxDwI6khGON3NcG2gXzBDcwTv3K0u5Nw5W7M3JLyvc2k0CEQDk3kuAq08ozBYgVxlRc0+n48Hp5iUMTgDKaGs3ubqZVah86yC76BMotAnb5FNChAVNsYmMjeePNtb16MTNpK9g7USWpAuPQBWJSImG54yNuGeSj/ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=AIM1zMg+; arc=none smtp.client-ip=220.197.31.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="AIM1zMg+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=C+
	KFWhMVhDyc32PNB5YbDYV/IRrJTbVmHJi+TpvotRc=; b=AIM1zMg+krw1siZSuo
	nk9tHqYK0MjZfo9vaManOkA9LSt/Iy8ZJ6GUsdvABA1buasQNl770f+XDXVrQ7ge
	vqIpirBPNPIDojvie9rnc14BwR/8e02ZWYtIiYJaoBk8U55losBUFv3fL/gRTMkJ
	cFEQlYAuQZ1L+OnauSGq7vQ18=
Received: from pc.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgCXfquP7LdqtkMhBg--.22772S2;
	Sun, 27 Sep 2026 00:02:23 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Akhil R <akhilrajeev@nvidia.com>,
	Pavan Kunapuli <pkunapuli@nvidia.com>,
	Rajesh Gumasta <rgumasta@nvidia.com>,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH] dmaengine: tegra186-gpc-dma: Fix queued transfer stall
Date: Sun, 27 Sep 2026 00:02:12 +0800
Message-Id: <20260926160212.91438-1-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgCXfquP7LdqtkMhBg--.22772S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrykGr45uFy8GF4UJryrZwb_yoW5Ar15pa
	y7G39xG3yDtF13XF45GrW8ZFyUAF4ft3y29w4ayws3Cw4DXryq9F4xJa48KFWUAF92v3s2
	9F4Yy343Cw47XFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piLZ2sUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8BDnImq37JDuZgAA3M

tegra_dma_issue_pending() returns before taking vc.lock whenever a
descriptor is active. This skips vchan_issue_pending(), so descriptors
submitted while a transfer is running remain on desc_submitted. The
completion path clears dma_desc but never starts a queued descriptor,
leaving the transfer stalled until another issue_pending() call.

Always publish submitted descriptors under the lock, and only start a
new descriptor when the channel is idle. After a non-cyclic descriptor
completes, start the next issued descriptor. Centralize the start of a new
descriptor so cyclic preconfiguration is also performed when the
completion path starts it.

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/dma/tegra186-gpc-dma.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 64cedef1050a..4f4fdbda5e56 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -553,6 +553,21 @@ static void tegra_dma_start(struct tegra_dma_channel *tdc)
 		  sg_req->csr | TEGRA_GPCDMA_CSR_ENB);
 }
 
+static void tegra_dma_start_next(struct tegra_dma_channel *tdc)
+{
+	tegra_dma_start(tdc);
+
+	/*
+	 * For cyclic DMA transfers, program the second
+	 * transfer parameters as soon as the first DMA
+	 * transfer is started inorder for the DMA
+	 * controller to trigger the second transfer
+	 * with the correct parameters.
+	 */
+	if (tdc->dma_desc && tdc->dma_desc->cyclic)
+		tegra_dma_configure_next_sg(tdc);
+}
+
 static void tegra_dma_xfer_complete(struct tegra_dma_channel *tdc)
 {
 	vchan_cookie_complete(&tdc->dma_desc->vd);
@@ -560,6 +575,8 @@ static void tegra_dma_xfer_complete(struct tegra_dma_channel *tdc)
 	tegra_dma_sid_free(tdc);
 	tdc->dma_desc = NULL;
 	tdc->status = DMA_COMPLETE;
+
+	tegra_dma_start_next(tdc);
 }
 
 static void tegra_dma_chan_decode_error(struct tegra_dma_channel *tdc,
@@ -653,22 +670,9 @@ static void tegra_dma_issue_pending(struct dma_chan *dc)
 	struct tegra_dma_channel *tdc = to_tegra_dma_chan(dc);
 	unsigned long flags;
 
-	if (tdc->dma_desc)
-		return;
-
 	spin_lock_irqsave(&tdc->vc.lock, flags);
-	if (vchan_issue_pending(&tdc->vc))
-		tegra_dma_start(tdc);
-
-	/*
-	 * For cyclic DMA transfers, program the second
-	 * transfer parameters as soon as the first DMA
-	 * transfer is started inorder for the DMA
-	 * controller to trigger the second transfer
-	 * with the correct parameters.
-	 */
-	if (tdc->dma_desc && tdc->dma_desc->cyclic)
-		tegra_dma_configure_next_sg(tdc);
+	if (vchan_issue_pending(&tdc->vc) && !tdc->dma_desc)
+		tegra_dma_start_next(tdc);
 
 	spin_unlock_irqrestore(&tdc->vc.lock, flags);
 }
-- 
2.34.1

