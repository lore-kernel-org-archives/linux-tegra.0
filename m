Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109C943550C
	for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 18:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786385474; cv=none; b=AtORwIlSwipo6JBtel7kxaXt4ZMNaKxSp9oeVzr7VTqOXQ6oFxvbJ7zT1I47/LDUQqtHo9S7KFV5Won4ijUccnN0QRvoq+3bZW2NcjDQFFEboCvhWuM4cJcA1odVfBttkMDog9Ae8lwzfykUrQ+/mrn3s2o/vj9E7cVba1sjoiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786385474; c=relaxed/simple;
	bh=1e1W60VLhLVNCXV4mV3fSxqD4L/2jwh51vMAp+ppPdY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WB5/1LhVK89hAJQmfiNIeAirSmBYOoiYs0HoZRrOGez/MZvSbxtJBPMxpnMRiodxjUNfNBMr3gB8/IDtqjx6JDj37nZ3wqGu3G79Syjl1my9QdCtOozgI/DysMXmwPBSoW9XjGqqlkWGGGM3vprP8N3gr33Eu5KQqZzw+w1GblY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Sb1rI/Zl; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Sb1rI/Zl"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-38e58034d05so2300971a91.2
        for <linux-tegra@vger.kernel.org>; Mon, 10 Aug 2026 11:11:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786385471; x=1786990271; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rHfyMg3ZXRZvT1DVo781MRRb99MTPvEFRM7vzLcRs/o=;
        b=Sb1rI/ZlX1t9zCnoaNOUApdz9RXWMi/ZqQOjQH1TX7yowe3U5IkFZdEo8qeexmwiAF
         io97xTSVL9o/+8dXV+7ZKhCk8Esnc9fza/U6FLCNOjIkY6IHx2lbuWIobldfcPxycEI7
         pCsO5YEqSp6mL5iDWaTpSbn32zMSq3JV4172VUhHzCG8btssW5diUNL5riI8fPIeB+xy
         D3gBYE3pPPww2Kko5D2XXjgOts9R77WUuTkTC7OHE0epdr7ZJmLiWKx45Uc3AU3i7H4E
         Hl8I832llcgbJgSUIKugGLXNFnmLxPyd1adFNClgQlmQsjf36+7Rhk1S8SKJsmPFFDrB
         F76g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786385471; x=1786990271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rHfyMg3ZXRZvT1DVo781MRRb99MTPvEFRM7vzLcRs/o=;
        b=F9QDXUrL0zxgWGrEGC5WLAHX2+eN59mq7t7HRKaSOEgrDFvJX4T4P0TDMBFYM9OLi3
         1koGD3S0BqSh5SkKq+EI4mpyXkyJbccnff6bwCTbDUMMUZaJpg0TnTAny6MSzKOFhy6N
         vRYIwi33Vz16m66WVo6xrTdoR0CHvePohqy70F7huRd9uAdIV7SN+pugFOsrssc52/07
         zVj0AwUjBFyw9eYUfWIzis85qqjhlsSwQX00PWl+6Tcx5RXe2ZXJYqX19pqO5NEMw1n8
         hyWDpk5psiUHqIsUe0FmAxX431gZGn4JZXaqkre7+7zzKOlLXudP1q5xOX0Hzdzm89o9
         zm+A==
X-Forwarded-Encrypted: i=1; AHgh+RpcsdDffTmi8igh0wlB0Yqh6benIZjShVsKPU0QkrxsutFCPAjpOIOGykkXGtq1v0IOgciM0MsFh46qHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyMhy0h598roL7WOjzb1J2WRys10jiZK/vVCfLtW+6WY7vswyJ4
	5XtGj+VCH2VSSKLyWhZ+DYG7V5jrd2sBY3SVFEP6oXN2jw/eNy2kh/Dd
