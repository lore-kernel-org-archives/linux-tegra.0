Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7198E28B4FD
	for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 09:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779354281; cv=none; b=tNnCqtkt7hSJCJs+VekIwUKouqxdUcYKFZuT0+Tcez3XDb7b7p6pwXInyNuLfX+cukSCHLet9oS3USD8EjXU1DGYDYoPxpnnHivOOpLUWvWqfUQgSYoE6FcumeJwl/vhSLFQLu9a9buUjjtgSw5VU65Pk1jdqLpfzIeYTOFfPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779354281; c=relaxed/simple;
	bh=+dwTK0cuHhjwGvIjWknGmhW347ji5Nq6ak300K4ZR0U=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=WNoweNfsx12S/9Wxz7xML7dDp/r/tWQv+6onKfgvrSVp3DSRpGK/XtwFqSATGMDgJxkts6bfyKobcb+M1T2gS2gLiYOFsrt0J6X2bCsldzbUvlCyLmbt1bh5RD/ORZVFGXt+M3udXejo7trRzleOHa/zjyqVrDlXjC/m0MyCSkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J+7hS1gM; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J+7hS1gM"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c8276c91addso3291498a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 21 May 2026 02:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779354279; x=1779959079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yAR4jGfkO1axcbCYTzSG39vOuVG5Rz/bo7M1T3CVqPQ=;
        b=J+7hS1gMA/KSRTV6KXRwLOSCmj0OBoeloMh7n4Ow0ilVQ/Ded8W3BF4b6eiLXa8oUJ
         2fqXRe7qBARdr70uxmLsX083cJ7QhHaPxBI8Uo43RXmHm2cKKjzO6VDSXweUCVpwguPW
         o5boZLPvJ3YZY+bZj74Vp5UeYU3yoS+sgeVFwnLVTHPpB9UQ59d8pGAPdFwXhPqYPlih
         AxjY6+m7vPfAihWKZTlUyE+/jy0a+ziPZPkgtqkoGSPXY6AN4VtiX6ntCX94t/tk9m5f
         u6OtemoxD9+MmP1ZZDfmozsFYqmwrVsGD/+AT/b+FW9shZSNua7T1JhQ8UhtmiEVI9CW
         jw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779354279; x=1779959079;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAR4jGfkO1axcbCYTzSG39vOuVG5Rz/bo7M1T3CVqPQ=;
        b=A8/6UVlc+mB16DKp5kIXyR5FovTfCyE65zTcmAQ41ZRMtK08C6LCIFwuAmWgt+o6JM
         lH6yIiPr29fOxv5KL2c0ugbRCN4Hli7ansQHcTxkq1u93vQ2k6TvqxCB8Zsfd/pyVfgw
         E1bPK/mnVKHnQA+RNANIVyforbFbCC/zhd6kFLE9mL8y2hJq17TbBesjAsEkNiPHPg6q
         yEAYJV7FuKuK1Xfjp6q1eWopmilGWyEcqPBgAz4H+/HvC2qQtk2bGRbRpadx6D2D7XRv
         YrceBbZb9lxgm7YoUxYaFbMv4Wsfg9LHt4j6lJT3CZho2nvZXIJR1CCE3Bk2Jgfpa5JU
         LKHg==
X-Forwarded-Encrypted: i=1; AFNElJ+UwgqXt3j00choG29KcBwnkAFhHLTtL1MphqMXJ5Yl7hn8S7rriw3+qpf7XlY9CdqukfCMim9IMaFCFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxyx76+Ii+c9ARvAWX0lEIhM2weTLcQgxhVMwedKaefru0FiMZU
	NPl5QGf0tpKtSWNNd13Ma3NJxwwZtYEgmCF1C/eIhzHvyLJ4J/9NAOhoToByieOdcoOq4NAgIQu
	P2iRN+tX9qAw3d/ABHJO05+q6tg==
X-Received: from pfblx15.prod.google.com ([2002:a05:6a00:754f:b0:82f:7833:9aa9])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:3d1d:b0:3a2:ebfc:6bf3 with SMTP id adf61e73a8af0-3b30885a83cmr2492228637.29.1779354278650;
 Thu, 21 May 2026 02:04:38 -0700 (PDT)
