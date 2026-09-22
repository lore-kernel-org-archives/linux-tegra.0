Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 880C34F7CB3
	for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 07:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790061767; cv=none; b=ejpOtCuKNIECHHQEd0bnI4YxKxCZF1HgL5pTJVtczXhgxVB0T1LuLtTgUNrzS16tCjeZ1iAr2E7EbAj8dXtz4iBUS5ZT2dL2vDbtmedPRk37lHm3d0cKmb5bhEiNtHNueVrbElqdtYu/wSlAbFN+q1/NudGfeFK9MBQyC/VEDjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790061767; c=relaxed/simple;
	bh=40KTFaOhOR4XVyPXvsqIHuRMnZah7jhj6hPfzoMJXEI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Mp72bP8q4dYDLeshO/cqo40uPv5j0Cwbz3a6oXj3FJ1sZpaanskM/mLaCjS/FRyZJaxpyAr/TB6CnuPWQIv/m/mbQDjdkFUkCrDY/dTtNuPTtk5y4gn7hMDbJhoDTcnKgbsyQWSMUD+s8jgAgg3qPrSxYDXUlsIgvJ3C5XFu48U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deOKtKe2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deOKtKe2"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-39e03468a5fso3366842a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 22 Sep 2026 00:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790061766; x=1790666566; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqRdsoSwZuMFprPz4Ho4sF3JUn0Ps5OUJkmXS6wpmHg=;
        b=deOKtKe2IVbb3OSLqVuOXpITb8Q/YCFXj8+XlsXLIX+oyESUOeOczT/gJ3q85CRIB5
         ZwLE3rAARMpfCQfKJBMS6nN3r4PDJxjhaz67wtjznXdfmFf6lAlSqd7RXpu9+xjejzGz
         ZRzhWM76wcNMAQ4fkEOAQCvlLCg6jO6oD83NdgGtBlDCDvjLtNShUFo4gwOg6yEuhviC
         V0aH0CHVHqLO8y9PLNvbl/DBuINSqN8+dsTEFn7SFkTX+bBmV3rZfPbTnfkuPxN7lpbD
         fx1bkJpDzwjkv8cnJa5aagZIEFTjBGzzf5HslQ612PemJ1ozEzyaQsHpDVxLINh/sEFi
         YtLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790061766; x=1790666566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqRdsoSwZuMFprPz4Ho4sF3JUn0Ps5OUJkmXS6wpmHg=;
        b=xcyxMJsQhB8IkNtQbLWeMhn46GE7YWlL4RaiUUbzPFHh9e9tHqVgfvTN2Ak8hIWh4Q
         0mq6f76HNXqhX1UnfeHAAtHytrV7QTkNaaAAeztvJCnWx7L4ra3sjkv4vuDhEPKaQTPC
         9q6gZqjes+WacX/+T0W1tHqpmGSdgLeNRSQgFRYrqPn4T1NL3IXoOjohmxPzua4L7MkT
         Nw7ZA7SoUESNB5AR/BXTChgmg7W5HFAzgqBuOOy45OSsXNNkHX88PuVIvP8xbWni/05Y
         YPWfqqOfi54MNZHdsY9rEtrVXPRG2IklDAyRQ06vVm0o6E6TGmZNxjp7OIUVMTeBKs4A
         B6lw==
X-Forwarded-Encrypted: i=1; AKwUvBy8WVReh40W3rD31OwRawDlsyDx8Ud7CDUpYtNfISiT+RDQZxHaeAVMQlXI7B8u6zyP2BROmeBW+T2XCA==@vger.kernel.org
X-Gm-Message-State: AFuF++mD1a6xi1UPiulHOMdUnEBDCqNi9c1v7sHiqQ4a8fPsq9Mgq1I5
	qQUlhp7ReWrhxcBSP+CWrnsCZZdJRE6SjqJ96M2nFqZgAFCK009m7JqM
