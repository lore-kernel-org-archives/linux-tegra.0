Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F2D348453
	for <linux-tegra@vger.kernel.org>; Fri, 10 Apr 2026 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775825919; cv=none; b=OmFDWQ7kqZEH/WgoWxGBfTzkqWXWJu8MwRjAJhldgTPyDGKMFYOJIjZtS3Qx4WycmR9+NocN9WYiFjfCwA8oHFoH8rqRp7GhCaPfB9MB++Yu8s8EK9gT/dHqWnidpjYX/ugLzzjWMpel4rqlQx+8S/L4CB0CPnGZyQsPQr8qx04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775825919; c=relaxed/simple;
	bh=ZqoHXRcVfvsBna1aRNXakyPiZ+0rwW24Qd/Ju/et5BA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KZWNUAJ0YyPiMmGD4tHqeSCpp2M/1WzxJDAffnw8zTR+7YmCpiTlXcuzvDe25irFd8LDEluFm1aTBQuKeJalpt8gbor3lJJefgdyVFkWekiEEMlLcptPgDi0MXuidZC8bseVZ7hl1WlZxGZEOCRfR8X6TNV7GnKAmb3T9DqRVM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PT9XZv14; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PT9XZv14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=hZ69bOR3/6zlmi
	UsLzPVxv31mozYAaVG3lW9J1qZUxI=; b=PT9XZv14TZKyIZjpRDMZJR1GC/7nt6
	itsg24VEoIYNOGnXun4s5/H4GQGToC3SeshINnvbY183bBqOsOhePB+Evwg631S9
	KmyOgPpt+Cb/MKTH9Zm2bqAYtzf+4d7WNi1B8C1POUALGRAPB99XCrlZpR/URL77
	Cx2GcWQAYTKJFlU5pDstn8eobP4FuUfrXWgdqEEVD+VAeIHWBjMVB8urgNGBXW2y
	JLWRn287bZxDsHggwgTknq010sAzJoinV4kngM3S0Ly3mMWSuWdrCzTo5a1QUg8E
	pjxDcfdrEY4wbZepST3vrAAZM3HLsra9iaKkXRjbFmfbJWLaBQ47RKbQ==
Received: (qmail 1249670 invoked from network); 10 Apr 2026 14:51:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Apr 2026 14:51:13 +0200
X-UD-Smtp-Session: l3s3148p1@QqiHlhpPpI9UszZ9
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Peter Chen <peter.chen@cixtech.com>,
	Fugang Duan <fugang.duan@cixtech.com>,
	CIX Linux Kernel Upstream Group <cix-kernel-upstream@cixtech.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org
Subject: [PATCH] mailbox: prefix new constants with MBOX_
Date: Fri, 10 Apr 2026 14:49:12 +0200
Message-ID: <20260410125105.39340-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 89e5d7d61600 ("mailbox: remove superfluous internal header")
moved some constants to a public header but forgot to add a mailbox
specific prefix. Add this now to prevent future collisions on a too
generic naming.

Link: https://sashiko.dev/#/patchset/20260327151112.5202-2-wsa%2Brenesas%40sang-engineering.com
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

This patch improves the above mentioned commit which already sits in
-next. It is not really a fix but it probably is still a good idea to
apply it before rc1 to avoid confusion.

 drivers/mailbox/cix-mailbox.c      |  2 +-
 drivers/mailbox/imx-mailbox.c      |  2 +-
 drivers/mailbox/mailbox.c          | 22 +++++++++++-----------
 drivers/mailbox/mtk-cmdq-mailbox.c |  2 +-
 drivers/mailbox/omap-mailbox.c     |  2 +-
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h |  6 +++---
 7 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/mailbox/cix-mailbox.c b/drivers/mailbox/cix-mailbox.c
index 8cfaa91b75bd..43c76cdab24a 100644
--- a/drivers/mailbox/cix-mailbox.c
+++ b/drivers/mailbox/cix-mailbox.c
@@ -413,7 +413,7 @@ static int cix_mbox_startup(struct mbox_chan *chan)
 	switch (cp->type) {
 	case CIX_MBOX_TYPE_DB:
 		/* Overwrite txdone_method for DB channel */
-		chan->txdone_method = TXDONE_BY_ACK;
+		chan->txdone_method = MBOX_TXDONE_BY_ACK;
 		fallthrough;
 	case CIX_MBOX_TYPE_REG:
 		if (priv->dir == CIX_MBOX_TX) {
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 22331b579489..246a9a9e3952 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -732,7 +732,7 @@ static struct mbox_chan * imx_mu_xlate(struct mbox_controller *mbox,
 	p_chan = &mbox->chans[chan];
 
 	if (type == IMX_MU_TYPE_TXDB_V2)
-		p_chan->txdone_method = TXDONE_BY_ACK;
+		p_chan->txdone_method = MBOX_TXDONE_BY_ACK;
 
 	return p_chan;
 }
diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 138ffbcd4fde..30eafdf3a91e 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -72,7 +72,7 @@ static void msg_submit(struct mbox_chan *chan)
 		}
 	}
 
