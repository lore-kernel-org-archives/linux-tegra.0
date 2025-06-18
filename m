Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE5627726
	for <linux-tegra@vger.kernel.org>; Wed, 18 Jun 2025 08:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750233868; cv=none; b=qmwCvGxzByuO1PwRFVYTgPjEWViYmwe9Uwrhhx4bn4tG4ZXr5U4WcGW6YM1G+9fBS5TwOwS/PAZx0haZF1TT8R67oQ7qKATaWqSMMpd8I97Bg5+3/4UPr8vj1o1k90w5AhBqsVuKA2bqdMvq1haewMzAssfFjCkOcGcqY7f6aDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750233868; c=relaxed/simple;
	bh=yl5dCt2p9NgRBQN0acGkIFARIah1SNLIIvQPjlua74M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=jDulZj98+D77dGsddW1/lEV2NbOlooqy3PBFzKfh9MQgFWUpljajzozsF8mYLyRZ1Y6Wmwj1X78yDnRtIaRuR504v8+jNksQeHqV/Cdz3G3WwTxjLnXMreOTPhDiOMk5m7oUSWVS+ayCZ52whujwOeyqRYP6S3UMScGQYTlFV80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=j/TCyPmO; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="j/TCyPmO"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so5763714a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 18 Jun 2025 01:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750233866; x=1750838666; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z/DwVRQ3b1y1TzMnYgvk64L2l0CSiGtFg3i8HFqfIzs=;
        b=j/TCyPmOpQ12nXWM5sQjGMuSrkDBXhXISJYag05iko5yVuCbIS3/ydAu66MuGKsAX8
         axW1SRHNTQefTX7ZhQZi4loyJuODmkcXOFcbNPAlq8EkSCj7x4RDcShiE5MqsjYdnTiy
         tTmA+hQq8Sc+c2Bu6WDgNGzcyBKZ5FVVBq3KF12TF9zxl15QqLNjBjFVX9wJv8WaR46L
         +bZBcZ2LsFCg5rRG7o/M5+gwteQgjfNKVNkjPVcgoVumD/kCbH02Z3uwX1A/fk9EHCPq
         1YOu5GegDVfSl2VtwusMLeH6+1pJJGOLMTt5ia2BRHT2PaHAPVuG2zv/AUMPK4v5nJPw
         Uu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750233866; x=1750838666;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Z/DwVRQ3b1y1TzMnYgvk64L2l0CSiGtFg3i8HFqfIzs=;
        b=gzkdVTNzZ+lmotU28yupFQcv1V3HtLBUC/dQwDc3dCDgg8kEKM1yw7lWlxKMYfwi6n
         KPPmLvboq15t5cLbRGxOe7u7xSAoPC795c3wzXUiqq/X65JPmSAwKR+nFT/a3MhIift+
         lZJT8UJrAe+0Re9/XMb5fStU+oWXDwveNh96xaKxhqEymh1NkpD5spAjEE6BIR7UQnmd
         0oMNz2vAID7f/4yEpUkluZlGF30DgPYtlad9lU9KjvruF3mZurMC4tjiIxh7+ucrGeD6
         5cXlEEY3pdL6edM5muPy8RZUMBE++a/Lx6LS4XIBuNxXs2hwDiFbx/9Q2L6DNf/Q83G6
         u8bA==
X-Forwarded-Encrypted: i=1; AJvYcCXm32xuY6msJqpyalzi3pMTr8+RtGnpT2/iHK+7waYwzCnTurVwyOOng2R5mZRS6YDgPQPk7uvZ+AWNxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwU0+qdFkZSwqZihtQzbdBypTgjPUvo28ueJBTHJ0+gghrjt1Op
	tX9cHLUUGSSsflpaAv9AoLF+okuVze9pXh/6+x8eQHxnKYtz8hGbJ+ygQyieKCrY16Iz3RkfnO5
	IfhQp5lXlE4rQo/oigr2R1SEweg==
X-Google-Smtp-Source: AGHT+IFX2fr9n0BZiK9URUlErAOmKdogNjRgm0OvFTLs0f8wPxFtW8UY6TmwvI1z1uPU6OMzK6bkw26PaxHua05yGg==
X-Received: from pjzz13.prod.google.com ([2002:a17:90b:58ed:b0:2fe:800f:23a])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3842:b0:312:1ae9:1529 with SMTP id 98e67ed59e1d1-313f1daf6d2mr23563450a91.27.1750233866516;
 Wed, 18 Jun 2025 01:04:26 -0700 (PDT)
Date: Wed, 18 Jun 2025 08:03:39 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618080339.969173-1-joonwonkang@google.com>
Subject: [PATCH 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, thierry.reding@gmail.com
Cc: alexey.klimov@arm.com, sudeep.holla@arm.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>
Content-Type: text/plain; charset="UTF-8"

Previously, a sender thread in mbox_send_message() could be woken up at
a wrong time in blocking mode. It is because there was only a single
completion for a channel whereas messages from multiple threads could be
sent in any order; since the shared completion could be signalled in any
order, it could wake up a wrong sender thread.

This commit resolves the false wake-up issue with the following changes:
- Completions are created as many as the number of concurrent sender
  threads
- A completion is created in a sender thread's stack
- Each slot of the message queue, i.e. `msg_data`, contains a pointer to
  its target completion
- tx_tick() signals the completion of the currently active slot of the
  message queue

Link: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswinder.singh@linaro.org
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 43 +++++++++++++++++++-----------
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h | 20 +++++++++-----
 3 files changed, 43 insertions(+), 22 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 5cd8ae222073..80cd310964a8 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -22,7 +22,7 @@
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
-static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
+static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete)
 {
 	int idx;
 
@@ -33,7 +33,8 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 		return -ENOBUFS;
 
 	idx = chan->msg_free;
-	chan->msg_data[idx] = mssg;
+	chan->msg_data[idx].data = mssg;
+	chan->msg_data[idx].tx_complete = tx_complete;
 	chan->msg_count++;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
@@ -51,7 +52,7 @@ static void msg_submit(struct mbox_chan *chan)
 	int err = -EBUSY;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req)
