Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D1B55158A9
	for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 19:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790711093; cv=none; b=VzuOlRY31xzPD5nPTIJg1Pf4sy01nlzLI6qdreGI7qtGovvCDd54EpTuZXQ0v+uAg5kAoWTXRddBx+BJS3b4cu8gSrCi12l/Q0lBaaGDWb+1Y/HpZV+01kTAEtwgZ7VSWE2u94pcIf8eWPG6L389hFRmFCc+SzdmXlVa5e4AySg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790711093; c=relaxed/simple;
	bh=hPRoakWCFNkBhMs2RbAhu48KvrLhveA9lMJ+VhoTSvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fTa55I39+woVVqitR4HJHPbPT7Cl652+LRt7qDidB7Y0vvFk+Mwb8a/ytqc/FKaYxvFju8yQYDDKiDgDGT4sd6g9b7I5PUuC1nCD/0LNKFzBJgqhwHFfwToRbNDrPTPACdBOjY/ZE71pY4A3wkLel3kDstRba1++EKSaENtYeW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W2RrGCuz; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W2RrGCuz"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso28449455e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 29 Sep 2026 12:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790711090; x=1791315890; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=W2RrGCuzyiUo486ZWweqmInm0hRPG5G0t6Cg1EgLa+tV+YpF5jOgrIQAsiZ7GdCo8b
         +Z2i5tSLY9pTrw21j+6FI17GnWAa4EIm9tJrMVMZ9Z1vnpzXz611kdDp+6HNIelFY0oo
         TtbeinbHNapMT5yYJfeazHt7UBGQ/V8jmd/pgm6dv3CNe35VTRyYL5plK3MhlvPse4zv
         gMSPjzext4OLWDJPNODcfU0O598DYsWt1MZlx/OqP3qao6hobl0jjIKGtZwTsDJPPdx3
         edZ4Efp1RLcnRufEOYWxzMP9nMT5Txns3bCTDb4ulqmbids+dUcP2vE66WiiNbb96QIa
         D7hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790711090; x=1791315890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1xPmHroPUS9i0jXfxLubKHHis3db3+ArB5MF0c1e2XM=;
        b=23VlNf9iu7yXbeIWh+ael/BgDwoNggId30doaVUXkCWHXVl9p+mZXHctOYKzoelRml
         uG5eb/lxluj/2y88muWFlmxgkq8T5zRsBJDe79N5ZE+zfWXtOXQ1Ayc4EYNbP3U+58vY
         MS+y2RT7Z75iiUgiMNfs1FtEx4W4D3rsArHXxJgRVy+IcwPr0btGVpVRTzGLn98KZ4vC
         JAEI/fOzLSEQE7GJAfLOaiscsM4gGdJmwAFKLKlZG79VSISPwglNR5RARVHo8VbjOi2G
         oTcpCp6fxf2Nvo74+5AcZGA9IDE0wTzLm03cmLCnSngRQvphfZtp6pBJByCHcUuUIDL+
         D8dQ==
X-Forwarded-Encrypted: i=1; AKwUvBzmqQxqWRPmmvtyIzYwOJrgi4WIUoUr/S7X0TDTEak6q5PBBjh58RHdBDoZnAIGbnDYbN5c8xEZMidIRA==@vger.kernel.org
X-Gm-Message-State: AFuF++lY8CxnGulVyrGjRk6ShtWF/SJSpiGU+k4KdWNamVOjS9vC8YOQ
	M1Ae9JeH5SWA2pbgqmE9Oynaf7s4oX+E86jmpLpbTQJLKVkluWg0REgv
X-Gm-Gg: AYBFou2mmCU10t/5hvQPE3bWvuXCDkk6oAGa3BWKgmRlXZsMmNUhndKRYVGGejovTC0
	nIUTCpANzF+ExjbLkF9lpa/+AFaatWU50k7MahAUez1kGk1JNiDtrhvkitZEKnGP4qiG2d7MNnz
	Wei22JRBQxj5ANjFfiHdXpYP082U5h82M4Q0wXAUXlmDbcjB7sm71F9lYcX0TziGlbcSos6ShTe
	+BrVu3wXIOwhD0xFVMdblj6Lq/WxCo10nEAxq1qJQB266k1xrZekaT9wPUvNkw8aGF5ra5TCAmB
	gneQGFq8UpMPHB0o/O/fGIgojAC/kt8BQhGQBAfVV8r8VPpPKa+GDIE2scvyyz6MbylrVcWHMQH
	3JuPX+fWgttjAO0MgN0VbnA4KxSZV/UEXbzqe8FBKnQjVN7LA2jqUkYGTr7lF8WHGQRcjLo1/8h
	bNRDqiHiVilYU4v4nk17Si3MjlWnANEoWlFWIP4vSOwjpD//W56jaVIPx7vGDKbCkgfWYgEexEa
	qzVS8Wq3iEI7KuI0H2Eb/9O
X-Received: by 2002:a05:600c:1546:b0:49f:e4ca:e09 with SMTP id 5b1f17b1804b1-4a014fd1e9cmr2899905e9.3.1790711089450;
        Tue, 29 Sep 2026 12:44:49 -0700 (PDT)
Received: from localhost.localdomain ([82.142.85.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a014895428sm5265825e9.0.2026.09.29.12.44.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 29 Sep 2026 12:44:48 -0700 (PDT)
From: Ginger Li <ginger.jzllee@gmail.com>
To: Markus.Elfring@web.de,
	dmaengine@vger.kernel.org,
	linux-tegra@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	jonathanh@nvidia.com,
	ldewangan@nvidia.com,
	vkoul@kernel.org
Subject: [PATCH v2] dmaengine: tegra186-gpc-dma: Read channel state under the lock
Date: Tue, 29 Sep 2026 21:44:34 +0200
Message-ID: <20260929194434.29937-1-ginger.jzllee@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260922072233.19592-1-ginger.jzllee@gmail.com>
References: <20260922072233.19592-1-ginger.jzllee@gmail.com>
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

Fixes: ee17028009d4 ("dmaengine: tegra: Add tegra gpcdma driver")
Signed-off-by: Ginger Li <ginger.jzllee@gmail.com>
---
v2:
 - Fixes: expanded to 12 hex digits.
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

