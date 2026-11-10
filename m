Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316543;
	b=JAadZBV9lu1DPLi9l3VokVgIZRk2/e8WHRWE0zTmXibA+x8cEkNtJy87xTZpK8k+dPsR
	 pInRrAd5tWXLy9NAR7mP4c/Ivwrw1MHRleLp9Kx9Tti3oTQimC8YqrOp4Q1S1vkJpBHba
	 ZzpS4CjpWJThER+A5Dzr9Icb6qEA6BRYWGAak4yj+qnBl163qkLSZs3xR0ft+7XhllCq7
	 4U4yzPrIZttt3HyQkFsMvHk034GoHHu31xM98r3zRk1zEXLRyRXU/ez5SVAHyeFXpr+Sx
	 SJoM3Ry7TpeLgB9FhWXeUZJiXuzSvU02ajIRZcR7WrNpjB+ZiFe768ayybiog5JyUEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316543;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=gWTTq5dv/I66UNaYS5lsfUTpJsiUMvTdfdpova6Cxz0=;
	b=xOmZ2w0dNZREteO5ZYVQ5kTUh5zOFL5whBD2xRPO18NdOqI9DafVmlXUIKfkFKlR/a7F
	 eteUpnVF5pVZI5QjOXuX8WD56X2jDun+xq7spDOW8cgyV0RTrFjqGXZA7A5t92dtptLxm
	 uwt5LUHp/m29SiAXwOeIYUWltbxt0VVRcUkYTqPZZU7uHlUm2gSZ8j3GFBZDwvtj+2aab
	 nDN+pBuzrj8bzXo0tFbheDBvE659eYHXlnBmOWEjnR1lFZQqPuWDghuw7GmbW+10Hd8N6
	 Iv7ukf0yg74M9KxfwptYplJ3IISlz0yrkz8ezP1eEIOFrfFm9T3UXgMGvGyW4VBw9+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFTx+tav;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DA606B6ED
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 13:15:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B1DA606B6ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mFTx+tav
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3b0b3438540so1219478a91.0
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 05:15:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316542; x=1794921342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gWTTq5dv/I66UNaYS5lsfUTpJsiUMvTdfdpova6Cxz0=;
        b=mFTx+tavP5+c/C9vphlYuQjwE1nBVKr1r/V5goj5JGChR211/us6Lmy6IMjujMCAJn
         V/toLraRcAXfp2OvxlnEAK3aO4xkZ8xLSMN7eeQew+6CS0MUt+ODqafkKr7s5D4qU0pX
         gxVhqAVA01rQNacg5mniI+aZNG9akSNH++hi4WgzSdm9oMS6vYKWCo9njkOnm4V2fpDh
         e6yQ0DmPsPvnb7C6Fc2gxeCXjnmaSBl6IP6XhUCpqvsB+F2gZMFjlmnPNAkw/vbBYax5
         j1v47OLnJvr/MO/HTrpJbfIaNeNnWy0bF0Q/EvyEiWTVnaoxy7IWDV0A0lUWV0F4DDzq
         OvcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316542; x=1794921342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gWTTq5dv/I66UNaYS5lsfUTpJsiUMvTdfdpova6Cxz0=;
        b=Ne4RwTKWEvJzrxKMdA4iTg3pvZymQxOYQJ9vnXpzR70rgprgGnExXWgiQmozhjVwcu
         xyUyI8Z6wGp0HLyrsDIM+qKL5WLf3d3wO6XdOJROaX+Yf6po/2SYBUa5vtBwsPAt6Kyy
         bl7b/yAW5XuVMjUs3cXpHHXS3na2wh5ooK7qbIPNM9zHYhgWnL8n7FDDyDm1/2TyuhtF
         guYE/8Zx+JF/qigovaL1D15Zj7GmTOcdfCjVonHvvLNiqIlrAE5gpiw3v2eM53yBI0da
         0E2jiP30a18iDlGETr9DCflXHHWm0fIhnbtayeItmxXYaDzE6q0KCpymZU6aHrTdE0uO
         ZAVA==
X-Forwarded-Encrypted: i=1; AL+hErFl0+gfonE2Z6f9IFbU6ag9p2hJO40xsH+PjBBMkwn2tlnt7DhdbA4cm6bdTz5Wq2KQ0ge5iVzuR4EOzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z84viV0n3Tmo4KHbTijcXcbI1sY3HNbK5gqJImy58I/Udpi0Fy3
	8FNk4QyKacsqdHZujfGkRsrAF+r9JMf1dKaHs6iNsKDfAfxIo4n9+Xxf
