Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793126619;
	b=oDpuWWkYWr8qkuCzSqYns+dv41rcv+zEzv6qWpGqxAqrhVEBCDkSeo/CFTdDdZHVGy6d
	 qD6rZTkxGoi8dnrLpfIBpNAkzbl2AWzyeH1vQFpdhQw4yF++ST4UQH0SrQTORSPjnizXl
	 4ymX5L0ufcltMZcxhfUF8n7gRBjpXJ4KmKlNxAqfoZsqnztM+GIkq7CUAgD9H777iu+aG
	 22bJanclFZMUW16ofisSWQ1pm6b90q9xEmgJpnASOh1n9ZylrYujdUUKNOjj/fJfLisKz
	 vQITOUCH2SI+Hx+v761HZ3QHkbup+6aglo3SW9gVy+rQ/gWwRaS8mFYpf7aYYgHGICw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793126619;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=jt+Tf4cVFJXEV6SbGRZ9Dt43uOXfqLR9p0YeDlt8LAk=;
	b=cZpJl+wyU5jllCaojPzTEIXJANy+Y6KwjVMtYsNCV2XVgrdbaYoQTDeCY2GuoHO/Wn+4
	 XA+eddqF37Pj2ZvKx0dYCZSGHgV7qVkWtep1sgb+2V5BxQPy6f3GXRKXgi03ifKDX2WPt
	 vW7aZZmIc+Ln84YIiqi8Uh6D7Za+8OpUJG5NdqYTh5YBhh2jNATsWUCcaoRh81t/lb+dR
	 IvjJDUnjSLYshrqi6jENhWijvBRtLfb/tcADA6g9xFI9Kro0wZWR42UlDLTz5X8/5l62a
	 rbxGriuTTX1+q9RXbzMpAef2Isb5hZrn3W6mvZM4rLW6XE1kbzBEyklY+At9RyZLLGg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGbXZcOb;
	arc=none smtp.remote-ip=209.85.210.43
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8F4606A338
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 18:43:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C8F4606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GGbXZcOb
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-825b40f8a26so89651a34.1
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 11:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793126617; x=1793731417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jt+Tf4cVFJXEV6SbGRZ9Dt43uOXfqLR9p0YeDlt8LAk=;
        b=GGbXZcObCoY1wnB5G6X/6/YOQLsAr09eisDtlvelAHSFVBBdxrj6SzRtyETF4JqWhd
         swx7BJ8jUZVmIoM3jFPrzogdLSGkJGYI7/6v0HwPMI/dhPgOWUKKklS6LOzXR/UB83jR
         K+p2oDDPw9NBE7CBXZOLne5Uq0aXa3bFcEJP/mmpOUP/KhARoRMt4Z+T4J+388leuz9x
         SjUdMY8tuA0rxBsRuCh3L9MocO5ej+8SPNcNZovv8feosDixQ41zo0QtXrVjFHzaDkz5
         2/5SA0qP1kLKXHHRHdCbp45w7pfGTgqVRO1ExVRu39DEsdV/k5+rppfMGDrKAWKxUgxH
         h0QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793126617; x=1793731417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jt+Tf4cVFJXEV6SbGRZ9Dt43uOXfqLR9p0YeDlt8LAk=;
        b=UPQPT/grbFpZu22sqwyyzKRjuSmXBLGH64NeJdvbVEJdeBR5hvsHypEWkosYEQfRg3
         V+vOSWcMPPuLxah/PlRcS6w3z7DunsChZNM8o3yzvoJjUWUerQF64Dc6w7TPdlhGlFA8
         tklgEVfkImNvbwD4NRVDsZnyiLjGA61apLtK+lkAK455NIBeJE7aVSqu0aC7Afej/xVX
         IQ2LJIoesjKWHwnAnAfOtwp2PJA89/b1E45NMMd20VCFHOZ2LdvcuOMR8lHEOqJ30MbM
         niWuo0InbRSwGo4RIpJzUyB1GjBfQ8rokgZI7G+SQcx0Bb9Kutyqf5QJNdggbyggjuUo
         wEfQ==
X-Forwarded-Encrypted: i=1; AKwUvBz/Y/rHkxkjf7Fyk3rg4fxxXBVV2/pFGpYsdh5jb/f4KSxEzRkGuts9SQixsSDTCZTEbNbaZUqHtrdchw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJk5+HXqJbfnLPsTYsSsVDhQGSuwnCjZDcBbLIPuolxGXUttGVF
	m8SX/29ucINsRdP4IdJvjYbWkIRSARD5K+CrdyR2qYxlEJ3QVR6NB5K9
X-Gm-Gg: AYBFou0eYqVitIQoRZ9YP6nYKQoyJ3nVBs9iopIPo2s5y70/XbSitBqHRDZ8emCfBbI
	hRO9sjD1rcMtF5KYfTAUg0DfRbINZaz9UZQZm6coN9Q5D9cycxi9MMyTXzA/9XMSkIfp+i+FjAz
	p3H0qw5Ym9gRJOLwKMThc8o5yFbBmKXjmHPrEin20O90+1GQxGwDwmEBU8HeBF2CHSQA4b4MuL9
	ykXqpxVVe6R5Czu9lx9FFCdHU4rjXitqmHaQzRRx3EFO4/7yWM9DccIhyKtWz9aqMlqCLPVLNMs
	+oa3pPogYwQ7+w+SntaxSy/Nk6VeLzXlY0mdgAVqQNaSp1azP0iwN0N8cPgpdXanxEdW3XOylLs
	DOHLhqUC7h/VBHpYP7aWNdXXvgBMQ19RmuV0so9ElwiYwabdlmac7cLpnrIWxNRDzgK3S5SF24k
	vNOafm9gx5OESEzNT6Xoz+Tk3yEjorlR47ZfBnd4p8bS90JH1OOvG8YvVgSqDPEjG7/RoZee79I
	ZdcpqxETn8gr0asaojLF2h291EmDGRpvre4mvrn41hXSDN+UDfpLj38mkE6fPb6mdjzeqo81E4q
	XJ5PdT1rWKa4JjLMGRAJJGvS2nmTWu2XuioXuE9ut1QDz7xWh6hAHVuHkvE3hHVB5jgN0lQBXZy
	nhbeAZybHXGklCuYkfVcV35R+1HKq63VLo5PXMlMyo+MwdykK3WM+qy81dPHSxQB2bxCsZ6BUZb
	Uq+w0=