X-Gm-Gg: AR+sD10jQotmL7GovrjzFJPapla+UyMApuRw1NnYVO51sKQaoNJ5pYwiMxOikyzxEg6
	csIKhKswQtXIah1ZuhDUew9QeQZq0GTKukBruLSq8CauD2RUuD756BocQ/ng0zKl23z8wQF1M/d
	cxZGENL1Hv0pwaD8cTBiRwQKdC0lx+4alBlAx4AlJumL21fqUyYishp0bym/VLcDSz27zIEs3zu
	dD5iZ/LsdKGfAXi3P4VofzEEwWhlIZg3/2lJy3IQzYMqwEihgHGW+LaeVSpgOBbwNZZ1HnZkXrk
	32zdGqa/llXd/dudh1PqL9/VYzldRXGPE2hwV0E5l/7e/rCtC5jJf+GPtCF4torMkDWfVJGWBGJ
	bl1Q326RCY+P9STL7FNSn4iizdxPB0QrUi50Ft7IsSgZCVoYiNGsP8D0fcb8/LJ3zma/LDAHgEL
	QEMw9j6PNzuHekLxRn60dngWzXljZGv/8upTlYHQZz7uX3QmznpcBzNBjwYC617qI=
X-Received: by 2002:a17:90b:28c3:b0:381:bc4c:da56 with SMTP id 98e67ed59e1d1-3903c6128c6mr47954742a91.19.1786385471145;
        Mon, 10 Aug 2026 11:11:11 -0700 (PDT)
Received: from cryptic.lan ([2001:569:7fa9:fa00:b1a9:6513:83c6:1d23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-392d53b873asm472795a91.17.2026.08.10.11.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 11:11:10 -0700 (PDT)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Kees Cook <kees@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	Stephan Gerhold <stephan.gerhold@linaro.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH v3 01/34] dmaengine: add tasklet-backed channel BH helpers
Date: Mon, 10 Aug 2026 11:09:02 -0700
Message-ID: <2c62c39cafc0df59eb5381d3da82b1616a58fa20.1786384168.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1786384168.git.allen.lkml@gmail.com>
References: <cover.1785183549.git.allen.lkml@gmail.com> <cover.1786384168.git.allen.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DMAengine drivers commonly use a per-channel tasklet to invoke client
callbacks. Add helpers that initialize, schedule, and kill a channel
bottom half, with an initial tasklet-backed implementation that preserves
the existing execution context.

Convert virt-dma to the new API and remove its private tasklet. Update all
drivers that directly kill or override that tasklet in the same change so
no stale users remain. While touching the completion handler, avoid forming
a result pointer from a NULL cyclic descriptor.

This establishes a backend-independent API before changing how channel
bottom halves are dispatched.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/bcm2835-dma.c                     |  2 +-
 drivers/dma/dma-axi-dmac.c                    | 10 +++--
 drivers/dma/dma-jz4780.c                      |  2 +-
 drivers/dma/dmaengine.c                       | 42 +++++++++++++++++++
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    |  2 +-
 drivers/dma/dw-edma/dw-edma-core.c            |  2 +-
 drivers/dma/fsl-edma-common.c                 |  2 +-
 drivers/dma/fsl-qdma.c                        |  2 +-
 drivers/dma/hisi_dma.c                        |  2 +-
 drivers/dma/hsu/hsu.c                         |  2 +-
 drivers/dma/idma64.c                          |  4 +-
 drivers/dma/img-mdc-dma.c                     |  2 +-
 drivers/dma/imx-sdma.c                        |  4 +-
 drivers/dma/k3dma.c                           |  2 +-
 drivers/dma/loongson/loongson1-apb-dma.c      |  2 +-
 drivers/dma/mediatek/mtk-cqdma.c              |  2 +-
 drivers/dma/mediatek/mtk-hsdma.c              |  2 +-
 drivers/dma/mediatek/mtk-uart-apdma.c         |  4 +-
 drivers/dma/owl-dma.c                         |  2 +-
 drivers/dma/pxa_dma.c                         |  2 +-
 drivers/dma/qcom/bam_dma.c                    |  4 +-
 drivers/dma/qcom/qcom_adm.c                   |  4 +-
 drivers/dma/sa11x0-dma.c                      |  2 +-
 drivers/dma/sf-pdma/sf-pdma.c                 |  2 +-
 drivers/dma/sprd-dma.c                        |  2 +-
 drivers/dma/st_fdma.c                         |  2 +-
 drivers/dma/sun6i-dma.c                       |  2 +-
 drivers/dma/tegra186-gpc-dma.c                |  2 +-
 drivers/dma/tegra210-adma.c                   |  2 +-
 drivers/dma/ti/edma.c                         |  2 +-
 drivers/dma/ti/k3-udma.c                      | 12 +++---
 drivers/dma/ti/omap-dma.c                     |  2 +-
 drivers/dma/virt-dma.c                        | 12 +++---
 drivers/dma/virt-dma.h                        |  7 ++--
 include/linux/dmaengine.h                     | 28 +++++++++++++
 35 files changed, 125 insertions(+), 54 deletions(-)

diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..c8add249dbfb 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -829,7 +829,7 @@ static void bcm2835_dma_free(struct bcm2835_dmadev *od)
 	list_for_each_entry_safe(c, next, &od->ddev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 
 	dma_unmap_page_attrs(od->ddev.dev, od->zero_page, PAGE_SIZE,
diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index d47ff27e1408..d245d04c3a27 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -1195,9 +1195,11 @@ static int axi_dmac_detect_caps(struct axi_dmac *dmac, unsigned int version)
 	return 0;
 }
 
-static void axi_dmac_tasklet_kill(void *task)
+static void axi_dmac_kill_bh(void *data)
 {
-	tasklet_kill(task);
+	struct dma_chan *chan = data;
+
+	dmaengine_kill_bh(chan);
 }
 
 static void axi_dmac_free_dma_controller(void *of_node)
@@ -1302,8 +1304,8 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	 * Put the action in here so it get's done before unregistering the DMA
 	 * device.
 	 */
-	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_tasklet_kill,
-				       &dmac->chan.vchan.task);
+	ret = devm_add_action_or_reset(&pdev->dev, axi_dmac_kill_bh,
+				       &dmac->chan.vchan.chan);
 	if (ret)
 		return ret;
 
diff --git a/drivers/dma/dma-jz4780.c b/drivers/dma/dma-jz4780.c
index 6070dfdb7114..738801501e29 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -1019,7 +1019,7 @@ static void jz4780_dma_remove(struct platform_device *pdev)
 	free_irq(jzdma->irq, jzdma);
 
 	for (i = 0; i < jzdma->soc_data->nb_channels; i++)
-		tasklet_kill(&jzdma->chan[i].vchan.task);
+		dmaengine_kill_bh(&jzdma->chan[i].vchan.chan);
 }
 
 static const struct jz4780_dma_soc_data jz4740_dma_soc_data = {
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 9049171df857..d8fc7eb71b48 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1428,6 +1428,48 @@ static void dmaengine_destroy_unmap_pool(void)
 	}
 }
 