X-Gm-Gg: AYBFou0wgObJ6Vw+DF51EIbd9F6wdyxyNfkTqQnop7bLPygM0fxhHMUs9i/yQdgi0rR
	tYglUVWtAVKrWyKP1fGHANEyk6Iq1l3Sfxdlsw/Jm5HB0d51GjOekQsAqBNwB4zXBenX4FHBxRP
	1kJc2z+NTcqdYHmMr6YKXxyb8H5dho2EiHoyjnrsJ/w12CVqx/IkGBtRJpsikRarcUutO4mqfkE
	LN18DoFpRt8DJo5lvNv4sudEoEsylG1cIWIOuE+P9NqDyGfKSVgBrr500MleAjg94SpWSzDvRLg
	Ntp/69u1Gx+V2d4OmW6ofyGcgZIRww2452uzjDAPCHkQ/ir5L2sOIx0EREYMm53/HFNfNVWyeL7
	DJlGICLeHLhOubI04m9mcLPTRJsHXzJWOmWJjRtj6U07SJ+RKGsT2QxLruvRaC32AydW2V5jUlg
	TTzBlKAXnSvzfBMa647nsNVOivpseOD1hMXZrE7T0iDP5NcIwlbK19ufbmZIdlcBeqspDRkSHAC
	5nXqp5Ooeo/jKMvHD8uhmCy5u4H0A9Fuo3eTA9rw2Igbf7nQK3jS2S6t5NX/hyz/AtSGVTHQlSx
	KLdwTNqNErOKd7uzRzVW00lXfPJ9qu0=
X-Received: by 2002:a17:90b:1d47:b0:3ac:9d14:feb2 with SMTP id 98e67ed59e1d1-3b166cf8ccfmr2707857a91.35.1794316541655;
        Tue, 10 Nov 2026 05:15:41 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:15:40 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@kernel.org>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
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
	Kees Cook <kees@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 01/33] dmaengine: add tasklet-backed channel BH helpers
Date: Tue, 10 Nov 2026 05:13:01 -0800
Message-ID: <c515f9757c8d89501ecbb0f2f4530fd3b800c976.1794315350.git.allen.lkml@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1794315350.git.allen.lkml@gmail.com>
References: <cover.1794315350.git.allen.lkml@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
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
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/dma/amlogic-dma.c                     |  4 +-
 drivers/dma/at_hdmac.c                        |  2 +-
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
 37 files changed, 128 insertions(+), 57 deletions(-)

diff --git a/drivers/dma/amlogic-dma.c b/drivers/dma/amlogic-dma.c
index 684121d13fca..4a14b2f777c6 100644
--- a/drivers/dma/amlogic-dma.c
+++ b/drivers/dma/amlogic-dma.c
@@ -707,10 +707,10 @@ static void aml_dma_remove(struct platform_device *pdev)
 	for (i = 0; i < MAX_CHAN_ID; i++) {
 		aml_chan = aml_dma->aml_rch[i];
 		if (aml_chan)
-			tasklet_kill(&aml_chan->vchan.task);
+			dmaengine_kill_bh(&aml_chan->vchan.chan);
 		aml_chan = aml_dma->aml_wch[i];
 		if (aml_chan)
-			tasklet_kill(&aml_chan->vchan.task);
+			dmaengine_kill_bh(&aml_chan->vchan.chan);
 	}
 	destroy_workqueue(aml_dma->free_wq);
 }
diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index b024aa2d34b2..991c572d5c19 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1944,7 +1944,7 @@ static void at_dma_cleanup_channels(struct at_dma *atdma)
 			device_node) {
 		/* Disable interrupts */
 		atc_disable_chan_irq(atdma, i++);
-		tasklet_kill(&to_at_dma_chan(chan)->vc.task);
+		dmaengine_kill_bh(chan);
 		list_del(&chan->device_node);
 	}
 }
diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index d41b0f6ec427..62844b44696b 100644
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
index dbc31b185c4d..91ec19dd4df8 100644
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
index e610aba09418..27eaf2fa077c 100644
--- a/drivers/dma/dma-jz4780.c
+++ b/drivers/dma/dma-jz4780.c
@@ -1018,7 +1018,7 @@ static void jz4780_dma_remove(struct platform_device *pdev)
 	free_irq(jzdma->irq, jzdma);
 
 	for (i = 0; i < jzdma->soc_data->nb_channels; i++)