X-Received: by 2002:a05:6830:630b:b0:81e:abb6:749f with SMTP id 46e09a7af769-85abf770ce1mr394381a34.8.1793126617340;
        Tue, 27 Oct 2026 11:43:37 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-850fb074fb6sm12488338a34.12.2026.10.27.11.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 11:43:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 27 Oct 2026 12:22:26 -0600
Subject: [PATCH v3 1/2] dmaengine: virt-dma: share the DMAengine
 synchronization callback
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-1-aad7a6b3c62e@gmail.com>
References: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
In-Reply-To: <20261027-submit-mtk-uart-dma-synchronize-v1-v3-0-aad7a6b3c62e@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Basavaraj Natikar <Basavaraj.Natikar@amd.com>, 
 Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Zhou Wang <wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, 
 Andy Shevchenko <andy@kernel.org>, Keguang Zhang <keguang.zhang@gmail.com>, 
 Binbin Zhou <zhoubinbin@loongson.cn>, 
 Taichi Sugaya <sugaya.taichi@socionext.com>, 
 Takao Orito <orito.takao@socionext.com>, 
 =?utf-8?q?Am=C3=A9lie_Delaunay?= <amelie.delaunay@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Vignesh Raghavendra <vigneshr@ti.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>, Frank Li <Frank.li@oss.nxp.com>
X-Mailer: b4 0.15.2

Several virt-dma drivers implement device_synchronize with a wrapper that
only converts the DMA channel and calls vchan_synchronize(). Provide
vchan_dma_synchronize() with the DMAengine callback signature so these
drivers can assign it directly.

Document the requirement to stop the channel and prevent new callbacks
before synchronization, and the context in which the callback wait may
run. Replace the equivalent wrappers in the existing drivers with the
shared helper, preserving their callback-wait and descriptor-cleanup
behavior.

Suggested-by: Frank Li <Frank.li@oss.nxp.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/dma/amba-pl08x.c                       | 11 ++---------
 drivers/dma/amd/ptdma/ptdma-dmaengine.c        |  9 +--------
 drivers/dma/arm-dma350.c                       |  9 +--------
 drivers/dma/bcm2835-dma.c                      |  9 +--------
 drivers/dma/dma-axi-dmac.c                     |  9 +--------
 drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c |  9 +--------
 drivers/dma/fsl-edma-main.c                    |  9 +--------
 drivers/dma/fsl-qdma.c                         |  9 +--------
 drivers/dma/hisi_dma.c                         |  9 +--------
 drivers/dma/hsu/hsu.c                          |  9 +--------
 drivers/dma/idma64.c                           |  9 +--------
 drivers/dma/img-mdc-dma.c                      |  9 +--------
 drivers/dma/k3dma.c                            |  9 +--------
 drivers/dma/loongson/loongson1-apb-dma.c       |  7 +------
 drivers/dma/loongson/loongson2-apb-cmc-dma.c   |  9 +--------
 drivers/dma/loongson/loongson2-apb-dma.c       | 14 +-------------
 drivers/dma/milbeaut-hdmac.c                   |  7 +------
 drivers/dma/milbeaut-xdmac.c                   |  7 +------
 drivers/dma/stm32/stm32-dma.c                  |  9 +--------
 drivers/dma/stm32/stm32-dma3.c                 |  9 +--------
 drivers/dma/stm32/stm32-mdma.c                 |  9 +--------
 drivers/dma/tegra210-adma.c                    |  9 +--------
 drivers/dma/ti/edma.c                          | 11 ++---------
 drivers/dma/ti/omap-dma.c                      |  9 +--------
 drivers/dma/uniphier-mdmac.c                   |  7 +------
 drivers/dma/uniphier-xdmac.c                   |  7 +------
 drivers/dma/virt-dma.h                         | 15 +++++++++++++++
 27 files changed, 43 insertions(+), 205 deletions(-)

diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 5e88fd44812d..c756b01fbf41 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -2183,13 +2183,6 @@ static int pl08x_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void pl08x_synchronize(struct dma_chan *chan)
-{
-	struct pl08x_dma_chan *plchan = to_pl08x_chan(chan);
-
-	vchan_synchronize(&plchan->vc);
-}
-
 static int pl08x_pause(struct dma_chan *chan)
 {
 	struct pl08x_dma_chan *plchan = to_pl08x_chan(chan);
@@ -2758,7 +2751,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 	pl08x->memcpy.device_pause = pl08x_pause;
 	pl08x->memcpy.device_resume = pl08x_resume;
 	pl08x->memcpy.device_terminate_all = pl08x_terminate_all;
-	pl08x->memcpy.device_synchronize = pl08x_synchronize;
+	pl08x->memcpy.device_synchronize = vchan_dma_synchronize;
 	pl08x->memcpy.src_addr_widths = PL80X_DMA_BUSWIDTHS;
 	pl08x->memcpy.dst_addr_widths = PL80X_DMA_BUSWIDTHS;
 	pl08x->memcpy.directions = BIT(DMA_MEM_TO_MEM);
@@ -2786,7 +2779,7 @@ static int pl08x_probe(struct amba_device *adev, const struct amba_id *id)
 		pl08x->slave.device_pause = pl08x_pause;
 		pl08x->slave.device_resume = pl08x_resume;
 		pl08x->slave.device_terminate_all = pl08x_terminate_all;
-		pl08x->slave.device_synchronize = pl08x_synchronize;
+		pl08x->slave.device_synchronize = vchan_dma_synchronize;
 		pl08x->slave.src_addr_widths = PL80X_DMA_BUSWIDTHS;
 		pl08x->slave.dst_addr_widths = PL80X_DMA_BUSWIDTHS;
 		pl08x->slave.directions =
diff --git a/drivers/dma/amd/ptdma/ptdma-dmaengine.c b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
index 628c49ce5de9..ffeb2b9ccf9c 100644
--- a/drivers/dma/amd/ptdma/ptdma-dmaengine.c
+++ b/drivers/dma/amd/ptdma/ptdma-dmaengine.c
@@ -79,13 +79,6 @@ static void pt_free_chan_resources(struct dma_chan *dma_chan)
 	vchan_free_chan_resources(&chan->vc);
 }
 
