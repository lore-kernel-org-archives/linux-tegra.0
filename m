Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF43C54EE9
	for <linux-tegra@archiver.kernel.org>; Thu, 22 Sep 2022 13:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230097AbiIVNll (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 22 Sep 2022 09:41:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbiIVNlh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 22 Sep 2022 09:41:37 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C6E1D62FB
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:34 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id y3so21187019ejc.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Sep 2022 06:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=ww2kE8zimrKo6Sf4PGCIG6kJTxer9bHf3oTe6mgDvbw=;
        b=jyWCCPrkCeoadIlTsDwpoZzPFtsVNFd1I0MzW3Q6EUnXPPNSGrCnVdzq+ExlFSM5cn
         ZQrtX5RkV/9EeZbbx8xMV135QuRtleZH0NtJW5WSLMAUYJQsZLpU3wCqx6KXWX+RC+ie
         AceNnF4448zml0OYHxtgKGX8arCT7mbCGtqbzmekmyEjI6YEVCRF92QxsBIHDn7V7pcy
         FaYp8gsvDku8FLH2VJ2yiGk9YEgWKu8exikG+VCBhl0ohDAI6o3uL9yb941KFcAvbDO+
         IDa/yRj2pQ33aTXZ7KgI+chbxiDLTzGHufu3ydfkcj9P4yp6UKj2qvNmMQwUAUW7wGwO
         6psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=ww2kE8zimrKo6Sf4PGCIG6kJTxer9bHf3oTe6mgDvbw=;
        b=cx/jME6FHLUMKYfnb5SgD57Jcq40DQw4PiGWG58N0/gjWwMeZ8TdNvugygh5cZ2F8U
         pECP2B2pSe8xx4U4W0LdOjmJNv9SUej+HfQugX//7ja1IELAE5etJKCTG2xjggDG5tFX
         ldoqhy1PRPk6JMRZReveYVbOvVSNPs0EJiSkrmnZO7ardBaJJf+7hBhqY86gjR1Uqmoa
         nJGCKmNpZi/E2zrao2AxybpbRKKaDhITkqI2c81P+xuuW4ij7A0yexmY59XAlr5lxCtt
         GekeMgBCQZ29rGiW77MAp4UUytbJFWiVjRE7Y6wHhOn3vqJAAP1Hmg/VQx9bfYbo7X7K
         gvqA==
X-Gm-Message-State: ACrzQf0Bl1IsDt3KvMuRXRmsc8u9KREPK0LeXOqMfbM+5JOsqU4aamIA
        xU9dWQZZ+v4KToEtVhayW10=
X-Google-Smtp-Source: AMsMyM7FfNqBjeIjSPH+OfgBEC8+3PM6P3Tc2y53mAvOvkTX9E7q2AoARp5FPF3GdJB2vXJZzN2G6A==
X-Received: by 2002:a17:907:6ea4:b0:782:6b82:a2cb with SMTP id sh36-20020a1709076ea400b007826b82a2cbmr1425301ejc.408.1663854092344;
        Thu, 22 Sep 2022 06:41:32 -0700 (PDT)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id m14-20020a50d7ce000000b00450206d9dfbsm3672945edj.84.2022.09.22.06.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 06:41:31 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Timo Alho <talho@nvidia.com>,
        Manish Bhardwaj <mbhardwaj@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/3] firmware: tegra: bpmp: Use iosys-map helpers
