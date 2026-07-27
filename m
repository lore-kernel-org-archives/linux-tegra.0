Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B142BC35
	for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785184359; cv=none; b=L1u2uyls87bzX8xNENAOaDvnRFn4/luTjpzdEB/DVixb73bGAisN9PzLxo5/GSfKGFDaCujVWYmLjhRqIjlI+ZwM7S+M82c5NEZ2Glrsd04Cf7P9DzGQT0lz7eDuDUHQqftvBF/WsPr5KckMiH6uj8Ss+DV60d6FJgKjyCMMzxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785184359; c=relaxed/simple;
	bh=pWOINvpvzUYaTT5ZuuNXa4CQJk024srq20DFh17o5LE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SlVe/7FJI+LTEUwGKnI0DkSe64TenMNSn+6cwvBH4CHfXBDmd4JblOHMG3mrSL7cnpsKZaueGBMwyASBPBjna0mKeDbMy1lz3oogMShFIC3/rn9sBymhgP7RPUneAGMpRyKOhen1Trfq4Wgg2UEQr0drw24cJBXb2t8XhVuFmZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cnApAUQC; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cnApAUQC"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so46715815ad.0
        for <linux-tegra@vger.kernel.org>; Mon, 27 Jul 2026 13:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785184357; x=1785789157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RjPVk9aBwGJNIU47uhT2CmAlqNdzp6PPFmjL71R2AUI=;
        b=cnApAUQClrwg9AEMDnBylVPyn0nniebe8O4VGy+qxT+1Oa+ZXHftVzMvCMG1U8ylBg
         B6ec/QpGq967/6ntpN49Y1X1nGa9mAczysUUAA6qXAflOuI+Illl+ucr9uehnAvjlYz2
         8oGol8EaZpb3E3VSNJC14cQ5npXzf42IhjRHJfQghZys5aSQh1IEn6xWqsIAxXn43ihG
         3LEhhA7BBRdkCKFLh69Bzji2XCU2CwqUCx6FN+YwrVlbHQRzMjfkb/XkbqDzmCAwTYA7
         i/hVnHsqxs2shqkOHXmaP0v/zIbKalPsE+y3aCL5ctWM2d1XpFClFOyDSwPSQgtKZ40U
         qNhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785184357; x=1785789157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RjPVk9aBwGJNIU47uhT2CmAlqNdzp6PPFmjL71R2AUI=;
        b=gcHmHVxVsMJBVN/uxvKIDrk+MOOFBCfWDoCg4dra+6MTWW53Um4QFHdyYU+BAmme0X
         DqPvmp8C2bzmgCBJZUih4TCWSDRcMJ8uPNloO3A2HnMvpTuEJkqY+0hurXwRvyE6VA9v
         D9LabfTi+BkkmgkAnisz2aqeIn7G7V+3IhpJHZpfpeX/IEAFWcVVJlD8ta0ax7ETYlzP
         Zd0Wr8ykpjVCwDw3N07B4mMB8LKgCvPfU6YsMWf7TRsBfnUGrzYlj1EM4JFzVKNUO9nE
         c7nfEJfiS+zd/989oFlSv3BW1x6c2h9dmKDyEAimNkbblFT+XSkuJy5XYgiOpQdeguh7
         iFzw==
X-Forwarded-Encrypted: i=1; AHgh+RqIw+2gMaduFgSuQwSJGVqa/HYz7CSIP6sHnOVgaHYnCSJTYyPHZD5kjfRq8bFwLoXpS9QXSnAei1RP7Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxP4EI4OWy1ebztx/EbiaAmkVUlp53Vqii6sTq1Uwtn0KDoLIgp
	TOdH8ZGY/KMGxm0pSDL5K0f3EYhgbUwTTSDUoHipezkEn68PEUClTU5p