X-Gm-Gg: AYBFou22GM8lXPwm4K5VP71sdm4F5LGQ3Sppr5MKl1Rs9tqOVH5y6GqwDmd6nCWH+JA
	9Nn+lgxf+W0GESBkZwyvHz6O4KicjnJyxycmiXBRPLXjVqGL1PDirto5QPvSyF2mfvdIWdkZ6kA
	RNFhluOiUpP5wZShSq8pvHWtx+XCY+WAfHJ/a6Nz4fmI2jAp7pna5QbYO6vmurtLM2KbHVpfByv
	4b+bN3iS2ll1EiLjuOWKIKu896IgX0bAcn4cmD7+rudZk+ai8GgfEl+xNHRynIno2p3/eujFtn+
	5itXlB389Bh+hsGmsDXnKb7FEmNwPtbc7Q3voyp9Yf68Y6NaE0N5jtg4+OkWj4Hz2XPe05+Vsgf
	J2G+n+m71CvcXtwg+COvGbP4oS2rafDbHNiqVYGXcyhhAeR3l5CGC5jKJXo1TbIvFEK5X6/9Wr5
	aP/Y2aRo7swlf+nYmjquFvH+7Kq9oqAVXxXWJ+C2LM5DbKnF/co+FKEBkK3P7bC4/sRvlOBhgtT
	krlMxoiMxIcgTCZhz5B4f0wQKR6ckFlnmBpLgkCisEDmxmjK2mW+vS3opxcWGGOE3U=
X-Received: by 2002:a17:90b:4c81:b0:39e:6c69:34dd with SMTP id 98e67ed59e1d1-3a07334d199mr238687a91.65.1790061765828;
        Tue, 22 Sep 2026 00:22:45 -0700 (PDT)
Received: from localhost.localdomain (5.240.104.34.bc.googleusercontent.com. [34.104.240.5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a06dfd6705sm1851848a91.0.2026.09.22.00.22.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 22 Sep 2026 00:22:45 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: ldewangan@nvidia.com,
	jonathanh@nvidia.com,
	vkoul@kernel.org
Cc: dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Tue, 22 Sep 2026 15:22:33 +0800
Message-ID: <20260922072233.19592-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra_dma_tx_status() reads tdc->status before taking tdc->vc.lock, and
tegra_dma_isr() snapshots tdc->dma_desc before taking the same lock.  All
writers of these fields (tegra_dma_start(), tegra_dma_xfer_complete(),
tegra_dma_pause(), tegra_dma_resume() and tegra_dma_terminate_all()) update
them under tdc->vc.lock.

The unlocked read in tegra_dma_tx_status() can therefore report DMA_PAUSED
for a transfer that has already completed, and the unlocked read in
tegra_dma_isr() can pick up a tdc->dma_desc which is being cleared
concurrently, in which case the handler keeps using a stale descriptor
pointer.

Read both fields while holding tdc->vc.lock.

Fixes: ee17028 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
 drivers/dma/tegra186-gpc-dma.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -606,7 +606,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 {
 	struct tegra_dma_channel *tdc = dev_id;
-	struct tegra_dma_desc *dma_desc = tdc->dma_desc;
+	struct tegra_dma_desc *dma_desc;
 	struct tegra_dma_sg_req *sg_req;
 	u32 status;
 
@@ -619,6 +619,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id
 	}
 
 	spin_lock(&tdc->vc.lock);
+	dma_desc = tdc->dma_desc;
 	status = tdc_read(tdc, tdc->regs->status);
 	if (!(status & TEGRA_GPCDMA_STATUS_ISE_EOC))
 		goto irq_done;
@@ -786,10 +787,10 @@ static enum dma_status tegra_dma_tx_status(struct dma_
 	if (ret == DMA_COMPLETE)
 		return ret;
 
+	spin_lock_irqsave(&tdc->vc.lock, flags);
 	if (tdc->status == DMA_PAUSED)
 		ret = DMA_PAUSED;
 
-	spin_lock_irqsave(&tdc->vc.lock, flags);
 	vd = vchan_find_desc(&tdc->vc, cookie);
 	if (vd) {
 		dma_desc = vd_to_tegra_dma_desc(vd);
-- 
2.43.0