+static void dma_chan_bh_entry(struct tasklet_struct *tasklet)
+{
+	struct dma_chan *chan = from_tasklet(chan, tasklet, bh_tasklet);
+	dmaengine_bh_work_fn fn = READ_ONCE(chan->bh_work_fn);
+
+	if (fn)
+		fn(chan);
+}
+
+void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn)
+{
+	if (WARN_ON(!fn))
+		return;
+
+	if (WARN_ON(chan->bh_work_initialized))
+		return;
+
+	chan->bh_work_fn = fn;
+	tasklet_setup(&chan->bh_tasklet, dma_chan_bh_entry);
+	chan->bh_work_initialized = true;
+}
+EXPORT_SYMBOL_GPL(dmaengine_init_bh);
+
+bool dmaengine_schedule_bh(struct dma_chan *chan)
+{
+	if (WARN_ON(!chan->bh_work_initialized))
+		return false;
+
+	tasklet_schedule(&chan->bh_tasklet);
+	return true;
+}
+EXPORT_SYMBOL_GPL(dmaengine_schedule_bh);
+
+void dmaengine_kill_bh(struct dma_chan *chan)
+{
+	if (!chan->bh_work_initialized)
+		return;
+
+	tasklet_kill(&chan->bh_tasklet);
+}
+EXPORT_SYMBOL_GPL(dmaengine_kill_bh);
+
 static int __init dmaengine_init_unmap_pool(void)
 {
 	int i;
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index bcefaff03b5c..a2b688e7f47e 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1663,7 +1663,7 @@ static void dw_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
 		list_del(&chan->vc.chan.device_node);
-		tasklet_kill(&chan->vc.task);
+		dmaengine_kill_bh(&chan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index 89a4c498a17b..ade866fba2ad 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -1170,7 +1170,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
-		tasklet_kill(&chan->vc.task);
+		dmaengine_kill_bh(&chan->vc.chan);
 		list_del(&chan->vc.chan.device_node);
 	}
 
diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456df..90ae678c68d4 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -915,7 +915,7 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				&dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dmaengine_kill_bh(&chan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index df843fad0ece..b0ace8bad498 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -1255,7 +1255,7 @@ static void fsl_qdma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				 &dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dmaengine_kill_bh(&chan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
index 28bf818f9aa6..10eb98350b9f 100644
--- a/drivers/dma/hisi_dma.c
+++ b/drivers/dma/hisi_dma.c
@@ -720,7 +720,7 @@ static void hisi_dma_disable_qps(struct hisi_dma_dev *hdma_dev)
 
 	for (i = 0; i < hdma_dev->chan_num; i++) {
 		hisi_dma_disable_qp(hdma_dev, i);
-		tasklet_kill(&hdma_dev->chan[i].vc.task);
+		dmaengine_kill_bh(&hdma_dev->chan[i].vc.chan);
 	}
 }
 
diff --git a/drivers/dma/hsu/hsu.c b/drivers/dma/hsu/hsu.c
index f62d60d7bc6b..315d0ebecd57 100644
--- a/drivers/dma/hsu/hsu.c
+++ b/drivers/dma/hsu/hsu.c
@@ -500,7 +500,7 @@ int hsu_dma_remove(struct hsu_dma_chip *chip)
 	for (i = 0; i < hsu->nr_channels; i++) {
 		struct hsu_dma_chan *hsuc = &hsu->chan[i];
 
-		tasklet_kill(&hsuc->vchan.task);
+		dmaengine_kill_bh(&hsuc->vchan.chan);
 	}
 
 	return 0;
diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index 5fcd1befc92d..1d395fb735ff 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -617,14 +617,14 @@ static void idma64_remove(struct idma64_chip *chip)
 
 	/*
 	 * Explicitly call devm_request_irq() to avoid the side effects with
-	 * the scheduled tasklets.
+	 * scheduled BH work.
 	 */
 	devm_free_irq(chip->dev, chip->irq, idma64);
 
 	for (i = 0; i < idma64->dma.chancnt; i++) {
 		struct idma64_chan *idma64c = &idma64->chan[i];
 
-		tasklet_kill(&idma64c->vchan.task);
+		dmaengine_kill_bh(&idma64c->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index b3765ba15803..0c6024088444 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -1031,7 +1031,7 @@ static void mdc_dma_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, mchan->irq, mchan);
 
-		tasklet_kill(&mchan->vc.task);
+		dmaengine_kill_bh(&mchan->vc.chan);
 	}
 
 	pm_runtime_disable(&pdev->dev);
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 36368835a845..4d13b9d2880d 100644
--- a/drivers/dma/imx-sdma.c
+++ b/drivers/dma/imx-sdma.c
@@ -2399,11 +2399,11 @@ static void sdma_remove(struct platform_device *pdev)
 	int i;
 
 	devm_free_irq(&pdev->dev, sdma->irq, sdma);
-	/* Kill the tasklet */
+	/* Kill the channel BH */
 	for (i = 0; i < MAX_DMA_CHANNELS; i++) {
 		struct sdma_channel *sdmac = &sdma->channel[i];
 
-		tasklet_kill(&sdmac->vc.task);
+		dmaengine_kill_bh(&sdmac->vc.chan);
 		sdma_free_chan_resources(&sdmac->vc.chan);
 	}
 
diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index e84f197fea76..3d73b391e42e 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -976,7 +976,7 @@ static void k3_dma_remove(struct platform_device *op)
 
 	list_for_each_entry_safe(c, cn, &d->slave.channels, vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 	tasklet_kill(&d->task);
 	clk_disable_unprepare(d->clk);
diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..52a360719644 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -552,7 +552,7 @@ static void ls1x_dma_chan_remove(struct ls1x_dma *dma)
 
 		if (chan->vc.chan.device == &dma->ddev) {
 			list_del(&chan->vc.chan.device_node);
-			tasklet_kill(&chan->vc.task);
+			dmaengine_kill_bh(&chan->vc.chan);
 		}
 	}
 }
diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index 80791e30aec2..7b44d3358cda 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -895,7 +895,7 @@ static void mtk_cqdma_remove(struct platform_device *pdev)
 		vc = &cqdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dmaengine_kill_bh(&vc->vc.chan);
 	}
 
 	/* disable interrupt */
diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index a43412ff5edd..75555fa41536 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1020,7 +1020,7 @@ static void mtk_hsdma_remove(struct platform_device *pdev)
 		vc = &hsdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dmaengine_kill_bh(&vc->vc.chan);
 	}
 
 	/* Disable DMA interrupt */
diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index c269d84d7bd2..8ce206a0ecc5 100644
--- a/drivers/dma/mediatek/mtk-uart-apdma.c
+++ b/drivers/dma/mediatek/mtk-uart-apdma.c
@@ -312,7 +312,7 @@ static void mtk_uart_apdma_free_chan_resources(struct dma_chan *chan)
 
 	free_irq(c->irq, chan);
 
-	tasklet_kill(&c->vc.task);
+	dmaengine_kill_bh(&c->vc.chan);
 
 	vchan_free_chan_resources(&c->vc);
 
@@ -463,7 +463,7 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
 			struct mtk_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/owl-dma.c b/drivers/dma/owl-dma.c
index 7c80572fc71d..0d9f324adba0 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1055,7 +1055,7 @@ static inline void owl_dma_free(struct owl_dma *od)
 	list_for_each_entry_safe(vchan,
 				 next, &od->dma.channels, vc.chan.device_node) {
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dmaengine_kill_bh(&vchan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index fa2ee0b3e09f..2cca8c31929c 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1215,7 +1215,7 @@ static void pxad_free_channels(struct dma_device *dmadev)
 	list_for_each_entry_safe(c, cn, &dmadev->channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index 1bb26af0405f..c23496c3ac69 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1387,7 +1387,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	dma_async_device_unregister(&bdev->common);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dmaengine_kill_bh(&bdev->channels[i].vc.chan);
 err_tasklet_kill:
 	tasklet_kill(&bdev->task);
 err_disable_clk:
@@ -1413,7 +1413,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dmaengine_kill_bh(&bdev->channels[i].vc.chan);
 
 		if (!bdev->channels[i].fifo_virt)
 			continue;
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index 07fbe32d31fa..13f5ca8ff808 100644
--- a/drivers/dma/qcom/qcom_adm.c
+++ b/drivers/dma/qcom/qcom_adm.c
@@ -918,8 +918,8 @@ static void adm_dma_remove(struct platform_device *pdev)
 		/* mask IRQs for this channel/EE pair */
 		writel(0, adev->regs + ADM_CH_RSLT_CONF(achan->id, adev->ee));
 
-		tasklet_kill(&adev->channels[i].vc.task);
-		adm_terminate_all(&adev->channels[i].vc.chan);
+		dmaengine_kill_bh(&achan->vc.chan);
+		adm_terminate_all(&achan->vc.chan);
 	}
 
 	devm_free_irq(adev->dev, adev->irq, adev);
diff --git a/drivers/dma/sa11x0-dma.c b/drivers/dma/sa11x0-dma.c
index a6fa431530e3..e14566fa2d74 100644
--- a/drivers/dma/sa11x0-dma.c
+++ b/drivers/dma/sa11x0-dma.c
@@ -891,7 +891,7 @@ static void sa11x0_dma_free_channels(struct dma_device *dmadev)
 
 	list_for_each_entry_safe(c, cn, &dmadev->channels, vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 		kfree(c);
 	}
 }
diff --git a/drivers/dma/sf-pdma/sf-pdma.c b/drivers/dma/sf-pdma/sf-pdma.c
index 6f79cc28703e..a08ca355dadb 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -602,7 +602,7 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		tasklet_kill(&ch->vchan.task);
+		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
 	}
diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 087fea3af2e4..f90f5d8d5a1e 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1253,7 +1253,7 @@ static void sprd_dma_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index d9547017f3bd..cae0a7fe6ceb 100644
--- a/drivers/dma/st_fdma.c
+++ b/drivers/dma/st_fdma.c
@@ -733,7 +733,7 @@ static void st_fdma_free(struct st_fdma_dev *fdev)
 	for (i = 0; i < fdev->nr_channels; i++) {
 		fchan = &fdev->chans[i];
 		list_del(&fchan->vchan.chan.device_node);
-		tasklet_kill(&fchan->vchan.task);
+		dmaengine_kill_bh(&fchan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index f47a326dd7ff..4ddea3cdcd66 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1094,7 +1094,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 		struct sun6i_vchan *vchan = &sdev->vchans[i];
 
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dmaengine_kill_bh(&vchan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index 64cedef1050a..3a27a83a3288 100644
--- a/drivers/dma/tegra186-gpc-dma.c
+++ b/drivers/dma/tegra186-gpc-dma.c
@@ -1284,7 +1284,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	tegra_dma_terminate_all(dc);
 	synchronize_irq(tdc->irq);
 
-	tasklet_kill(&tdc->vc.task);
+	dmaengine_kill_bh(&tdc->vc.chan);
 	tdc->config_init = false;
 	tdc->slave_id = -1;
 	tdc->sid_dir = DMA_TRANS_NONE;
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index ceaee1e33e68..780863199224 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -811,7 +811,7 @@ static void tegra_adma_free_chan_resources(struct dma_chan *dc)
 
 	tegra_adma_terminate_all(dc);
 	vchan_free_chan_resources(&tdc->vc);
-	tasklet_kill(&tdc->vc.task);
+	dmaengine_kill_bh(&tdc->vc.chan);
 	free_irq(tdc->irq, tdc);
 	pm_runtime_put(tdc2dev(tdc));
 
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..c0ad0cdabb87 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2560,7 +2560,7 @@ static void edma_cleanupp_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(echan, _echan,
 			&dmadev->channels, vchan.chan.device_node) {
 		list_del(&echan->vchan.chan.device_node);
-		tasklet_kill(&echan->vchan.task);
+		dmaengine_kill_bh(&echan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 1cf158eb7bdb..fd428c26799a 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -4042,12 +4042,12 @@ static void udma_desc_pre_callback(struct virt_dma_chan *vc,
 }
 
 /*
- * This tasklet handles the completion of a DMA descriptor by
+ * This BH handles the completion of a DMA descriptor by
  * calling its callback and freeing it.
  */
-static void udma_vchan_complete(struct tasklet_struct *t)
+static void udma_vchan_complete(struct dma_chan *chan)
 {
-	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
+	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -4112,7 +4112,7 @@ static void udma_free_chan_resources(struct dma_chan *chan)
 	}
 
 	vchan_free_chan_resources(&uc->vc);
-	tasklet_kill(&uc->vc.task);
+	dmaengine_kill_bh(&uc->vc.chan);
 
 	bcdma_free_bchan_resources(uc);
 	udma_free_tx_resources(uc);
@@ -5627,8 +5627,8 @@ static int udma_probe(struct platform_device *pdev)
 		if (!uc->name)
 			return -ENOMEM;
 		vchan_init(&uc->vc, &ud->ddev);
-		/* Use custom vchan completion handling */
-		tasklet_setup(&uc->vc.task, udma_vchan_complete);
+		/* Override the default vchan completion handler */
+		uc->vc.chan.bh_work_fn = udma_vchan_complete;
 		init_completion(&uc->teardown_completed);
 		INIT_DELAYED_WORK(&uc->tx_drain.work, udma_check_tx_completion);
 	}
diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 55ece7fd0d99..899c5eeeac88 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1521,7 +1521,7 @@ static void omap_dma_free(struct omap_dmadev *od)
 			struct omap_chan, vc.chan.device_node);
 
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 		kfree(c);
 	}
 }
diff --git a/drivers/dma/virt-dma.c b/drivers/dma/virt-dma.c
index 7961172a780d..d407af6cc1da 100644
--- a/drivers/dma/virt-dma.c
+++ b/drivers/dma/virt-dma.c
@@ -77,12 +77,12 @@ struct virt_dma_desc *vchan_find_desc(struct virt_dma_chan *vc,
 EXPORT_SYMBOL_GPL(vchan_find_desc);
 
 /*
- * This tasklet handles the completion of a DMA descriptor by
- * calling its callback and freeing it.
+ * This bottom-half handler completes a DMA descriptor by invoking its
+ * callback and freeing it.
  */
-static void vchan_complete(struct tasklet_struct *t)
+static void vchan_complete(struct dma_chan *chan)
 {
-	struct virt_dma_chan *vc = from_tasklet(vc, t, task);
+	struct virt_dma_chan *vc = to_virt_chan(chan);
 	struct virt_dma_desc *vd, *_vd;
 	struct dmaengine_desc_callback cb;
 	LIST_HEAD(head);
@@ -98,7 +98,7 @@ static void vchan_complete(struct tasklet_struct *t)
 	}
 	spin_unlock_irq(&vc->lock);
 
-	dmaengine_desc_callback_invoke(&cb, &vd->tx_result);
+	dmaengine_desc_callback_invoke(&cb, vd ? &vd->tx_result : NULL);
 
 	list_for_each_entry_safe(vd, _vd, &head, node) {
 		dmaengine_desc_get_callback(&vd->tx, &cb);
@@ -131,7 +131,7 @@ void vchan_init(struct virt_dma_chan *vc, struct dma_device *dmadev)
 	INIT_LIST_HEAD(&vc->desc_completed);
 	INIT_LIST_HEAD(&vc->desc_terminated);
 
-	tasklet_setup(&vc->task, vchan_complete);
+	dmaengine_init_bh(&vc->chan, vchan_complete);
 
 	vc->chan.device = dmadev;
 	list_add_tail(&vc->chan.device_node, &dmadev->channels);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..0ba42fded2cc 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -21,7 +21,6 @@ struct virt_dma_desc {
 
 struct virt_dma_chan {
 	struct dma_chan	chan;
-	struct tasklet_struct task;
 	void (*desc_free)(struct virt_dma_desc *);
 
 	spinlock_t lock;
@@ -106,7 +105,7 @@ static inline void vchan_cookie_complete(struct virt_dma_desc *vd)
 		 vd, cookie);
 	list_add_tail(&vd->node, &vc->desc_completed);
 
-	tasklet_schedule(&vc->task);
+	dmaengine_schedule_bh(&vc->chan);
 }
 
 /**
@@ -137,7 +136,7 @@ static inline void vchan_cyclic_callback(struct virt_dma_desc *vd)
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
 	vc->cyclic = vd;
-	tasklet_schedule(&vc->task);
+	dmaengine_schedule_bh(&vc->chan);
 }
 
 /**
@@ -223,7 +222,7 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	LIST_HEAD(head);
 	unsigned long flags;
 
-	tasklet_kill(&vc->task);
+	dmaengine_kill_bh(&vc->chan);
 
 	spin_lock_irqsave(&vc->lock, flags);
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index b3d251c9734e..a1437bdbda9b 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -12,6 +12,7 @@
 #include <linux/scatterlist.h>
 #include <linux/bitmap.h>
 #include <linux/types.h>
+#include <linux/interrupt.h>
 #include <asm/page.h>
 
 /**
@@ -295,6 +296,10 @@ enum dma_desc_metadata_mode {
 	DESC_METADATA_ENGINE = BIT(1),
 };
 
+struct dma_chan;
+
+typedef void (*dmaengine_bh_work_fn)(struct dma_chan *chan);
+
 /**
  * struct dma_chan_percpu - the per-CPU part of struct dma_chan
  * @memcpy_count: transaction counter
@@ -334,6 +339,9 @@ struct dma_router {
  * @router: pointer to the DMA router structure
  * @route_data: channel specific data for the router
  * @private: private data for certain client-channel associations
+ * @bh_tasklet: bottom-half tasklet stored per-channel
+ * @bh_work_fn: callback executed when @bh_tasklet runs
+ * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
  */
 struct dma_chan {
 	struct dma_device *device;
@@ -359,6 +367,9 @@ struct dma_chan {
 	void *route_data;
 
 	void *private;
+	struct tasklet_struct bh_tasklet;
+	dmaengine_bh_work_fn bh_work_fn;
+	bool bh_work_initialized;
 };
 
 /**
@@ -1529,6 +1540,9 @@ struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
 
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
+void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn);
+bool dmaengine_schedule_bh(struct dma_chan *chan);
+void dmaengine_kill_bh(struct dma_chan *chan);
 #else
 static inline struct dma_chan *dma_find_channel(enum dma_transaction_type tx_type)
 {
@@ -1576,6 +1590,20 @@ static inline int dma_get_slave_caps(struct dma_chan *chan,
 {
 	return -ENXIO;
 }
+
+static inline void dmaengine_init_bh(struct dma_chan *chan,
+				     dmaengine_bh_work_fn fn)
+{
+}
+
+static inline bool dmaengine_schedule_bh(struct dma_chan *chan)
+{
+	return false;
+}
+
+static inline void dmaengine_kill_bh(struct dma_chan *chan)
+{
+}
 #endif
 
 static inline int dmaengine_desc_set_reuse(struct dma_async_tx_descriptor *tx)
-- 
2.43.0

