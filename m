Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794316628;
	b=hMs0SriuFob4uzc4Va7Znr0GOkX2JNzLIDbFLrPLwEXsPEqUM5aWIkGKR949k7B4zJcM
	 zX433mDqE8JrRISw5V2WtZDXHl/p9GluWFTiZo4nUmyMeup/GjMx+Eipjpy8GKlNPa0Wp
	 5rOdLc3jwEjjqg3bE+I3dE+GSoUSZHTJLjozWr4zewj/CKgDzTRsDim+OAqoN8TFb5zQz
	 UHKoAgHFzHjzmRnXbxI2/BAmzQxu3LH1b4Dilh+QZkW+X4sAYarVuyMlfTk0fqN4bYnhu
	 nundaJRO1ncw3242WUwkSBLx1kUcgSeb7oapaMJVcWMUDjar7VDTzvkxaZS+eMjxKsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316628;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
	b=WMzp2gguAHU9xUPiSLu/DPKYl+yESw2FJ4l0GNrKKMInI6C6ukbHPdu3t0zIZ+xdUm8Z
	 43isSwvrqWQC8D0edld/hNSIhYl5d1KDHn6B8phU4cms8pJ3+yZQhEs76+TfShm0PCOtC
	 NjwR3XrILZKt0MX23gGHlY3V7ojZCmNnUxqaPyPIduqmuSRPO6v1XkSLf3BmS3H3wpbFP
	 mb7SAyonVuSCakw2aJQ8v9GR7oi8vn+2AdkAtUZafEEB71ikfCshHeyX7+j8qRRD9GnPa
	 PcH8NJniRiXgBD0aix5uBFHtLkCMyuFQ8tY/IAKQxILSINl3IyAHimowKEzQY20qb0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJzPMyHL;
	arc=none smtp.remote-ip=209.85.215.174
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 223B8607078E
	for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 13:17:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 223B8607078E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJzPMyHL
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cdb684859cbso1144934a12.1
        for <linux-tegra@vger.kernel.org>; Tue, 10 Nov 2026 05:17:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794316627; x=1794921427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
        b=iJzPMyHLL8Vau2nqkZYnF6VgvsaI+kZjntDLJrch4Thy32nLJ4Q0yBzu6DO8M3nksm
         j+P4zjMSF+awp8SypcQjduaQtVsMmSic6tznF5VhJpJ6jg6XF9+B4VMxNtAxJO40ytL7
         dWOGXg5BSSHU74ldFVreAa9MyX6LuwviTyupbVF74809p8icjKEKqZ30Jy+dGxC0QW79
         QIoCGL8YQB5ENB8xqZSN9dYzMKZwVKjRLVxyRRTxTstCvfeXk/u7QlmNyXnwrdX7tdHa
         LK30mgXbdXMtZMtL/6bXe0nwwdExgpa3c8K2nxm4CrUC8wgeUSBy0yp0F9QLV+PC4yDC
         Yn1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794316627; x=1794921427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k7zLnAyoVidxBagrObrQW+VXa8Bn65haoh8mvK0I/ys=;
        b=ziIElr8kewMfeycUtKdfTiyfdGPNcpxbMGbzwWXQYA3YkfUXNbSS1JJrKLE85xsG+y
         Y+7i55hY/jQabRfgX9SZWLZrVjMmw4Se8fkLsvaQ/MXU/N8SNE0oZzLytGEwv9pBdsR5
         g1ESDdBv0cvrrqD3xMb4x8kvkk+Qh2IDEO3HMvCgbTGKkACFscUCeQosy5UzbEOc9Di9
         AU9C0qtlIBuOcGtaWL+MZlbf+FENsqJFwyQL3J4zTG8QzitxVQMDBwpEHYwx/sraeBmK
         Q8AR6RmCtd9Yzfxy6I1RJ3fPPs1C/1NROvXhxYsO+r+/776l7bYInDteitg3eihAptWz
         xHKw==
X-Forwarded-Encrypted: i=1; AL+hErGVKTv8ctaBF8nw6I24CurviFD3qDMjMYvHu17lRhQ4TPPrX/MBWzvHC6EExzIS0TtMIdgZgt/irTWWJQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/qKUP5csGw3OIrhWYt2yxc55+LODccZ0G/R0tATgGaJF59/o5l
	xWj/0B/BG9sNt0MncXuSe0VKNqCYlCP63QitgWasOXDPq3MQqY8/ndIA