+		if (!chan->msg_count || chan->active_req >= 0)
 			break;
 
 		count = chan->msg_count;
@@ -61,14 +62,14 @@ static void msg_submit(struct mbox_chan *chan)
 		else
 			idx += MBOX_TX_QUEUE_LEN - count;
 
-		data = chan->msg_data[idx];
+		data = chan->msg_data[idx].data;
 
 		if (chan->cl->tx_prepare)
 			chan->cl->tx_prepare(chan->cl, data);
 		/* Try to submit a message to the MBOX controller */
 		err = chan->mbox->ops->send_data(chan, data);
 		if (!err) {
-			chan->active_req = data;
+			chan->active_req = idx;
 			chan->msg_count--;
 		}
 	}
@@ -82,11 +83,17 @@ static void msg_submit(struct mbox_chan *chan)
 
 static void tx_tick(struct mbox_chan *chan, int r)
 {
-	void *mssg;
+	int idx;
+	void *mssg = NULL;
+	struct completion *tx_complete = NULL;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		mssg = chan->active_req;
-		chan->active_req = NULL;
+		idx = chan->active_req;
+		if (idx >= 0) {
+			mssg = chan->msg_data[idx].data;
+			tx_complete = chan->msg_data[idx].tx_complete;
+			chan->active_req = -1;
+		}
 	}
 
 	/* Submit next message */
@@ -100,7 +107,7 @@ static void tx_tick(struct mbox_chan *chan, int r)
 		chan->cl->tx_done(chan->cl, mssg, r);
 
 	if (r != -ETIME && chan->cl->tx_block)
-		complete(&chan->tx_complete);
+		complete(tx_complete);
 }
 
 static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
@@ -113,7 +120,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req >= 0 && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -244,11 +251,18 @@ EXPORT_SYMBOL_GPL(mbox_client_peek_data);
 int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
+	struct completion tx_complete;
 
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
-	t = add_to_rbuf(chan, mssg);
+	if (chan->cl->tx_block) {
+		init_completion(&tx_complete);
+		t = add_to_rbuf(chan, mssg, &tx_complete);
+	} else {
+		t = add_to_rbuf(chan, mssg, NULL);
+	}
+
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
 		return t;
@@ -265,7 +279,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 		else
 			wait = msecs_to_jiffies(chan->cl->tx_tout);
 
-		ret = wait_for_completion_timeout(&chan->tx_complete, wait);
+		ret = wait_for_completion_timeout(&tx_complete, wait);
 		if (ret == 0) {
 			t = -ETIME;
 			tx_tick(chan, t);
@@ -318,9 +332,8 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
-		chan->active_req = NULL;
+		chan->active_req = -1;
 		chan->cl = cl;
-		init_completion(&chan->tx_complete);
 
 		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
 			chan->txdone_method = TXDONE_BY_ACK;
@@ -461,7 +474,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
-		chan->active_req = NULL;
+		chan->active_req = -1;
 		if (chan->txdone_method == TXDONE_BY_ACK)
 			chan->txdone_method = TXDONE_BY_POLL;
 	}
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..de7494ce0a9f 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -497,7 +497,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != NULL)
+			if (chan->active_req >= 0)
 				continue;
 
 			return 0;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index ad01c4082358..ae29fba3bc46 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -102,16 +102,25 @@ struct mbox_controller {
  */
 #define MBOX_TX_QUEUE_LEN	20
 
+/**
+ * struct mbox_message - Internal representation of a mailbox message
+ * @data:		Data packet
+ * @tx_complete:	Pointer to the transmission completion
+ */
+struct mbox_message {
+	void *data;
+	struct completion *tx_complete;
+};
+
 /**
  * struct mbox_chan - s/w representation of a communication chan
  * @mbox:		Pointer to the parent/provider of this channel
  * @txdone_method:	Way to detect TXDone chosen by the API
  * @cl:			Pointer to the current owner of this channel
- * @tx_complete:	Transmission completion
- * @active_req:		Currently active request hook
+ * @active_req:		Index of the currently active slot in the queue
  * @msg_count:		No. of mssg currently queued
  * @msg_free:		Index of next available mssg slot
- * @msg_data:		Hook for data packet
+ * @msg_data:		Queue of data packets
  * @lock:		Serialise access to the channel
  * @con_priv:		Hook for controller driver to attach private data
  */
@@ -119,10 +128,9 @@ struct mbox_chan {
 	struct mbox_controller *mbox;
 	unsigned txdone_method;
 	struct mbox_client *cl;
-	struct completion tx_complete;
-	void *active_req;
+	int active_req;
 	unsigned msg_count, msg_free;
-	void *msg_data[MBOX_TX_QUEUE_LEN];
+	struct mbox_message msg_data[MBOX_TX_QUEUE_LEN];
 	spinlock_t lock; /* Serialise access to the channel */
 	void *con_priv;
 };
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