-		tasklet_kill(&jzdma->chan[i].vchan.task);
+		dmaengine_kill_bh(&jzdma->chan[i].vchan.chan);
 }
 
 static const struct jz4780_dma_soc_data jz4740_dma_soc_data = {
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index 34be53487a21..f3c19fbb2a01 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -1449,6 +1449,48 @@ static void dmaengine_destroy_unmap_pool(void)
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
index 940b196b69d1..425c25028a49 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -1657,7 +1657,7 @@ static void dw_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
 		list_del(&chan->vc.chan.device_node);
-		tasklet_kill(&chan->vc.task);
+		dmaengine_kill_bh(&chan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/dw-edma/dw-edma-core.c b/drivers/dma/dw-edma/dw-edma-core.c
index d682074eaa0e..2cceb87dffb8 100644
--- a/drivers/dma/dw-edma/dw-edma-core.c
+++ b/drivers/dma/dw-edma/dw-edma-core.c
@@ -1505,7 +1505,7 @@ int dw_edma_remove(struct dw_edma_chip *chip)
 	dma_async_device_unregister(&dw->dma);
 	list_for_each_entry_safe(chan, _chan, &dw->dma.channels,
 				 vc.chan.device_node) {
-		tasklet_kill(&chan->vc.task);
+		dmaengine_kill_bh(&chan->vc.chan);
 		list_del(&chan->vc.chan.device_node);
 	}
 
diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index 513b0f4e5be2..85cc8791659d 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -1158,7 +1158,7 @@ void fsl_edma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				&dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dmaengine_kill_bh(&chan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index 27c632e6fa78..b901fe1046ef 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -1254,7 +1254,7 @@ static void fsl_qdma_cleanup_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(chan, _chan,
 				 &dmadev->channels, vchan.chan.device_node) {
 		list_del(&chan->vchan.chan.device_node);
-		tasklet_kill(&chan->vchan.task);
+		dmaengine_kill_bh(&chan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
index d3ec1819aa5d..16279c332e9d 100644
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
index ce24e840af59..ec530e0e1296 100644
--- a/drivers/dma/hsu/hsu.c
+++ b/drivers/dma/hsu/hsu.c
@@ -499,7 +499,7 @@ int hsu_dma_remove(struct hsu_dma_chip *chip)
 	for (i = 0; i < hsu->nr_channels; i++) {
 		struct hsu_dma_chan *hsuc = &hsu->chan[i];
 
-		tasklet_kill(&hsuc->vchan.task);
+		dmaengine_kill_bh(&hsuc->vchan.chan);
 	}
 
 	return 0;
diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index e3db213e564b..d7089c4b3787 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -610,14 +610,14 @@ static void idma64_remove(struct idma64_chip *chip)
 
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
index b91807d5ae82..22288f3bae55 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -1031,7 +1031,7 @@ static void mdc_dma_remove(struct platform_device *pdev)
 
 		devm_free_irq(&pdev->dev, mchan->irq, mchan);
 
-		tasklet_kill(&mchan->vc.task);
+		dmaengine_kill_bh(&mchan->vc.chan);
 	}
 
 	pm_runtime_disable(&pdev->dev);
diff --git a/drivers/dma/imx-sdma.c b/drivers/dma/imx-sdma.c
index 749f1fe77907..9bf70a682e22 100644
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
index 079dda13cf0c..571237b15182 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -975,7 +975,7 @@ static void k3_dma_remove(struct platform_device *op)
 
 	list_for_each_entry_safe(c, cn, &d->slave.channels, vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 	tasklet_kill(&d->task);
 	clk_disable_unprepare(d->clk);
diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 10a1920ff6c2..c91e933b186a 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -547,7 +547,7 @@ static void ls1x_dma_chan_remove(struct ls1x_dma *dma)
 
 		if (chan->vc.chan.device == &dma->ddev) {
 			list_del(&chan->vc.chan.device_node);
-			tasklet_kill(&chan->vc.task);
+			dmaengine_kill_bh(&chan->vc.chan);
 		}
 	}
 }
diff --git a/drivers/dma/mediatek/mtk-cqdma.c b/drivers/dma/mediatek/mtk-cqdma.c
index a7000608ddea..8c536c4e04ec 100644
--- a/drivers/dma/mediatek/mtk-cqdma.c
+++ b/drivers/dma/mediatek/mtk-cqdma.c
@@ -894,7 +894,7 @@ static void mtk_cqdma_remove(struct platform_device *pdev)
 		vc = &cqdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dmaengine_kill_bh(&vc->vc.chan);
 	}
 
 	/* disable interrupt */
diff --git a/drivers/dma/mediatek/mtk-hsdma.c b/drivers/dma/mediatek/mtk-hsdma.c
index ad5883cf6165..2a2b4c38a3f5 100644
--- a/drivers/dma/mediatek/mtk-hsdma.c
+++ b/drivers/dma/mediatek/mtk-hsdma.c
@@ -1032,7 +1032,7 @@ static void mtk_hsdma_remove(struct platform_device *pdev)
 		vc = &hsdma->vc[i];
 
 		list_del(&vc->vc.chan.device_node);
-		tasklet_kill(&vc->vc.task);
+		dmaengine_kill_bh(&vc->vc.chan);
 	}
 
 	/* Disable DMA interrupt */
diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
index bf242c4c262f..127e1d6a30a1 100644
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
index 31a6c6e01a75..43663f4539f0 100644
--- a/drivers/dma/owl-dma.c
+++ b/drivers/dma/owl-dma.c
@@ -1050,7 +1050,7 @@ static inline void owl_dma_free(struct owl_dma *od)
 	list_for_each_entry_safe(vchan,
 				 next, &od->dma.channels, vc.chan.device_node) {
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dmaengine_kill_bh(&vchan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/pxa_dma.c b/drivers/dma/pxa_dma.c
index bf03009bb966..29bcda3f785b 100644
--- a/drivers/dma/pxa_dma.c
+++ b/drivers/dma/pxa_dma.c
@@ -1216,7 +1216,7 @@ static void pxad_free_channels(struct dma_device *dmadev)
 	list_for_each_entry_safe(c, cn, &dmadev->channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/qcom/bam_dma.c b/drivers/dma/qcom/bam_dma.c
index e62e411dc8f8..823b92099bcc 100644
--- a/drivers/dma/qcom/bam_dma.c
+++ b/drivers/dma/qcom/bam_dma.c
@@ -1389,7 +1389,7 @@ static int bam_dma_probe(struct platform_device *pdev)
 	free_irq(bdev->irq, bdev);
 err_bam_channel_exit:
 	for (i = 0; i < bdev->num_channels; i++)
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dmaengine_kill_bh(&bdev->channels[i].vc.chan);
 err_tasklet_kill:
 	tasklet_kill(&bdev->task);
 err_disable_clk:
@@ -1416,7 +1416,7 @@ static void bam_dma_remove(struct platform_device *pdev)
 
 	for (i = 0; i < bdev->num_channels; i++) {
 		bam_dma_terminate_all(&bdev->channels[i].vc.chan);
-		tasklet_kill(&bdev->channels[i].vc.task);
+		dmaengine_kill_bh(&bdev->channels[i].vc.chan);
 
 		if (!bdev->channels[i].fifo_virt)
 			continue;
diff --git a/drivers/dma/qcom/qcom_adm.c b/drivers/dma/qcom/qcom_adm.c
index b38ee75a9637..f306b3c841de 100644
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
index 4770ec3470cb..ca60fb46ade0 100644
--- a/drivers/dma/sf-pdma/sf-pdma.c
+++ b/drivers/dma/sf-pdma/sf-pdma.c
@@ -601,7 +601,7 @@ static void sf_pdma_remove(struct platform_device *pdev)
 		devm_free_irq(&pdev->dev, ch->txirq, ch);
 		devm_free_irq(&pdev->dev, ch->errirq, ch);
 		list_del(&ch->vchan.chan.device_node);
-		tasklet_kill(&ch->vchan.task);
+		dmaengine_kill_bh(&ch->vchan.chan);
 		tasklet_kill(&ch->done_tasklet);
 		tasklet_kill(&ch->err_tasklet);
 	}
diff --git a/drivers/dma/sprd-dma.c b/drivers/dma/sprd-dma.c
index 55ccbb902926..704b05885cd9 100644
--- a/drivers/dma/sprd-dma.c
+++ b/drivers/dma/sprd-dma.c
@@ -1231,7 +1231,7 @@ static void sprd_dma_remove(struct platform_device *pdev)
 	list_for_each_entry_safe(c, cn, &sdev->dma_dev.channels,
 				 vc.chan.device_node) {
 		list_del(&c->vc.chan.device_node);
-		tasklet_kill(&c->vc.task);
+		dmaengine_kill_bh(&c->vc.chan);
 	}
 
 	of_dma_controller_free(pdev->dev.of_node);
diff --git a/drivers/dma/st_fdma.c b/drivers/dma/st_fdma.c
index a82058e27aa4..875d506d4686 100644
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
index 3b849833e08f..f4543e8af789 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -1136,7 +1136,7 @@ static inline void sun6i_dma_free(struct sun6i_dma_dev *sdev)
 		struct sun6i_vchan *vchan = &sdev->vchans[i];
 
 		list_del(&vchan->vc.chan.device_node);
-		tasklet_kill(&vchan->vc.task);
+		dmaengine_kill_bh(&vchan->vc.chan);
 	}
 }
 
diff --git a/drivers/dma/tegra186-gpc-dma.c b/drivers/dma/tegra186-gpc-dma.c
index ec12b7288b43..30fe6cfcc82a 100644
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
index 607f8e0848ac..0c73dc61622a 100644
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
index f3a98654d126..01f9739f120c 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -2557,7 +2557,7 @@ static void edma_cleanupp_vchan(struct dma_device *dmadev)
 	list_for_each_entry_safe(echan, _echan,
 			&dmadev->channels, vchan.chan.device_node) {
 		list_del(&echan->vchan.chan.device_node);
-		tasklet_kill(&echan->vchan.task);
+		dmaengine_kill_bh(&echan->vchan.chan);
 	}
 }
 
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index 75bd1977fb42..b58c9bb22ddf 100644
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
@@ -5610,8 +5610,8 @@ static int udma_probe(struct platform_device *pdev)
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
index 93b6a4682085..aad968331162 100644
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
index abf2ae737c30..8e7c0ca8623a 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -21,7 +21,6 @@ struct virt_dma_desc {
 
 struct virt_dma_chan {
 	struct dma_chan	chan;
-	struct tasklet_struct task;
 	void (*desc_free)(struct virt_dma_desc *);
 
 	spinlock_t lock;
@@ -111,7 +110,7 @@ static inline void vchan_cookie_complete(struct virt_dma_desc *vd)
 		 vd, cookie);
 	list_add_tail(&vd->node, &vc->desc_completed);
 
-	tasklet_schedule(&vc->task);
+	dmaengine_schedule_bh(&vc->chan);
 }
 
 /**
@@ -142,7 +141,7 @@ static inline void vchan_cyclic_callback(struct virt_dma_desc *vd)
 	struct virt_dma_chan *vc = to_virt_chan(vd->tx.chan);
 
 	vc->cyclic = vd;
-	tasklet_schedule(&vc->task);
+	dmaengine_schedule_bh(&vc->chan);
 }
 
 /**
@@ -239,7 +238,7 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	LIST_HEAD(head);
 	unsigned long flags;
 
-	tasklet_kill(&vc->task);
+	dmaengine_kill_bh(&vc->chan);
 
 	spin_lock_irqsave(&vc->lock, flags);
 
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 805668fbe437..b0d69e3083d6 100644
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
@@ -337,6 +342,9 @@ struct dma_router {
  * @router: pointer to the DMA router structure
  * @route_data: channel specific data for the router
  * @private: private data for certain client-channel associations
+ * @bh_tasklet: bottom-half tasklet stored per-channel
+ * @bh_work_fn: callback executed when @bh_tasklet runs
+ * @bh_work_initialized: indicates whether @bh_tasklet has been initialized
  */
 struct dma_chan {
 	struct dma_device *device;
@@ -375,6 +383,9 @@ struct dma_chan {
 	void *route_data;
 
 	void *private;
+	struct tasklet_struct bh_tasklet;
+	dmaengine_bh_work_fn bh_work_fn;
+	bool bh_work_initialized;
 };
 
 #define DMA_CHAN_ID_STATIC	BIT(30)
@@ -1970,6 +1981,9 @@ struct dma_chan *devm_dma_request_chan(struct device *dev, const char *name);
 
 void dma_release_channel(struct dma_chan *chan);
 int dma_get_slave_caps(struct dma_chan *chan, struct dma_slave_caps *caps);
+void dmaengine_init_bh(struct dma_chan *chan, dmaengine_bh_work_fn fn);
+bool dmaengine_schedule_bh(struct dma_chan *chan);
+void dmaengine_kill_bh(struct dma_chan *chan);
 #else
 static inline struct dma_chan *dma_find_channel(enum dma_transaction_type tx_type)
 {
@@ -2017,6 +2031,20 @@ static inline int dma_get_slave_caps(struct dma_chan *chan,
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