X-Gm-Gg: AYBFou2KvQ/wzjIMt2W/WrX/yWT8XzyBi3ajVZFfP83+YJIRc1GdxPQFpWODcQ8dI9Q
	t5mzHtjyU0SpPnBNdhetzBcf19n7RpfxP2C0jJInDzGpnRRiz2sKijy2QnDOqDdC4fe6n09gADu
	KSEclHfMwxTQt3VxvkH9ZtIc+EucgBsQekmxH2pS3eBSBXCEKzpUNrh5onjJRSptQjcBQ+jjVFS
	ROLKO+Y+MgJxI/A8SSljtt3OkQHQUO40/E5WMfv3sSekfu4vr2jJDZtK3lPlQWRZKoiMGbhZ3nX
	v/vV38K7/iyrvFgCvhG6/ThjjZE0iZPEPZ6nA8nSrc2xY51TxH3XEzbYghfC99H4pe9w8PYmOFD
	KYH6jfkx+kvIhIwxdmeBzI9+IBhuNpjN4XrG7EBEeEB8EFlA2MUou9flzX+4D9f7YgekAFSDoAD
	3VgqmG9fyfPiD1o8ihozYhj1dSZiMOmdPydrZIwYyudonjDT0l/8VqIj9Tvf2nmTUhp8YHCH6t1
	VZukty8ILaM3pxmKAOm18AsjoNL4JG9PTdyxQx1Avit5SnPq4VQ6Mv2he6tdUXeOHnXa6nEYmco
	5aqh89swvp1pb/FdQlLGCPraQZn+Zz0=
X-Received: by 2002:a17:90b:3808:b0:3ac:b2e6:317d with SMTP id 98e67ed59e1d1-3b166fa2a9dmr2789894a91.35.1794316627523;
        Tue, 10 Nov 2026 05:17:07 -0800 (PST)
Received: from cryptic.lan ([2001:569:7077:be00:8191:2bfc:aa6d:704b])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16769b589sm3806975a91.5.2026.11.10.05.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 05:17:07 -0800 (PST)
From: Allen Pais <allen.lkml@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Allen Pais <allen.lkml@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Frank Li <Frank.Li@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-tegra@vger.kernel.org
Subject: [PATCH v4 22/33] dmaengine: tegra20-apb: use channel BH helpers
Date: Tue, 10 Nov 2026 05:13:22 -0800
Message-ID: <23ec6d1f25c7715939ee1d00984645028f33ddca.1794315350.git.allen.lkml@gmail.com>
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

Switch the per-channel tasklet to dmaengine_*_bh so completion handling
runs through the shared per-channel deferral mechanism.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/dma/tegra20-apb-dma.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/dma/tegra20-apb-dma.c b/drivers/dma/tegra20-apb-dma.c
index 7ff8c0241f61..2eca4a2567cb 100644
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
+		dmaengine_schedule_bh(&tdc->dma_chan);
 		wake_up_all(&tdc->wq);
 		spin_unlock(&tdc->lock);
 		return IRQ_HANDLED;
@@ -819,7 +819,7 @@ static void tegra_dma_synchronize(struct dma_chan *dc)
 	 */
 	wait_event(tdc->wq, tegra_dma_eoc_interrupt_deasserted(tdc));
 
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	pm_runtime_put(tdc->tdma->dev);
 }
@@ -1317,7 +1317,7 @@ static void tegra_dma_free_chan_resources(struct dma_chan *dc)
 	dev_dbg(tdc2dev(tdc), "Freeing channel %d\n", tdc->id);
 
 	tegra_dma_terminate_all(dc);
-	tasklet_kill(&tdc->tasklet);
+	dmaengine_kill_bh(&tdc->dma_chan);
 
 	list_splice_init(&tdc->pending_sg_req, &sg_req_list);
 	list_splice_init(&tdc->free_sg_req, &sg_req_list);
@@ -1511,7 +1511,7 @@ static int tegra_dma_probe(struct platform_device *pdev)
 		tdc->id = i;
 		tdc->slave_id = TEGRA_APBDMA_SLAVE_ID_INVALID;
 
-		tasklet_setup(&tdc->tasklet, tegra_dma_tasklet);
+		dmaengine_init_bh(&tdc->dma_chan, tegra_dma_tasklet);
 		spin_lock_init(&tdc->lock);
 		init_waitqueue_head(&tdc->wq);
 
@@ -1617,7 +1617,7 @@ static int __maybe_unused tegra_dma_dev_suspend(struct device *dev)
 	for (i = 0; i < tdma->chip_data->nr_channels; i++) {
 		struct tegra_dma_channel *tdc = &tdma->channels[i];
 
-		tasklet_kill(&tdc->tasklet);
+		dmaengine_kill_bh(&tdc->dma_chan);
 
 		spin_lock_irqsave(&tdc->lock, flags);
 		busy = tdc->busy;
-- 
2.43.0