-static void pt_synchronize(struct dma_chan *dma_chan)
-{
-	struct pt_dma_chan *chan = to_pt_chan(dma_chan);
-
-	vchan_synchronize(&chan->vc);
-}
-
 static void pt_do_cleanup(struct virt_dma_desc *vd)
 {
 	struct pt_dma_desc *desc = to_pt_desc(vd);
@@ -618,7 +611,7 @@ int pt_dmaengine_register(struct pt_device *pt)
 	dma_dev->device_pause = pt_pause;
 	dma_dev->device_resume = pt_resume;
 	dma_dev->device_terminate_all = pt_terminate_all;
-	dma_dev->device_synchronize = pt_synchronize;
+	dma_dev->device_synchronize = vchan_dma_synchronize;
 
 	if (ae4) {
 		for (i = 0; i < ae4->cmd_q_count; i++) {
diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..6a698a19def5 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -360,13 +360,6 @@ static int d350_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void d350_synchronize(struct dma_chan *chan)
-{
-	struct d350_chan *dch = to_d350_chan(chan);
-
-	vchan_synchronize(&dch->vc);
-}
-
 static u32 d350_desc_bytes(struct d350_desc *desc)
 {
 	return ((u32)desc->xsizehi << 16 | desc->xsize) << desc->tsz;
@@ -582,7 +575,7 @@ static int d350_probe(struct platform_device *pdev)
 	dmac->dma.device_pause = d350_pause;
 	dmac->dma.device_resume = d350_resume;
 	dmac->dma.device_terminate_all = d350_terminate_all;
-	dmac->dma.device_synchronize = d350_synchronize;
+	dmac->dma.device_synchronize = vchan_dma_synchronize;
 	dmac->dma.device_tx_status = d350_tx_status;
 	dmac->dma.device_issue_pending = d350_issue_pending;
 	INIT_LIST_HEAD(&dmac->dma.channels);
diff --git a/drivers/dma/bcm2835-dma.c b/drivers/dma/bcm2835-dma.c
index 06d830d36882..ba75c56d72b1 100644
--- a/drivers/dma/bcm2835-dma.c
+++ b/drivers/dma/bcm2835-dma.c
@@ -790,13 +790,6 @@ static int bcm2835_dma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void bcm2835_dma_synchronize(struct dma_chan *chan)
-{
-	struct bcm2835_chan *c = to_bcm2835_dma_chan(chan);
-
-	vchan_synchronize(&c->vc);
-}
-
 static int bcm2835_dma_chan_init(struct bcm2835_dmadev *d, int chan_id,
 				 int irq, unsigned int irq_flags)
 {
@@ -924,7 +917,7 @@ static int bcm2835_dma_probe(struct platform_device *pdev)
 	od->ddev.device_prep_dma_memcpy = bcm2835_dma_prep_dma_memcpy;
 	od->ddev.device_config = bcm2835_dma_slave_config;
 	od->ddev.device_terminate_all = bcm2835_dma_terminate_all;
-	od->ddev.device_synchronize = bcm2835_dma_synchronize;
+	od->ddev.device_synchronize = vchan_dma_synchronize;
 	od->ddev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	od->ddev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	od->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV) |
diff --git a/drivers/dma/dma-axi-dmac.c b/drivers/dma/dma-axi-dmac.c
index d47ff27e1408..8a4e6f1ee9a2 100644
--- a/drivers/dma/dma-axi-dmac.c
+++ b/drivers/dma/dma-axi-dmac.c
@@ -625,13 +625,6 @@ static int axi_dmac_terminate_all(struct dma_chan *c)
 	return 0;
 }
 
-static void axi_dmac_synchronize(struct dma_chan *c)
-{
-	struct axi_dmac_chan *chan = to_axi_dmac_chan(c);
-
-	vchan_synchronize(&chan->vchan);
-}
-
 static void axi_dmac_issue_pending(struct dma_chan *c)
 {
 	struct axi_dmac_chan *chan = to_axi_dmac_chan(c);
@@ -1260,7 +1253,7 @@ static int axi_dmac_probe(struct platform_device *pdev)
 	dma_dev->device_prep_dma_cyclic = axi_dmac_prep_dma_cyclic;
 	dma_dev->device_prep_interleaved_dma = axi_dmac_prep_interleaved;
 	dma_dev->device_terminate_all = axi_dmac_terminate_all;
-	dma_dev->device_synchronize = axi_dmac_synchronize;
+	dma_dev->device_synchronize = vchan_dma_synchronize;
 	dma_dev->dev = &pdev->dev;
 	dma_dev->src_addr_widths = BIT(dmac->chan.src_width);
 	dma_dev->dst_addr_widths = BIT(dmac->chan.dest_width);
diff --git a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
index eebed2474210..20e737519ac4 100644
--- a/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
+++ b/drivers/dma/dw-axi-dmac/dw-axi-dmac-platform.c
@@ -506,13 +506,6 @@ static void dma_chan_issue_pending(struct dma_chan *dchan)
 	spin_unlock_irqrestore(&chan->vc.lock, flags);
 }
 
-static void dw_axi_dma_synchronize(struct dma_chan *dchan)
-{
-	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
-
-	vchan_synchronize(&chan->vc);
-}
-
 static int dma_chan_alloc_chan_resources(struct dma_chan *dchan)
 {
 	struct axi_dma_chan *chan = dchan_to_axi_dma_chan(dchan);
@@ -1582,7 +1575,7 @@ static int dw_probe(struct platform_device *pdev)
 	dw->dma.device_free_chan_resources = dma_chan_free_chan_resources;
 
 	dw->dma.device_prep_dma_memcpy = dma_chan_prep_dma_memcpy;
-	dw->dma.device_synchronize = dw_axi_dma_synchronize;
+	dw->dma.device_synchronize = vchan_dma_synchronize;
 	dw->dma.device_config = dw_axi_dma_chan_slave_config;
 	dw->dma.device_prep_slave_sg = dw_axi_dma_chan_prep_slave_sg;
 	dw->dma.device_prep_dma_cyclic = dw_axi_dma_chan_prep_cyclic;
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index d9fb717b5b53..1bbcacd189e8 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -24,13 +24,6 @@
 
 #include "fsl-edma-common.h"
 
-static void fsl_edma_synchronize(struct dma_chan *chan)
-{
-	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
-
-	vchan_synchronize(&fsl_chan->vchan);
-}
-
 static irqreturn_t fsl_edma_tx_handler(int irq, void *dev_id)
 {
 	struct fsl_edma_engine *fsl_edma = dev_id;
@@ -850,7 +843,7 @@ static int fsl_edma_probe(struct platform_device *pdev)
 	fsl_edma->dma_dev.device_pause = fsl_edma_pause;
 	fsl_edma->dma_dev.device_resume = fsl_edma_resume;
 	fsl_edma->dma_dev.device_terminate_all = fsl_edma_terminate_all;
-	fsl_edma->dma_dev.device_synchronize = fsl_edma_synchronize;
+	fsl_edma->dma_dev.device_synchronize = vchan_dma_synchronize;
 	fsl_edma->dma_dev.device_issue_pending = fsl_edma_issue_pending;
 
 	fsl_edma->dma_dev.src_addr_widths = FSL_EDMA_BUSWIDTHS;
diff --git a/drivers/dma/fsl-qdma.c b/drivers/dma/fsl-qdma.c
index df843fad0ece..5a8bb2fc3d45 100644
--- a/drivers/dma/fsl-qdma.c
+++ b/drivers/dma/fsl-qdma.c
@@ -1046,13 +1046,6 @@ static void fsl_qdma_issue_pending(struct dma_chan *chan)
 	spin_unlock_irqrestore(&fsl_queue->queue_lock, flags);
 }
 
-static void fsl_qdma_synchronize(struct dma_chan *chan)
-{
-	struct fsl_qdma_chan *fsl_chan = to_fsl_qdma_chan(chan);
-
-	vchan_synchronize(&fsl_chan->vchan);
-}
-
 static int fsl_qdma_terminate_all(struct dma_chan *chan)
 {
 	LIST_HEAD(head);
@@ -1222,7 +1215,7 @@ static int fsl_qdma_probe(struct platform_device *pdev)
 	fsl_qdma->dma_dev.device_tx_status = dma_cookie_status;
 	fsl_qdma->dma_dev.device_prep_dma_memcpy = fsl_qdma_prep_memcpy;
 	fsl_qdma->dma_dev.device_issue_pending = fsl_qdma_issue_pending;
-	fsl_qdma->dma_dev.device_synchronize = fsl_qdma_synchronize;
+	fsl_qdma->dma_dev.device_synchronize = vchan_dma_synchronize;
 	fsl_qdma->dma_dev.device_terminate_all = fsl_qdma_terminate_all;
 
 	ret = dma_set_mask(&pdev->dev, DMA_BIT_MASK(40));
diff --git a/drivers/dma/hisi_dma.c b/drivers/dma/hisi_dma.c
index c751a2e49e6d..d41588c72d25 100644
--- a/drivers/dma/hisi_dma.c
+++ b/drivers/dma/hisi_dma.c
@@ -573,13 +573,6 @@ static int hisi_dma_terminate_all(struct dma_chan *c)
 	return 0;
 }
 
-static void hisi_dma_synchronize(struct dma_chan *c)
-{
-	struct hisi_dma_chan *chan = to_hisi_dma_chan(c);
-
-	vchan_synchronize(&chan->vc);
-}
-
 static int hisi_dma_alloc_qps_mem(struct hisi_dma_dev *hdma_dev)
 {
 	size_t sq_size = sizeof(struct hisi_dma_sqe) * hdma_dev->chan_depth;
@@ -830,7 +823,7 @@ static void hisi_dma_init_dma_dev(struct hisi_dma_dev *hdma_dev)
 	dma_dev->device_tx_status = hisi_dma_tx_status;
 	dma_dev->device_issue_pending = hisi_dma_issue_pending;
 	dma_dev->device_terminate_all = hisi_dma_terminate_all;
-	dma_dev->device_synchronize = hisi_dma_synchronize;
+	dma_dev->device_synchronize = vchan_dma_synchronize;
 	dma_dev->directions = BIT(DMA_MEM_TO_MEM);
 	dma_dev->dev = &hdma_dev->pdev->dev;
 	INIT_LIST_HEAD(&dma_dev->channels);
diff --git a/drivers/dma/hsu/hsu.c b/drivers/dma/hsu/hsu.c
index f62d60d7bc6b..3e399f0a37f8 100644
--- a/drivers/dma/hsu/hsu.c
+++ b/drivers/dma/hsu/hsu.c
@@ -417,13 +417,6 @@ static void hsu_dma_free_chan_resources(struct dma_chan *chan)
 	vchan_free_chan_resources(to_virt_chan(chan));
 }
 
-static void hsu_dma_synchronize(struct dma_chan *chan)
-{
-	struct hsu_dma_chan *hsuc = to_hsu_dma_chan(chan);
-
-	vchan_synchronize(&hsuc->vchan);
-}
-
 int hsu_dma_probe(struct hsu_dma_chip *chip)
 {
 	struct hsu_dma *hsu;
@@ -470,7 +463,7 @@ int hsu_dma_probe(struct hsu_dma_chip *chip)
 	hsu->dma.device_pause = hsu_dma_pause;
 	hsu->dma.device_resume = hsu_dma_resume;
 	hsu->dma.device_terminate_all = hsu_dma_terminate_all;
-	hsu->dma.device_synchronize = hsu_dma_synchronize;
+	hsu->dma.device_synchronize = vchan_dma_synchronize;
 
 	hsu->dma.src_addr_widths = HSU_DMA_BUSWIDTHS;
 	hsu->dma.dst_addr_widths = HSU_DMA_BUSWIDTHS;
diff --git a/drivers/dma/idma64.c b/drivers/dma/idma64.c
index 5fcd1befc92d..20ae195d0e8d 100644
--- a/drivers/dma/idma64.c
+++ b/drivers/dma/idma64.c
@@ -495,13 +495,6 @@ static int idma64_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void idma64_synchronize(struct dma_chan *chan)
-{
-	struct idma64_chan *idma64c = to_idma64_chan(chan);
-
-	vchan_synchronize(&idma64c->vchan);
-}
-
 static int idma64_alloc_chan_resources(struct dma_chan *chan)
 {
 	struct idma64_chan *idma64c = to_idma64_chan(chan);
@@ -589,7 +582,7 @@ static int idma64_probe(struct idma64_chip *chip)
 	idma64->dma.device_pause = idma64_pause;
 	idma64->dma.device_resume = idma64_resume;
 	idma64->dma.device_terminate_all = idma64_terminate_all;
-	idma64->dma.device_synchronize = idma64_synchronize;
+	idma64->dma.device_synchronize = vchan_dma_synchronize;
 
 	idma64->dma.src_addr_widths = IDMA64_BUSWIDTHS;
 	idma64->dma.dst_addr_widths = IDMA64_BUSWIDTHS;
diff --git a/drivers/dma/img-mdc-dma.c b/drivers/dma/img-mdc-dma.c
index b3765ba15803..d9e4f66a415e 100644
--- a/drivers/dma/img-mdc-dma.c
+++ b/drivers/dma/img-mdc-dma.c
@@ -713,13 +713,6 @@ static int mdc_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void mdc_synchronize(struct dma_chan *chan)
-{
-	struct mdc_chan *mchan = to_mdc_chan(chan);
-
-	vchan_synchronize(&mchan->vc);
-}
-
 static int mdc_slave_config(struct dma_chan *chan,
 			    struct dma_slave_config *config)
 {
@@ -952,7 +945,7 @@ static int mdc_dma_probe(struct platform_device *pdev)
 	mdma->dma_dev.device_tx_status = mdc_tx_status;
 	mdma->dma_dev.device_issue_pending = mdc_issue_pending;
 	mdma->dma_dev.device_terminate_all = mdc_terminate_all;
-	mdma->dma_dev.device_synchronize = mdc_synchronize;
+	mdma->dma_dev.device_synchronize = vchan_dma_synchronize;
 	mdma->dma_dev.device_config = mdc_slave_config;
 
 	mdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/k3dma.c b/drivers/dma/k3dma.c
index e84f197fea76..a5250fd9790a 100644
--- a/drivers/dma/k3dma.c
+++ b/drivers/dma/k3dma.c
@@ -746,13 +746,6 @@ static int k3_dma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void k3_dma_synchronize(struct dma_chan *chan)
-{
-	struct k3_dma_chan *c = to_k3_chan(chan);
-
-	vchan_synchronize(&c->vc);
-}
-
 static int k3_dma_transfer_pause(struct dma_chan *chan)
 {
 	struct k3_dma_chan *c = to_k3_chan(chan);
@@ -913,7 +906,7 @@ static int k3_dma_probe(struct platform_device *op)
 	d->slave.device_pause = k3_dma_transfer_pause;
 	d->slave.device_resume = k3_dma_transfer_resume;
 	d->slave.device_terminate_all = k3_dma_terminate_all;
-	d->slave.device_synchronize = k3_dma_synchronize;
+	d->slave.device_synchronize = vchan_dma_synchronize;
 	d->slave.copy_align = DMAENGINE_ALIGN_8_BYTES;
 
 	/* init virtual channel */
diff --git a/drivers/dma/loongson/loongson1-apb-dma.c b/drivers/dma/loongson/loongson1-apb-dma.c
index 89786cbd20ab..98e1922bb4df 100644
--- a/drivers/dma/loongson/loongson1-apb-dma.c
+++ b/drivers/dma/loongson/loongson1-apb-dma.c
@@ -415,11 +415,6 @@ static int ls1x_dma_terminate_all(struct dma_chan *dchan)
 	return 0;
 }
 
-static void ls1x_dma_synchronize(struct dma_chan *dchan)
-{
-	vchan_synchronize(to_virt_chan(dchan));
-}
-
 static enum dma_status ls1x_dma_tx_status(struct dma_chan *dchan,
 					  dma_cookie_t cookie,
 					  struct dma_tx_state *state)
@@ -595,7 +590,7 @@ static int ls1x_dma_probe(struct platform_device *pdev)
 	ddev->device_pause = ls1x_dma_pause;
 	ddev->device_resume = ls1x_dma_resume;
 	ddev->device_terminate_all = ls1x_dma_terminate_all;
-	ddev->device_synchronize = ls1x_dma_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = ls1x_dma_tx_status;
 	ddev->device_issue_pending = ls1x_dma_issue_pending;
 	dma_cap_set(DMA_SLAVE, ddev->cap_mask);
diff --git a/drivers/dma/loongson/loongson2-apb-cmc-dma.c b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
index 1c9a542edc85..20428b590237 100644
--- a/drivers/dma/loongson/loongson2-apb-cmc-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-cmc-dma.c
@@ -211,13 +211,6 @@ static int loongson2_cmc_dma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void loongson2_cmc_dma_synchronize(struct dma_chan *chan)
-{
-	struct loongson2_cmc_dma_chan *lchan = to_lmdma_chan(chan);
-
-	vchan_synchronize(&lchan->vchan);
-}
-
 static void loongson2_cmc_dma_start_transfer(struct loongson2_cmc_dma_chan *lchan)
 {
 	struct loongson2_cmc_dma_dev *lddev = lmdma_get_dev(lchan);
@@ -648,7 +641,7 @@ static int loongson2_cmc_dma_probe(struct platform_device *pdev)
 	ddev->device_prep_slave_sg = loongson2_cmc_dma_prep_slave_sg;
 	ddev->device_prep_dma_cyclic = loongson2_cmc_dma_prep_dma_cyclic;
 	ddev->device_issue_pending = loongson2_cmc_dma_issue_pending;
-	ddev->device_synchronize = loongson2_cmc_dma_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = loongson2_cmc_dma_tx_status;
 	ddev->device_terminate_all = loongson2_cmc_dma_terminate_all;
 
diff --git a/drivers/dma/loongson/loongson2-apb-dma.c b/drivers/dma/loongson/loongson2-apb-dma.c
index aceb069e71fc..eba0e6e72ca3 100644
--- a/drivers/dma/loongson/loongson2-apb-dma.c
+++ b/drivers/dma/loongson/loongson2-apb-dma.c
@@ -494,18 +494,6 @@ static int ls2x_dma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-/*
- * ls2x_dma_synchronize - Synchronizes the termination of transfers to the
- * current context.
- * @chan: channel
- */
-static void ls2x_dma_synchronize(struct dma_chan *chan)
-{
-	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
-
-	vchan_synchronize(&lchan->vchan);
-}
-
 static int ls2x_dma_pause(struct dma_chan *chan)
 {
 	struct ls2x_dma_chan *lchan = to_ldma_chan(chan);
@@ -634,7 +622,7 @@ static int ls2x_dma_probe(struct platform_device *pdev)
 	ddev->device_prep_dma_cyclic = ls2x_dma_prep_dma_cyclic;
 	ddev->device_config = ls2x_dma_slave_config;
 	ddev->device_terminate_all = ls2x_dma_terminate_all;
-	ddev->device_synchronize = ls2x_dma_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_pause = ls2x_dma_pause;
 	ddev->device_resume = ls2x_dma_resume;
 
diff --git a/drivers/dma/milbeaut-hdmac.c b/drivers/dma/milbeaut-hdmac.c
index b4ebc09e80d0..2fcb769db9d3 100644
--- a/drivers/dma/milbeaut-hdmac.c
+++ b/drivers/dma/milbeaut-hdmac.c
@@ -313,11 +313,6 @@ static int milbeaut_hdmac_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void milbeaut_hdmac_synchronize(struct dma_chan *chan)
-{
-	vchan_synchronize(to_virt_chan(chan));
-}
-
 static enum dma_status milbeaut_hdmac_tx_status(struct dma_chan *chan,
 						dma_cookie_t cookie,
 						struct dma_tx_state *txstate)
@@ -499,7 +494,7 @@ static int milbeaut_hdmac_probe(struct platform_device *pdev)
 	ddev->device_resume = milbeaut_hdmac_chan_resume;
 	ddev->device_prep_slave_sg = milbeaut_hdmac_prep_slave_sg;
 	ddev->device_terminate_all = milbeaut_hdmac_terminate_all;
-	ddev->device_synchronize = milbeaut_hdmac_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = milbeaut_hdmac_tx_status;
 	ddev->device_issue_pending = milbeaut_hdmac_issue_pending;
 	INIT_LIST_HEAD(&ddev->channels);
diff --git a/drivers/dma/milbeaut-xdmac.c b/drivers/dma/milbeaut-xdmac.c
index 0bfa247e746e..40783fec9f36 100644
--- a/drivers/dma/milbeaut-xdmac.c
+++ b/drivers/dma/milbeaut-xdmac.c
@@ -234,11 +234,6 @@ static int milbeaut_xdmac_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void milbeaut_xdmac_synchronize(struct dma_chan *chan)
-{
-	vchan_synchronize(to_virt_chan(chan));
-}
-
 static void milbeaut_xdmac_issue_pending(struct dma_chan *chan)
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
@@ -335,7 +330,7 @@ static int milbeaut_xdmac_probe(struct platform_device *pdev)
 	ddev->device_free_chan_resources = milbeaut_xdmac_free_chan_resources;
 	ddev->device_prep_dma_memcpy = milbeaut_xdmac_prep_memcpy;
 	ddev->device_terminate_all = milbeaut_xdmac_terminate_all;
-	ddev->device_synchronize = milbeaut_xdmac_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = dma_cookie_status;
 	ddev->device_issue_pending = milbeaut_xdmac_issue_pending;
 	INIT_LIST_HEAD(&ddev->channels);
diff --git a/drivers/dma/stm32/stm32-dma.c b/drivers/dma/stm32/stm32-dma.c
index d3ad78562a14..298d13076938 100644
--- a/drivers/dma/stm32/stm32-dma.c
+++ b/drivers/dma/stm32/stm32-dma.c
@@ -519,13 +519,6 @@ static int stm32_dma_terminate_all(struct dma_chan *c)
 	return 0;
 }
 
-static void stm32_dma_synchronize(struct dma_chan *c)
-{
-	struct stm32_dma_chan *chan = to_stm32_dma_chan(c);
-
-	vchan_synchronize(&chan->vchan);
-}
-
 static void stm32_dma_dump_reg(struct stm32_dma_chan *chan)
 {
 	struct stm32_dma_device *dmadev = stm32_dma_get_dev(chan);
@@ -1620,7 +1613,7 @@ static int stm32_dma_probe(struct platform_device *pdev)
 	dd->device_pause = stm32_dma_pause;
 	dd->device_resume = stm32_dma_resume;
 	dd->device_terminate_all = stm32_dma_terminate_all;
-	dd->device_synchronize = stm32_dma_synchronize;
+	dd->device_synchronize = vchan_dma_synchronize;
 	dd->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
 		BIT(DMA_SLAVE_BUSWIDTH_2_BYTES) |
 		BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
diff --git a/drivers/dma/stm32/stm32-dma3.c b/drivers/dma/stm32/stm32-dma3.c
index 4724e7fa0008..4f1cee64ce6e 100644
--- a/drivers/dma/stm32/stm32-dma3.c
+++ b/drivers/dma/stm32/stm32-dma3.c
@@ -1545,13 +1545,6 @@ static int stm32_dma3_terminate_all(struct dma_chan *c)
 	return 0;
 }
 
-static void stm32_dma3_synchronize(struct dma_chan *c)
-{
-	struct stm32_dma3_chan *chan = to_stm32_dma3_chan(c);
-
-	vchan_synchronize(&chan->vchan);
-}
-
 static enum dma_status stm32_dma3_tx_status(struct dma_chan *c, dma_cookie_t cookie,
 					    struct dma_tx_state *txstate)
 {
@@ -1798,7 +1791,7 @@ static int stm32_dma3_probe(struct platform_device *pdev)
 	dma_dev->device_pause = stm32_dma3_pause;
 	dma_dev->device_resume = stm32_dma3_resume;
 	dma_dev->device_terminate_all = stm32_dma3_terminate_all;
-	dma_dev->device_synchronize = stm32_dma3_synchronize;
+	dma_dev->device_synchronize = vchan_dma_synchronize;
 	dma_dev->device_tx_status = stm32_dma3_tx_status;
 	dma_dev->device_issue_pending = stm32_dma3_issue_pending;
 
diff --git a/drivers/dma/stm32/stm32-mdma.c b/drivers/dma/stm32/stm32-mdma.c
index e3bbdc9ee36e..dd353c0f502f 100644
--- a/drivers/dma/stm32/stm32-mdma.c
+++ b/drivers/dma/stm32/stm32-mdma.c
@@ -1287,13 +1287,6 @@ static int stm32_mdma_terminate_all(struct dma_chan *c)
 	return 0;
 }
 
-static void stm32_mdma_synchronize(struct dma_chan *c)
-{
-	struct stm32_mdma_chan *chan = to_stm32_mdma_chan(c);
-
-	vchan_synchronize(&chan->vchan);
-}
-
 static int stm32_mdma_slave_config(struct dma_chan *c,
 				   struct dma_slave_config *config)
 {
@@ -1676,7 +1669,7 @@ static int stm32_mdma_probe(struct platform_device *pdev)
 	dd->device_pause = stm32_mdma_pause;
 	dd->device_resume = stm32_mdma_resume;
 	dd->device_terminate_all = stm32_mdma_terminate_all;
-	dd->device_synchronize = stm32_mdma_synchronize;
+	dd->device_synchronize = vchan_dma_synchronize;
 	dd->descriptor_reuse = true;
 
 	dd->src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_1_BYTE) |
diff --git a/drivers/dma/tegra210-adma.c b/drivers/dma/tegra210-adma.c
index 21a381d022cf..5b09c7ca6ddf 100644
--- a/drivers/dma/tegra210-adma.c
+++ b/drivers/dma/tegra210-adma.c
@@ -441,13 +441,6 @@ static void tegra_adma_stop(struct tegra_adma_chan *tdc)
 	tdc->desc = NULL;
 }
 
-static void tegra_adma_synchronize(struct dma_chan *dc)
-{
-	struct tegra_adma_chan *tdc = to_tegra_adma_chan(dc);
-
-	vchan_synchronize(&tdc->vc);
-}
-
 static void tegra_adma_start(struct tegra_adma_chan *tdc)
 {
 	struct virt_dma_desc *vd = vchan_next_desc(&tdc->vc);
@@ -1179,7 +1172,7 @@ static int tegra_adma_probe(struct platform_device *pdev)
 	tdma->dma_dev.device_config = tegra_adma_slave_config;
 	tdma->dma_dev.device_tx_status = tegra_adma_tx_status;
 	tdma->dma_dev.device_terminate_all = tegra_adma_terminate_all;
-	tdma->dma_dev.device_synchronize = tegra_adma_synchronize;
+	tdma->dma_dev.device_synchronize = vchan_dma_synchronize;
 	tdma->dma_dev.src_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	tdma->dma_dev.dst_addr_widths = BIT(DMA_SLAVE_BUSWIDTH_4_BYTES);
 	tdma->dma_dev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/ti/edma.c b/drivers/dma/ti/edma.c
index d97db5af3555..e2873ac165ae 100644
--- a/drivers/dma/ti/edma.c
+++ b/drivers/dma/ti/edma.c
@@ -838,13 +838,6 @@ static int edma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void edma_synchronize(struct dma_chan *chan)
-{
-	struct edma_chan *echan = to_edma_chan(chan);
-
-	vchan_synchronize(&echan->vchan);
-}
-
 static int edma_slave_config(struct dma_chan *chan,
 	struct dma_slave_config *cfg)
 {
@@ -1950,7 +1943,7 @@ static void edma_dma_init(struct edma_cc *ecc, bool legacy_mode)
 	s_ddev->device_pause = edma_dma_pause;
 	s_ddev->device_resume = edma_dma_resume;
 	s_ddev->device_terminate_all = edma_terminate_all;
-	s_ddev->device_synchronize = edma_synchronize;
+	s_ddev->device_synchronize = vchan_dma_synchronize;
 
 	s_ddev->src_addr_widths = EDMA_DMA_BUSWIDTHS;
 	s_ddev->dst_addr_widths = EDMA_DMA_BUSWIDTHS;
@@ -1984,7 +1977,7 @@ static void edma_dma_init(struct edma_cc *ecc, bool legacy_mode)
 		m_ddev->device_pause = edma_dma_pause;
 		m_ddev->device_resume = edma_dma_resume;
 		m_ddev->device_terminate_all = edma_terminate_all;
-		m_ddev->device_synchronize = edma_synchronize;
+		m_ddev->device_synchronize = vchan_dma_synchronize;
 
 		m_ddev->src_addr_widths = EDMA_DMA_BUSWIDTHS;
 		m_ddev->dst_addr_widths = EDMA_DMA_BUSWIDTHS;
diff --git a/drivers/dma/ti/omap-dma.c b/drivers/dma/ti/omap-dma.c
index 55ece7fd0d99..deb41d4808b9 100644
--- a/drivers/dma/ti/omap-dma.c
+++ b/drivers/dma/ti/omap-dma.c
@@ -1415,13 +1415,6 @@ static int omap_dma_terminate_all(struct dma_chan *chan)
 	return 0;
 }
 
-static void omap_dma_synchronize(struct dma_chan *chan)
-{
-	struct omap_chan *c = to_omap_dma_chan(chan);
-
-	vchan_synchronize(&c->vc);
-}
-
 static int omap_dma_pause(struct dma_chan *chan)
 {
 	struct omap_chan *c = to_omap_dma_chan(chan);
@@ -1704,7 +1697,7 @@ static int omap_dma_probe(struct platform_device *pdev)
 	od->ddev.device_pause = omap_dma_pause;
 	od->ddev.device_resume = omap_dma_resume;
 	od->ddev.device_terminate_all = omap_dma_terminate_all;
-	od->ddev.device_synchronize = omap_dma_synchronize;
+	od->ddev.device_synchronize = vchan_dma_synchronize;
 	od->ddev.src_addr_widths = OMAP_DMA_BUSWIDTHS;
 	od->ddev.dst_addr_widths = OMAP_DMA_BUSWIDTHS;
 	od->ddev.directions = BIT(DMA_DEV_TO_MEM) | BIT(DMA_MEM_TO_DEV);
diff --git a/drivers/dma/uniphier-mdmac.c b/drivers/dma/uniphier-mdmac.c
index a8aa904b88be..c055411b3e88 100644
--- a/drivers/dma/uniphier-mdmac.c
+++ b/drivers/dma/uniphier-mdmac.c
@@ -273,11 +273,6 @@ static int uniphier_mdmac_terminate_all(struct dma_chan *chan)
 	return ret;
 }
 
-static void uniphier_mdmac_synchronize(struct dma_chan *chan)
-{
-	vchan_synchronize(to_virt_chan(chan));
-}
-
 static enum dma_status uniphier_mdmac_tx_status(struct dma_chan *chan,
 						dma_cookie_t cookie,
 						struct dma_tx_state *txstate)
@@ -421,7 +416,7 @@ static int uniphier_mdmac_probe(struct platform_device *pdev)
 	ddev->device_free_chan_resources = uniphier_mdmac_free_chan_resources;
 	ddev->device_prep_slave_sg = uniphier_mdmac_prep_slave_sg;
 	ddev->device_terminate_all = uniphier_mdmac_terminate_all;
-	ddev->device_synchronize = uniphier_mdmac_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = uniphier_mdmac_tx_status;
 	ddev->device_issue_pending = uniphier_mdmac_issue_pending;
 	INIT_LIST_HEAD(&ddev->channels);
diff --git a/drivers/dma/uniphier-xdmac.c b/drivers/dma/uniphier-xdmac.c
index 120c0d4f12dd..d62af504fe88 100644
--- a/drivers/dma/uniphier-xdmac.c
+++ b/drivers/dma/uniphier-xdmac.c
@@ -427,11 +427,6 @@ static int uniphier_xdmac_terminate_all(struct dma_chan *chan)
 	return ret;
 }
 
-static void uniphier_xdmac_synchronize(struct dma_chan *chan)
-{
-	vchan_synchronize(to_virt_chan(chan));
-}
-
 static void uniphier_xdmac_issue_pending(struct dma_chan *chan)
 {
 	struct virt_dma_chan *vc = to_virt_chan(chan);
@@ -518,7 +513,7 @@ static int uniphier_xdmac_probe(struct platform_device *pdev)
 	ddev->device_prep_slave_sg = uniphier_xdmac_prep_slave_sg;
 	ddev->device_config = uniphier_xdmac_slave_config;
 	ddev->device_terminate_all = uniphier_xdmac_terminate_all;
-	ddev->device_synchronize = uniphier_xdmac_synchronize;
+	ddev->device_synchronize = vchan_dma_synchronize;
 	ddev->device_tx_status = dma_cookie_status;
 	ddev->device_issue_pending = uniphier_xdmac_issue_pending;
 	INIT_LIST_HEAD(&ddev->channels);
diff --git a/drivers/dma/virt-dma.h b/drivers/dma/virt-dma.h
index 59d9eabc8b67..f1fc3bf48275 100644
--- a/drivers/dma/virt-dma.h
+++ b/drivers/dma/virt-dma.h
@@ -234,4 +234,19 @@ static inline void vchan_synchronize(struct virt_dma_chan *vc)
 	vchan_dma_desc_free_list(vc, &head);
 }
 
+/**
+ * vchan_dma_synchronize - DMAengine callback to synchronize a virtual channel
+ * @chan: DMA channel to synchronize
+ *
+ * Use as device_synchronize when device_terminate_all has stopped the channel
+ * and prevented new callbacks from being scheduled. This waits for callbacks
+ * and frees terminated descriptors through vchan_synchronize().
+ *
+ * Context: non-atomic context, with no locks held that callbacks need.
+ */
+static inline void vchan_dma_synchronize(struct dma_chan *chan)
+{
+	vchan_synchronize(to_virt_chan(chan));
+}
+
 #endif

-- 
2.53.0