Date:   Thu, 22 Sep 2022 15:41:24 +0200
Message-Id: <20220922134125.844730-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922134125.844730-1-thierry.reding@gmail.com>
References: <20220922134125.844730-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The shared memory used for inter-processor communication between the CPU
and the BPMP can reside either in system memory or in I/O memory. Use
the iosys-map helpers to abstract these differences away.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/firmware/tegra/bpmp-tegra186.c     |  36 +++--
 drivers/firmware/tegra/bpmp-tegra210.c     |   7 +-
 drivers/firmware/tegra/bpmp.c              |  31 +++--
 drivers/firmware/tegra/ivc.c               | 150 +++++++++++++--------
 drivers/thermal/tegra/tegra-bpmp-thermal.c |  15 ++-
 include/soc/tegra/bpmp.h                   |  17 ++-
 include/soc/tegra/ivc.h                    |  11 +-
 7 files changed, 159 insertions(+), 108 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 63ab21d89c2c..2e26199041cd 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -18,8 +18,8 @@ struct tegra186_bpmp {
 
 	struct {
 		struct gen_pool *pool;
+		void __iomem *virt;
 		dma_addr_t phys;
-		void *virt;
 	} tx, rx;
 
 	struct {
@@ -40,31 +40,27 @@ mbox_client_to_bpmp(struct mbox_client *client)
 
 static bool tegra186_bpmp_is_message_ready(struct tegra_bpmp_channel *channel)
 {
-	void *frame;
+	int err;
 
-	frame = tegra_ivc_read_get_next_frame(channel->ivc);
-	if (IS_ERR(frame)) {
-		channel->ib = NULL;
+	err = tegra_ivc_read_get_next_frame(channel->ivc, &channel->ib);
+	if (err) {
+		iosys_map_clear(&channel->ib);
 		return false;
 	}
 
-	channel->ib = frame;
-
 	return true;
 }
 
 static bool tegra186_bpmp_is_channel_free(struct tegra_bpmp_channel *channel)
 {
-	void *frame;
+	int err;
 
-	frame = tegra_ivc_write_get_next_frame(channel->ivc);
-	if (IS_ERR(frame)) {
-		channel->ob = NULL;
+	err = tegra_ivc_write_get_next_frame(channel->ivc, &channel->ob);
+	if (err) {
+		iosys_map_clear(&channel->ob);
 		return false;
 	}
 
-	channel->ob = frame;
-
 	return true;
 }
 
@@ -109,6 +105,7 @@ static int tegra186_bpmp_channel_init(struct tegra_bpmp_channel *channel,
 {
 	struct tegra186_bpmp *priv = bpmp->priv;
 	size_t message_size, queue_size;
+	struct iosys_map rx, tx;
 	unsigned int offset;
 	int err;
 
@@ -121,10 +118,11 @@ static int tegra186_bpmp_channel_init(struct tegra_bpmp_channel *channel,
 	queue_size = tegra_ivc_total_queue_size(message_size);
 	offset = queue_size * index;
 
-	err = tegra_ivc_init(channel->ivc, NULL,
-			     priv->rx.virt + offset, priv->rx.phys + offset,
-			     priv->tx.virt + offset, priv->tx.phys + offset,
-			     1, message_size, tegra186_bpmp_ivc_notify,
+	iosys_map_set_vaddr_iomem(&rx, priv->rx.virt + offset);
+	iosys_map_set_vaddr_iomem(&tx, priv->tx.virt + offset);
+
+	err = tegra_ivc_init(channel->ivc, NULL, &rx, priv->rx.phys + offset, &tx,
+			     priv->tx.phys + offset, 1, message_size, tegra186_bpmp_ivc_notify,
 			     bpmp);
 	if (err < 0) {
 		dev_err(bpmp->dev, "failed to setup IVC for channel %u: %d\n",
@@ -179,7 +177,7 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 		return -EPROBE_DEFER;
 	}
 
-	priv->tx.virt = gen_pool_dma_alloc(priv->tx.pool, 4096, &priv->tx.phys);
+	priv->tx.virt = (void __iomem *)gen_pool_dma_alloc(priv->tx.pool, 4096, &priv->tx.phys);
 	if (!priv->tx.virt) {
 		dev_err(bpmp->dev, "failed to allocate from TX pool\n");
 		return -ENOMEM;
@@ -192,7 +190,7 @@ static int tegra186_bpmp_init(struct tegra_bpmp *bpmp)
 		goto free_tx;
 	}
 
-	priv->rx.virt = gen_pool_dma_alloc(priv->rx.pool, 4096, &priv->rx.phys);
+	priv->rx.virt = (void __iomem *)gen_pool_dma_alloc(priv->rx.pool, 4096, &priv->rx.phys);
 	if (!priv->rx.virt) {
 		dev_err(bpmp->dev, "failed to allocate from RX pool\n");
 		err = -ENOMEM;
diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index c9c830f658c3..6421e11954f6 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -137,8 +137,8 @@ static int tegra210_bpmp_channel_init(struct tegra_bpmp_channel *channel,
 				      unsigned int index)
 {
 	struct tegra210_bpmp *priv = bpmp->priv;
+	void __iomem *p;
 	u32 address;
-	void *p;
 
 	/* Retrieve channel base address from BPMP */
 	writel(index << TRIGGER_ID_SHIFT | TRIGGER_CMD_GET,
@@ -149,8 +149,9 @@ static int tegra210_bpmp_channel_init(struct tegra_bpmp_channel *channel,
 	if (!p)
 		return -ENOMEM;
 
-	channel->ib = p;
-	channel->ob = p;
+	iosys_map_set_vaddr_iomem(&channel->ib, p);
+	iosys_map_set_vaddr_iomem(&channel->ob, p);
+
 	channel->index = index;
 	init_completion(&channel->completion);
 	channel->bpmp = bpmp;
diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 037db21de510..3f652ce6e9fa 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -201,13 +201,13 @@ static ssize_t __tegra_bpmp_channel_read(struct tegra_bpmp_channel *channel,
 	int err;
 
 	if (data && size > 0)
-		memcpy_fromio(data, channel->ib->data, size);
+		tegra_bpmp_mb_read(data, &channel->ib, size);
 
 	err = tegra_bpmp_ack_response(channel);
 	if (err < 0)
 		return err;
 
-	*ret = channel->ib->code;
+	*ret = tegra_bpmp_mb_read_field(&channel->ib, code);
 
 	return 0;
 }
@@ -241,11 +241,11 @@ static ssize_t __tegra_bpmp_channel_write(struct tegra_bpmp_channel *channel,
 					  unsigned int mrq, unsigned long flags,
 					  const void *data, size_t size)
 {
-	channel->ob->code = mrq;
-	channel->ob->flags = flags;
+	tegra_bpmp_mb_write_field(&channel->ob, code, mrq);
+	tegra_bpmp_mb_write_field(&channel->ob, flags, flags);
 
 	if (data && size > 0)
-		memcpy_toio(channel->ob->data, data, size);
+		tegra_bpmp_mb_write(&channel->ob, data, size);
 
 	return tegra_bpmp_post_request(channel);
 }
@@ -400,7 +400,7 @@ static struct tegra_bpmp_mrq *tegra_bpmp_find_mrq(struct tegra_bpmp *bpmp,
 void tegra_bpmp_mrq_return(struct tegra_bpmp_channel *channel, int code,
 			   const void *data, size_t size)
 {
-	unsigned long flags = channel->ib->flags;
+	unsigned long flags = tegra_bpmp_mb_read_field(&channel->ib, flags);
 	struct tegra_bpmp *bpmp = channel->bpmp;
 	int err;
 
@@ -417,10 +417,10 @@ void tegra_bpmp_mrq_return(struct tegra_bpmp_channel *channel, int code,
 	if (WARN_ON(!tegra_bpmp_is_response_channel_free(channel)))
 		return;
 
-	channel->ob->code = code;
+	tegra_bpmp_mb_write_field(&channel->ob, code, code);
 
 	if (data && size > 0)
-		memcpy_toio(channel->ob->data, data, size);
+		tegra_bpmp_mb_write(&channel->ob, data, size);
 
 	err = tegra_bpmp_post_response(channel);
 	if (WARN_ON(err < 0))
@@ -529,13 +529,13 @@ static void tegra_bpmp_mrq_handle_ping(unsigned int mrq,
 				       struct tegra_bpmp_channel *channel,
 				       void *data)
 {
-	struct mrq_ping_request *request;
+	struct mrq_ping_request request;
 	struct mrq_ping_response response;
 
-	request = (struct mrq_ping_request *)channel->ib->data;
+	tegra_bpmp_mb_read(&request, &channel->ib, sizeof(request));
 
 	memset(&response, 0, sizeof(response));
-	response.reply = request->challenge << 1;
+	response.reply = request.challenge << 1;
 
 	tegra_bpmp_mrq_return(channel, 0, &response, sizeof(response));
 }
@@ -648,7 +648,7 @@ static int tegra_bpmp_get_firmware_tag(struct tegra_bpmp *bpmp, char *tag,
 
 static void tegra_bpmp_channel_signal(struct tegra_bpmp_channel *channel)
 {
-	unsigned long flags = channel->ob->flags;
+	unsigned long flags = tegra_bpmp_mb_read_field(&channel->ob, flags);
 
 	if ((flags & MSG_RING) == 0)
 		return;
@@ -666,8 +666,11 @@ void tegra_bpmp_handle_rx(struct tegra_bpmp *bpmp)
 	count = bpmp->soc->channels.thread.count;
 	busy = bpmp->threaded.busy;
 
-	if (tegra_bpmp_is_request_ready(channel))
-		tegra_bpmp_handle_mrq(bpmp, channel->ib->code, channel);
+	if (tegra_bpmp_is_request_ready(channel)) {
+		unsigned int mrq = tegra_bpmp_mb_read_field(&channel->ib, code);
+
+		tegra_bpmp_handle_mrq(bpmp, mrq, channel);
+	}
 
 	spin_lock(&bpmp->lock);
 
diff --git a/drivers/firmware/tegra/ivc.c b/drivers/firmware/tegra/ivc.c
index e2398cd7ca98..8c9aff9804c0 100644
--- a/drivers/firmware/tegra/ivc.c
+++ b/drivers/firmware/tegra/ivc.c
@@ -68,6 +68,12 @@ struct tegra_ivc_header {
 	} rx;
 };
 
+#define tegra_ivc_header_read_field(hdr, field) \
+	iosys_map_rd_field(hdr, 0, struct tegra_ivc_header, field)
+
+#define tegra_ivc_header_write_field(hdr, field, value) \
+	iosys_map_wr_field(hdr, 0, struct tegra_ivc_header, field, value)
+
 static inline void tegra_ivc_invalidate(struct tegra_ivc *ivc, dma_addr_t phys)
 {
 	if (!ivc->peer)
@@ -86,16 +92,15 @@ static inline void tegra_ivc_flush(struct tegra_ivc *ivc, dma_addr_t phys)
 				   DMA_TO_DEVICE);
 }
 
-static inline bool tegra_ivc_empty(struct tegra_ivc *ivc,
-				   struct tegra_ivc_header *header)
+static inline bool tegra_ivc_empty(struct tegra_ivc *ivc, struct iosys_map *map)
 {
 	/*
 	 * This function performs multiple checks on the same values with
 	 * security implications, so create snapshots with READ_ONCE() to
 	 * ensure that these checks use the same values.
 	 */
-	u32 tx = READ_ONCE(header->tx.count);
-	u32 rx = READ_ONCE(header->rx.count);
+	u32 tx = tegra_ivc_header_read_field(map, tx.count);
+	u32 rx = tegra_ivc_header_read_field(map, rx.count);
 
 	/*
 	 * Perform an over-full check to prevent denial of service attacks
@@ -113,11 +118,10 @@ static inline bool tegra_ivc_empty(struct tegra_ivc *ivc,
 	return tx == rx;
 }
 
-static inline bool tegra_ivc_full(struct tegra_ivc *ivc,
-				  struct tegra_ivc_header *header)
+static inline bool tegra_ivc_full(struct tegra_ivc *ivc, struct iosys_map *map)
 {
-	u32 tx = READ_ONCE(header->tx.count);
-	u32 rx = READ_ONCE(header->rx.count);
+	u32 tx = tegra_ivc_header_read_field(map, tx.count);
+	u32 rx = tegra_ivc_header_read_field(map, rx.count);
 
 	/*
 	 * Invalid cases where the counters indicate that the queue is over
@@ -126,11 +130,10 @@ static inline bool tegra_ivc_full(struct tegra_ivc *ivc,
 	return tx - rx >= ivc->num_frames;
 }
 
-static inline u32 tegra_ivc_available(struct tegra_ivc *ivc,
-				      struct tegra_ivc_header *header)
+static inline u32 tegra_ivc_available(struct tegra_ivc *ivc, struct iosys_map *map)
 {
-	u32 tx = READ_ONCE(header->tx.count);
-	u32 rx = READ_ONCE(header->rx.count);
+	u32 tx = tegra_ivc_header_read_field(map, tx.count);
+	u32 rx = tegra_ivc_header_read_field(map, rx.count);
 
 	/*
 	 * This function isn't expected to be used in scenarios where an
@@ -143,8 +146,9 @@ static inline u32 tegra_ivc_available(struct tegra_ivc *ivc,
 
 static inline void tegra_ivc_advance_tx(struct tegra_ivc *ivc)
 {
-	WRITE_ONCE(ivc->tx.channel->tx.count,
-		   READ_ONCE(ivc->tx.channel->tx.count) + 1);
+	unsigned int count = tegra_ivc_header_read_field(&ivc->tx.map, tx.count);
+
+	tegra_ivc_header_write_field(&ivc->tx.map, tx.count, count + 1);
 
 	if (ivc->tx.position == ivc->num_frames - 1)
 		ivc->tx.position = 0;
@@ -154,8 +158,9 @@ static inline void tegra_ivc_advance_tx(struct tegra_ivc *ivc)
 
 static inline void tegra_ivc_advance_rx(struct tegra_ivc *ivc)
 {
-	WRITE_ONCE(ivc->rx.channel->rx.count,
-		   READ_ONCE(ivc->rx.channel->rx.count) + 1);
+	unsigned int count = tegra_ivc_header_read_field(&ivc->rx.map, rx.count);
+
+	tegra_ivc_header_write_field(&ivc->rx.map, rx.count, count + 1);
 
 	if (ivc->rx.position == ivc->num_frames - 1)
 		ivc->rx.position = 0;
@@ -166,6 +171,7 @@ static inline void tegra_ivc_advance_rx(struct tegra_ivc *ivc)
 static inline int tegra_ivc_check_read(struct tegra_ivc *ivc)
 {
 	unsigned int offset = offsetof(struct tegra_ivc_header, tx.count);
+	unsigned int state;
 
 	/*
 	 * tx.channel->state is set locally, so it is not synchronized with
@@ -175,7 +181,8 @@ static inline int tegra_ivc_check_read(struct tegra_ivc *ivc)
 	 * asynchronous transition of rx.channel->state to
 	 * TEGRA_IVC_STATE_ACK is not allowed.
 	 */
-	if (ivc->tx.channel->tx.state != TEGRA_IVC_STATE_ESTABLISHED)
+	state = tegra_ivc_header_read_field(&ivc->tx.map, tx.state);
+	if (state != TEGRA_IVC_STATE_ESTABLISHED)
 		return -ECONNRESET;
 
 	/*
@@ -185,12 +192,12 @@ static inline int tegra_ivc_check_read(struct tegra_ivc *ivc)
 	 * Synchronization is only necessary when these pointers indicate
 	 * empty or full.
 	 */
-	if (!tegra_ivc_empty(ivc, ivc->rx.channel))
+	if (!tegra_ivc_empty(ivc, &ivc->rx.map))
 		return 0;
 
 	tegra_ivc_invalidate(ivc, ivc->rx.phys + offset);
 
-	if (tegra_ivc_empty(ivc, ivc->rx.channel))
+	if (tegra_ivc_empty(ivc, &ivc->rx.map))
 		return -ENOSPC;
 
 	return 0;
@@ -199,29 +206,34 @@ static inline int tegra_ivc_check_read(struct tegra_ivc *ivc)
 static inline int tegra_ivc_check_write(struct tegra_ivc *ivc)
 {
 	unsigned int offset = offsetof(struct tegra_ivc_header, rx.count);
+	unsigned int state;
 
-	if (ivc->tx.channel->tx.state != TEGRA_IVC_STATE_ESTABLISHED)
+	state = tegra_ivc_header_read_field(&ivc->tx.map, tx.state);
+	if (state != TEGRA_IVC_STATE_ESTABLISHED)
 		return -ECONNRESET;
 
-	if (!tegra_ivc_full(ivc, ivc->tx.channel))
+	if (!tegra_ivc_full(ivc, &ivc->tx.map))
 		return 0;
 
 	tegra_ivc_invalidate(ivc, ivc->tx.phys + offset);
 
-	if (tegra_ivc_full(ivc, ivc->tx.channel))
+	if (tegra_ivc_full(ivc, &ivc->tx.map))
 		return -ENOSPC;
 
 	return 0;
 }
 
-static void *tegra_ivc_frame_virt(struct tegra_ivc *ivc,
-				  struct tegra_ivc_header *header,
-				  unsigned int frame)
+static int tegra_ivc_frame_virt(struct tegra_ivc *ivc, const struct iosys_map *header,
+				unsigned int frame, struct iosys_map *map)
 {
+	size_t offset = sizeof(struct tegra_ivc_header) + ivc->frame_size * frame;
+
 	if (WARN_ON(frame >= ivc->num_frames))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
-	return (void *)(header + 1) + ivc->frame_size * frame;
+	*map = IOSYS_MAP_INIT_OFFSET(header, offset);
+
+	return 0;
 }
 
 static inline dma_addr_t tegra_ivc_frame_phys(struct tegra_ivc *ivc,
@@ -264,16 +276,16 @@ static inline void tegra_ivc_flush_frame(struct tegra_ivc *ivc,
 }
 
 /* directly peek at the next frame rx'ed */
-void *tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc)
+int tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc, struct iosys_map *map)
 {
 	int err;
 
 	if (WARN_ON(ivc == NULL))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	err = tegra_ivc_check_read(ivc);
 	if (err < 0)
-		return ERR_PTR(err);
+		return err;
 
 	/*
 	 * Order observation of ivc->rx.position potentially indicating new
@@ -284,7 +296,7 @@ void *tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc)
 	tegra_ivc_invalidate_frame(ivc, ivc->rx.phys, ivc->rx.position, 0,
 				   ivc->frame_size);
 
-	return tegra_ivc_frame_virt(ivc, ivc->rx.channel, ivc->rx.position);
+	return tegra_ivc_frame_virt(ivc, &ivc->rx.map, ivc->rx.position, map);
 }
 EXPORT_SYMBOL(tegra_ivc_read_get_next_frame);
 
@@ -320,7 +332,7 @@ int tegra_ivc_read_advance(struct tegra_ivc *ivc)
 	 */
 	tegra_ivc_invalidate(ivc, ivc->rx.phys + tx);
 
-	if (tegra_ivc_available(ivc, ivc->rx.channel) == ivc->num_frames - 1)
+	if (tegra_ivc_available(ivc, &ivc->rx.map) == ivc->num_frames - 1)
 		ivc->notify(ivc, ivc->notify_data);
 
 	return 0;
@@ -328,15 +340,15 @@ int tegra_ivc_read_advance(struct tegra_ivc *ivc)
 EXPORT_SYMBOL(tegra_ivc_read_advance);
 
 /* directly poke at the next frame to be tx'ed */
-void *tegra_ivc_write_get_next_frame(struct tegra_ivc *ivc)
+int tegra_ivc_write_get_next_frame(struct tegra_ivc *ivc, struct iosys_map *map)
 {
 	int err;
 
 	err = tegra_ivc_check_write(ivc);
 	if (err < 0)
-		return ERR_PTR(err);
+		return err;
 
-	return tegra_ivc_frame_virt(ivc, ivc->tx.channel, ivc->tx.position);
+	return tegra_ivc_frame_virt(ivc, &ivc->tx.map, ivc->tx.position, map);
 }
 EXPORT_SYMBOL(tegra_ivc_write_get_next_frame);
 
@@ -376,7 +388,7 @@ int tegra_ivc_write_advance(struct tegra_ivc *ivc)
 	 */
 	tegra_ivc_invalidate(ivc, ivc->tx.phys + rx);
 
-	if (tegra_ivc_available(ivc, ivc->tx.channel) == 1)
+	if (tegra_ivc_available(ivc, &ivc->tx.map) == 1)
 		ivc->notify(ivc, ivc->notify_data);
 
 	return 0;
@@ -387,7 +399,7 @@ void tegra_ivc_reset(struct tegra_ivc *ivc)
 {
 	unsigned int offset = offsetof(struct tegra_ivc_header, tx.count);
 
-	ivc->tx.channel->tx.state = TEGRA_IVC_STATE_SYNC;
+	tegra_ivc_header_write_field(&ivc->tx.map, tx.state, TEGRA_IVC_STATE_SYNC);
 	tegra_ivc_flush(ivc, ivc->tx.phys + offset);
 	ivc->notify(ivc, ivc->notify_data);
 }
@@ -416,13 +428,14 @@ EXPORT_SYMBOL(tegra_ivc_reset);
 int tegra_ivc_notified(struct tegra_ivc *ivc)
 {
 	unsigned int offset = offsetof(struct tegra_ivc_header, tx.count);
-	enum tegra_ivc_state state;
+	enum tegra_ivc_state rx_state, tx_state;
 
 	/* Copy the receiver's state out of shared memory. */
 	tegra_ivc_invalidate(ivc, ivc->rx.phys + offset);
-	state = READ_ONCE(ivc->rx.channel->tx.state);
+	rx_state = tegra_ivc_header_read_field(&ivc->rx.map, tx.state);
+	tx_state = tegra_ivc_header_read_field(&ivc->tx.map, tx.state);
 
-	if (state == TEGRA_IVC_STATE_SYNC) {
+	if (rx_state == TEGRA_IVC_STATE_SYNC) {
 		offset = offsetof(struct tegra_ivc_header, tx.count);
 
 		/*
@@ -436,8 +449,8 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 * state and won't make progress until we change our state,
 		 * so the counters are not in use at this time.
 		 */
-		ivc->tx.channel->tx.count = 0;
-		ivc->rx.channel->rx.count = 0;
+		tegra_ivc_header_write_field(&ivc->tx.map, tx.count, 0);
+		tegra_ivc_header_write_field(&ivc->rx.map, rx.count, 0);
 
 		ivc->tx.position = 0;
 		ivc->rx.position = 0;
@@ -452,7 +465,7 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 * Move to ACK state. We have just cleared our counters, so it
 		 * is now safe for the remote end to start using these values.
 		 */
-		ivc->tx.channel->tx.state = TEGRA_IVC_STATE_ACK;
+		tegra_ivc_header_write_field(&ivc->tx.map, tx.state, TEGRA_IVC_STATE_ACK);
 		tegra_ivc_flush(ivc, ivc->tx.phys + offset);
 
 		/*
@@ -460,8 +473,8 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 */
 		ivc->notify(ivc, ivc->notify_data);
 
-	} else if (ivc->tx.channel->tx.state == TEGRA_IVC_STATE_SYNC &&
-		   state == TEGRA_IVC_STATE_ACK) {
+	} else if (tx_state == TEGRA_IVC_STATE_SYNC &&
+		   rx_state == TEGRA_IVC_STATE_ACK) {
 		offset = offsetof(struct tegra_ivc_header, tx.count);
 
 		/*
@@ -475,8 +488,8 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 * state and won't make progress until we change our state,
 		 * so the counters are not in use at this time.
 		 */
-		ivc->tx.channel->tx.count = 0;
-		ivc->rx.channel->rx.count = 0;
+		tegra_ivc_header_write_field(&ivc->tx.map, tx.count, 0);
+		tegra_ivc_header_write_field(&ivc->rx.map, rx.count, 0);
 
 		ivc->tx.position = 0;
 		ivc->rx.position = 0;
@@ -492,7 +505,7 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 * already cleared its counters, so it is safe to start
 		 * writing/reading on this channel.
 		 */
-		ivc->tx.channel->tx.state = TEGRA_IVC_STATE_ESTABLISHED;
+		tegra_ivc_header_write_field(&ivc->tx.map, tx.state, TEGRA_IVC_STATE_ESTABLISHED);
 		tegra_ivc_flush(ivc, ivc->tx.phys + offset);
 
 		/*
@@ -500,7 +513,7 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 */
 		ivc->notify(ivc, ivc->notify_data);
 
-	} else if (ivc->tx.channel->tx.state == TEGRA_IVC_STATE_ACK) {
+	} else if (tx_state == TEGRA_IVC_STATE_ACK) {
 		offset = offsetof(struct tegra_ivc_header, tx.count);
 
 		/*
@@ -516,7 +529,7 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 * cleared its counters, so it is safe to start writing/reading
 		 * on this channel.
 		 */
-		ivc->tx.channel->tx.state = TEGRA_IVC_STATE_ESTABLISHED;
+		tegra_ivc_header_write_field(&ivc->tx.map, tx.state, TEGRA_IVC_STATE_ESTABLISHED);
 		tegra_ivc_flush(ivc, ivc->tx.phys + offset);
 
 		/*
@@ -533,7 +546,7 @@ int tegra_ivc_notified(struct tegra_ivc *ivc)
 		 */
 	}
 
-	if (ivc->tx.channel->tx.state != TEGRA_IVC_STATE_ESTABLISHED)
+	if (tx_state != TEGRA_IVC_STATE_ESTABLISHED)
 		return -EAGAIN;
 
 	return 0;
@@ -609,8 +622,29 @@ static int tegra_ivc_check_params(unsigned long rx, unsigned long tx,
 	return 0;
 }
 
-int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, void *rx,
-		   dma_addr_t rx_phys, void *tx, dma_addr_t tx_phys,
+static inline void iosys_map_copy(struct iosys_map *dst, const struct iosys_map *src)
+{
+	*dst = *src;
+}
+
+static inline unsigned long iosys_map_get_address(const struct iosys_map *map)
+{
+	if (map->is_iomem)
+		return (unsigned long)map->vaddr_iomem;
+
+	return (unsigned long)map->vaddr;
+}
+
+static inline void *iosys_map_get_vaddr(const struct iosys_map *map)
+{
+	if (WARN_ON(map->is_iomem))
+		return NULL;
+
+	return map->vaddr;
+}
+
+int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, const struct iosys_map *rx,
+		   dma_addr_t rx_phys, const struct iosys_map *tx, dma_addr_t tx_phys,
 		   unsigned int num_frames, size_t frame_size,
 		   void (*notify)(struct tegra_ivc *ivc, void *data),
 		   void *data)
@@ -628,7 +662,7 @@ int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, void *rx,
 	if (frame_size > INT_MAX)
 		return -E2BIG;
 
-	err = tegra_ivc_check_params((unsigned long)rx, (unsigned long)tx,
+	err = tegra_ivc_check_params(iosys_map_get_address(rx), iosys_map_get_address(tx),
 				     num_frames, frame_size);
 	if (err < 0)
 		return err;
@@ -636,12 +670,12 @@ int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, void *rx,
 	queue_size = tegra_ivc_total_queue_size(num_frames * frame_size);
 
 	if (peer) {
-		ivc->rx.phys = dma_map_single(peer, rx, queue_size,
+		ivc->rx.phys = dma_map_single(peer, iosys_map_get_vaddr(rx), queue_size,
 					      DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(peer, ivc->rx.phys))
 			return -ENOMEM;
 
-		ivc->tx.phys = dma_map_single(peer, tx, queue_size,
+		ivc->tx.phys = dma_map_single(peer, iosys_map_get_vaddr(tx), queue_size,
 					      DMA_BIDIRECTIONAL);
 		if (dma_mapping_error(peer, ivc->tx.phys)) {
 			dma_unmap_single(peer, ivc->rx.phys, queue_size,
@@ -653,8 +687,8 @@ int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, void *rx,
 		ivc->tx.phys = tx_phys;
 	}
 
-	ivc->rx.channel = rx;
-	ivc->tx.channel = tx;
+	iosys_map_copy(&ivc->rx.map, rx);
+	iosys_map_copy(&ivc->tx.map, tx);
 	ivc->peer = peer;
 	ivc->notify = notify;
 	ivc->notify_data = data;
diff --git a/drivers/thermal/tegra/tegra-bpmp-thermal.c b/drivers/thermal/tegra/tegra-bpmp-thermal.c
index eb84f0b9dc7c..0b7a1a1948cb 100644
--- a/drivers/thermal/tegra/tegra-bpmp-thermal.c
+++ b/drivers/thermal/tegra/tegra-bpmp-thermal.c
@@ -106,21 +106,22 @@ static void tz_device_update_work_fn(struct work_struct *work)
 static void bpmp_mrq_thermal(unsigned int mrq, struct tegra_bpmp_channel *ch,
 			     void *data)
 {
-	struct mrq_thermal_bpmp_to_host_request *req;
+	struct mrq_thermal_bpmp_to_host_request req;
 	struct tegra_bpmp_thermal *tegra = data;
+	size_t offset;
 	int i;
 
-	req = (struct mrq_thermal_bpmp_to_host_request *)ch->ib->data;
+	offset = offsetof(struct tegra_bpmp_mb_data, data);
+	iosys_map_memcpy_from(&req, &ch->ib, offset, sizeof(req));
 
-	if (req->type != CMD_THERMAL_HOST_TRIP_REACHED) {
-		dev_err(tegra->dev, "%s: invalid request type: %d\n",
-			__func__, req->type);
+	if (req.type != CMD_THERMAL_HOST_TRIP_REACHED) {
+		dev_err(tegra->dev, "%s: invalid request type: %d\n", __func__, req.type);
 		tegra_bpmp_mrq_return(ch, -EINVAL, NULL, 0);
 		return;
 	}
 
 	for (i = 0; i < tegra->num_zones; ++i) {
-		if (tegra->zones[i]->idx != req->host_trip_reached.zone)
+		if (tegra->zones[i]->idx != req.host_trip_reached.zone)
 			continue;
 
 		schedule_work(&tegra->zones[i]->tz_device_update_work);
@@ -129,7 +130,7 @@ static void bpmp_mrq_thermal(unsigned int mrq, struct tegra_bpmp_channel *ch,
 	}
 
 	dev_err(tegra->dev, "%s: invalid thermal zone: %d\n", __func__,
-		req->host_trip_reached.zone);
+		req.host_trip_reached.zone);
 	tegra_bpmp_mrq_return(ch, -EINVAL, NULL, 0);
 }
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f2604e99af09..5842e38bb288 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -6,6 +6,7 @@
 #ifndef __SOC_TEGRA_BPMP_H
 #define __SOC_TEGRA_BPMP_H
 
+#include <linux/iosys-map.h>
 #include <linux/mailbox_client.h>
 #include <linux/pm_domain.h>
 #include <linux/reset-controller.h>
@@ -36,10 +37,22 @@ struct tegra_bpmp_mb_data {
 	u8 data[MSG_DATA_MIN_SZ];
 } __packed;
 
+#define tegra_bpmp_mb_read(dst, mb, size) \
+	iosys_map_memcpy_from(dst, mb, offsetof(struct tegra_bpmp_mb_data, data), size)
+
+#define tegra_bpmp_mb_write(mb, src, size) \
+	iosys_map_memcpy_to(mb, offsetof(struct tegra_bpmp_mb_data, data), src, size)
+
+#define tegra_bpmp_mb_read_field(mb, field) \
+	iosys_map_rd_field(mb, 0, struct tegra_bpmp_mb_data, field)
+
+#define tegra_bpmp_mb_write_field(mb, field, value) \
+	iosys_map_wr_field(mb, 0, struct tegra_bpmp_mb_data, field, value)
+
 struct tegra_bpmp_channel {
 	struct tegra_bpmp *bpmp;
-	struct tegra_bpmp_mb_data *ib;
-	struct tegra_bpmp_mb_data *ob;
+	struct iosys_map ib;
+	struct iosys_map ob;
 	struct completion completion;
 	struct tegra_ivc *ivc;
 	unsigned int index;
diff --git a/include/soc/tegra/ivc.h b/include/soc/tegra/ivc.h
index 4aeb77cc22c5..116793b26330 100644
--- a/include/soc/tegra/ivc.h
+++ b/include/soc/tegra/ivc.h
@@ -7,6 +7,7 @@
 
 #include <linux/device.h>
 #include <linux/dma-mapping.h>
+#include <linux/iosys-map.h>
 #include <linux/types.h>
 
 struct tegra_ivc_header;
@@ -15,7 +16,7 @@ struct tegra_ivc {
 	struct device *peer;
 
 	struct {
-		struct tegra_ivc_header *channel;
+		struct iosys_map map;
 		unsigned int position;
 		dma_addr_t phys;
 	} rx, tx;
@@ -36,7 +37,7 @@ struct tegra_ivc {
  *
  * Returns a pointer to the frame, or an error encoded pointer.
  */
-void *tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc);
+int tegra_ivc_read_get_next_frame(struct tegra_ivc *ivc, struct iosys_map *map);
 
 /**
  * tegra_ivc_read_advance - Advance the read queue
@@ -56,7 +57,7 @@ int tegra_ivc_read_advance(struct tegra_ivc *ivc);
  *
  * Returns a pointer to the frame, or an error encoded pointer.
  */
-void *tegra_ivc_write_get_next_frame(struct tegra_ivc *ivc);
+int tegra_ivc_write_get_next_frame(struct tegra_ivc *ivc, struct iosys_map *map);
 
 /**
  * tegra_ivc_write_advance - Advance the write queue
@@ -91,8 +92,8 @@ void tegra_ivc_reset(struct tegra_ivc *ivc);
 
 size_t tegra_ivc_align(size_t size);
 unsigned tegra_ivc_total_queue_size(unsigned queue_size);
-int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, void *rx,
-		   dma_addr_t rx_phys, void *tx, dma_addr_t tx_phys,
+int tegra_ivc_init(struct tegra_ivc *ivc, struct device *peer, const struct iosys_map *rx,
+		   dma_addr_t rx_phys, const struct iosys_map *tx, dma_addr_t tx_phys,
 		   unsigned int num_frames, size_t frame_size,
 		   void (*notify)(struct tegra_ivc *ivc, void *data),
 		   void *data);
-- 
2.37.3