-	if (!err && (chan->txdone_method & TXDONE_BY_POLL)) {
+	if (!err && (chan->txdone_method & MBOX_TXDONE_BY_POLL)) {
 		/* kick start the timer immediately to avoid delays */
 		scoped_guard(spinlock_irqsave, &chan->mbox->poll_hrt_lock)
 			hrtimer_start(&chan->mbox->poll_hrt, 0, HRTIMER_MODE_REL);
@@ -162,7 +162,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
-	if (unlikely(!(chan->txdone_method & TXDONE_BY_IRQ))) {
+	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_IRQ))) {
 		dev_err(chan->mbox->dev,
 		       "Controller can't run the TX ticker\n");
 		return;
@@ -183,7 +183,7 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
-	if (unlikely(!(chan->txdone_method & TXDONE_BY_ACK))) {
+	if (unlikely(!(chan->txdone_method & MBOX_TXDONE_BY_ACK))) {
 		dev_err(chan->mbox->dev, "Client can't run the TX ticker\n");
 		return;
 	}
@@ -344,8 +344,8 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
 
-		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
-			chan->txdone_method = TXDONE_BY_ACK;
+		if (chan->txdone_method	== MBOX_TXDONE_BY_POLL && cl->knows_txdone)
+			chan->txdone_method = MBOX_TXDONE_BY_ACK;
 	}
 
 	if (chan->mbox->ops->startup) {
@@ -499,8 +499,8 @@ void mbox_free_channel(struct mbox_chan *chan)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
 		chan->active_req = MBOX_NO_MSG;
-		if (chan->txdone_method == TXDONE_BY_ACK)
-			chan->txdone_method = TXDONE_BY_POLL;
+		if (chan->txdone_method == MBOX_TXDONE_BY_ACK)
+			chan->txdone_method = MBOX_TXDONE_BY_POLL;
 	}
 
 	module_put(chan->mbox->dev->driver->owner);
@@ -531,13 +531,13 @@ int mbox_controller_register(struct mbox_controller *mbox)
 		return -EINVAL;
 
 	if (mbox->txdone_irq)
-		txdone = TXDONE_BY_IRQ;
+		txdone = MBOX_TXDONE_BY_IRQ;
 	else if (mbox->txdone_poll)
-		txdone = TXDONE_BY_POLL;
+		txdone = MBOX_TXDONE_BY_POLL;
 	else /* It has to be ACK then */
-		txdone = TXDONE_BY_ACK;
+		txdone = MBOX_TXDONE_BY_ACK;
 
-	if (txdone == TXDONE_BY_POLL) {
+	if (txdone == MBOX_TXDONE_BY_POLL) {
 
 		if (!mbox->ops->last_tx_done) {
 			dev_err(mbox->dev, "last_tx_done method is absent\n");
diff --git a/drivers/mailbox/mtk-cmdq-mailbox.c b/drivers/mailbox/mtk-cmdq-mailbox.c
index 547a10a8fad3..e523c84b4808 100644
--- a/drivers/mailbox/mtk-cmdq-mailbox.c
+++ b/drivers/mailbox/mtk-cmdq-mailbox.c
@@ -728,7 +728,7 @@ static int cmdq_probe(struct platform_device *pdev)
 	cmdq->mbox.ops = &cmdq_mbox_chan_ops;
 	cmdq->mbox.of_xlate = cmdq_xlate;
 
-	/* make use of TXDONE_BY_ACK */
+	/* make use of MBOX_TXDONE_BY_ACK */
 	cmdq->mbox.txdone_irq = false;
 	cmdq->mbox.txdone_poll = false;
 
diff --git a/drivers/mailbox/omap-mailbox.c b/drivers/mailbox/omap-mailbox.c
index 5772c6b9886a..535ca8020877 100644
--- a/drivers/mailbox/omap-mailbox.c
+++ b/drivers/mailbox/omap-mailbox.c
@@ -238,7 +238,7 @@ static int omap_mbox_startup(struct omap_mbox *mbox)
 	}
 
 	if (mbox->send_no_irq)
-		mbox->chan->txdone_method = TXDONE_BY_ACK;
+		mbox->chan->txdone_method = MBOX_TXDONE_BY_ACK;
 
 	omap_mbox_enable_irq(mbox, IRQ_RX);
 
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 7b1e1b83ea29..500fa77c7d53 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -514,7 +514,7 @@ static int tegra_hsp_mailbox_startup(struct mbox_chan *chan)
 	struct tegra_hsp *hsp = mb->channel.hsp;
 	unsigned long flags;
 
-	chan->txdone_method = TXDONE_BY_IRQ;
+	chan->txdone_method = MBOX_TXDONE_BY_IRQ;
 
 	/*
 	 * Shared mailboxes start out as consumers by default. FULL and EMPTY
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index e3896b08f22e..a49ee687d4cf 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -15,9 +15,9 @@ struct mbox_chan;
 /* Sentinel value distinguishing "no active request" from "NULL message data" */
 #define MBOX_NO_MSG	((void *)-1)
 
-#define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
-#define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
-#define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
+#define MBOX_TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
+#define MBOX_TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
+#define MBOX_TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
 
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
-- 
2.51.0