Date: Thu, 21 May 2026 09:04:31 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
Message-ID: <20260521090433.1353240-1-joonwonkang@google.com>
Subject: [PATCH RESEND v6.12.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: sashal@kernel.org, stable@vger.kernel.org, jassisinghbrar@gmail.com, 
	greg@kroah.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	joonwonkang@google.com, dianders@chromium.org, sudeep.holla@arm.com, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From: Jassi Brar <jassisinghbrar@gmail.com>

commit c58e9456e30c ("mailbox: Fix NULL message support in mbox_send_message()") upstream.

The active_req field serves double duty as both the "is a TX in
flight" flag (NULL means idle) and the storage for the in-flight
message pointer. When a client sends NULL via mbox_send_message(),
active_req is set to NULL, which the framework misinterprets as
"no active request". This breaks the TX state machine by:

 - tx_tick() short-circuits on (!mssg), skipping the tx_done
   callback and the tx_complete completion
 - txdone_hrtimer() skips the channel entirely since active_req
   is NULL, so poll-based TX-done detection never fires.

Fix this by introducing a MBOX_NO_MSG sentinel value that means
"no active request," freeing NULL to be valid message data. The
sentinel is defined in the subsystem-internal mailbox.h so that
controller drivers within drivers/mailbox/ can reference it, but
it is not exposed to clients outside the subsystem.

Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
audited for regression:

 - Most already work around the bug via knows_txdone=true with a
   manual mbox_client_txdone() call, making the framework's
   tracking irrelevant. These are unaffected.

 - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
   the poll timer now correctly detects NULL-active channels
   instead of silently skipping them.

 - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
   caller that omitted the knows_txdone + mbox_client_txdone()
   pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
   missing mailbox TX done acknowledgment").

 - No caller sets both a tx_done callback and sends NULL, nor
   combines tx_block=true with NULL sends, so the newly reachable
   callback/completion paths are never exercised.

Also update tegra-hsp's flush callback, which directly inspects
active_req to wait for the channel to drain: the old "!= NULL"
check becomes "!= MBOX_NO_MSG", otherwise flush spins until
timeout since the sentinel is non-NULL.

The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
by clients.

Reported-by: Joonwon Kang <joonwonkang@google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 15 ++++++++-------
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h |  3 +++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index b4d52b814055..383c54d353ee 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -59,7 +59,7 @@ static void msg_submit(struct mbox_chan *chan)
 
 	spin_lock_irqsave(&chan->lock, flags);
 
-	if (!chan->msg_count || chan->active_req)
+	if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
 		goto exit;
 
 	count = chan->msg_count;
@@ -97,13 +97,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
 
 	spin_lock_irqsave(&chan->lock, flags);
 	mssg = chan->active_req;
-	chan->active_req = NULL;
+	chan->active_req = MBOX_NO_MSG;
 	spin_unlock_irqrestore(&chan->lock, flags);
 
 	/* Submit next message */
 	msg_submit(chan);
 
-	if (!mssg)
+	if (mssg == MBOX_NO_MSG)
 		return;
 
 	/* Notify the client */
@@ -125,7 +125,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -257,7 +257,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 
-	if (!chan || !chan->cl)
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	t = add_to_rbuf(chan, mssg);
@@ -331,7 +331,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->msg_free = 0;
 	chan->msg_count = 0;
-	chan->active_req = NULL;
+	chan->active_req = MBOX_NO_MSG;
 	chan->cl = cl;
 	init_completion(&chan->tx_complete);
 
@@ -492,7 +492,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
-	chan->active_req = NULL;
+	chan->active_req = MBOX_NO_MSG;
 	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
@@ -549,6 +549,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 76f54f8b6b6c..8ef8b444de61 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -497,7 +497,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != NULL)
+			if (chan->active_req != MBOX_NO_MSG)
 				continue;
 
 			return 0;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index b91379922cb3..1689031c58c9 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -11,6 +11,9 @@
 
 struct mbox_chan;
 
+/* Sentinel value distinguishing "no active request" from "NULL message data" */
+#define MBOX_NO_MSG	((void *)-1)
+
 /**
  * struct mbox_chan_ops - methods to control mailbox channels
  * @send_data:	The API asks the MBOX controller driver, in atomic
-- 
2.54.0.746.g67dd491aae-goog