X-Gm-Gg: AR+sD10GxeuIgKww5Yyzf3eQ5W+GrxsiLU9/NPCCHGnv8vQsLy3RUNiqCd3Jxu9nwSw
	nstZgWPxqwwWGVqfVVqE7FRNhlDDyTF62XSPkwm+mTy4pCNyFA1ig8rYItdnvsJzSCeTXN0QvCc
	F+MsI0p086tPkxj8quV/TRuuvF+gxewp/dVGJbw1s7cTgdmqMtvr58vwG4S3Jf/yrAkcBmoqYz/
	bd5/g5GYHRlE2Lp0EkHWgd6lT+c1wQQ5WYJsjuipRlwlWxMbgmZ4JXsdtXvGqiQJ7Ceuf1LWPnv
	3CKWT7THwvg4UgocZCpSoXjPbpwmlODmsIN7ykfmK5u8YgyemlhIr19seUWYnq1x5XhQz6pqzL/
	cR9+l4CFuyH+Cws9OxWmYA//2KEIrznSo5MLaIEJrQ2uAQlB4N/szzOWftYE55vGLpeA+9zWo9P
	RBDhfB
X-Received: by 2002:a17:903:2451:b0:2cf:b23d:77f with SMTP id d9443c01a7336-2cfde7cafdfmr97729245ad.20.1785184357255;
        Mon, 27 Jul 2026 13:32:37 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fab:e200:3789:64f9:8855:c0af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde59b768sm41551805ad.4.2026.07.27.13.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 13:32:33 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v2 22/64] dmaengine: tegra20-apb: use channel BH helpers
Date: Mon, 27 Jul 2026 13:28:50 -0700
Message-ID: <5217cae9e0ebd8e828eec764ddd0844955475719.1785183549.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1785183549.git.allen.lkml@gmail.com>
References: <20260108080332.2341725-1-allen.lkml@gmail.com> <cover.1785183549.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Switch the per-channel tasklet to dma_chan_*_bh so completion handling
runs through the shared per-channel deferral mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 640b8a218c9a..de15b8d3e8cb 100644
--- a/drivers/dma/tegra20-apb-dma.c
+++ b/drivers/dma/tegra20-apb-dma.c
@@ -194,9 +194,8 @@ struct tegra_dma_channel {
 	struct list_head	free_dma_desc;
 	struct list_head	cb_desc;
 
-	/* ISR handler and tasklet for bottom half of isr handling */
+	/* ISR handler for bottom-half processing */
 	dma_isr_handler		isr_handler;
-	struct tasklet_struct	tasklet;
 
 	/* Channel-slave specific configuration */
 	unsigned int slave_id;
@@ -632,9 +631,10 @@ static void handle_cont_sngl_cycle_dma_done(struct tegra_dma_channel *tdc,
 	}
 }
 
-static void tegra_dma_tasklet(struct tasklet_struct *t)
+static void tegra_dma_tasklet(struct dma_chan *chan)
 {
-	struct tegra_dma_channel *tdc = from_tasklet(tdc, t, tasklet);
+	struct tegra_dma_channel *tdc = container_of(chan, struct tegra_dma_channel,
+						     dma_chan);
 	struct dmaengine_desc_callback cb;
 	struct tegra_dma_desc *dma_desc;
 	unsigned int cb_count;
@@ -670,7 +670,7 @@ static irqreturn_t tegra_dma_isr(int irq, void *dev_id)
 	if (status & TEGRA_APBDMA_STATUS_ISE_EOC) {
 		tdc_write(tdc, TEGRA_APBDMA_CHAN_STATUS, status);
 		tdc->isr_handler(tdc, false);
-		tasklet_schedule(&tdc->tasklet);
+		dma_chan_schedule_bh(&tdc->dma_chan);
 		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
@@ -819,7 +819,7 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	 */
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
 
-	tasklet_kill(&tdc->tasklet);
+	dma_chan_kill_bh(&tdc->dma_chan);
 
 	pm_runtime_put(tdc->tdma->dev);
 }
@@ -1317,7 +1317,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
 	tegra_dma_terminate_all(dc);
-	tasklet_kill(&tdc->tasklet);
+	dma_chan_kill_bh(&tdc->dma_chan);
 
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
 	list_splice_init(&tdc->free_sg_req, &sg_req_list);
@@ -1511,7 +1511,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tdc->id = i;
 		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
-		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
+		dma_chan_init_bh(&tdc->dma_chan, tegra_dma_tasklet);
 		spin_lock_init(&tdc->lock);
 		init_waitqueue_head(&tdc->wq);
 
@@ -1617,7 +1617,7 @@ static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
-		tasklet_kill(&tdc->tasklet);
+		dma_chan_kill_bh(&tdc->dma_chan);
 
 		spin_lock_irqsave(&tdc->lock, flags);
 		busy = tdc->busy;
-- 
2.43.0

