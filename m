Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A541C1C84BC
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 06:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778134874; cv=none; b=Ne5qDMaMksiHRUOC2auHm+Xs6OhZ5KlpXmYBtlf0gZ9z8N9cPY5kfm9H5Efrsmql6dYGEsdpnHv0v3VkHsEUrKH1Qay9cBC8/K85AZw8FiEKBu7KxLSu631kKrM7in5urI0tP4XJXgXWd/Pr5KVdetBJOL+7ytkstmWNbA4mRL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778134874; c=relaxed/simple;
	bh=nIMuiDJkpQ3BU6BGPdUauhUu7GUK4la7iQqiFfw2fPU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=t55QOo1MLa4TLvTHxT1PwQkVUrsnQyugf5vgnhCIC6tksTYmN00YpBkdFAHsMmPe/t67przKpsyYwf4zYT6iYE7ZLRGckI07M9sLz2y+aA+N1oVwakNOoqICT5dyVzlhyehzY9OkoOzwav8Z/TFEf/DbCgTloff9+RfUexcHIlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rY1R4oBO; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rY1R4oBO"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-35842aa350fso1038503a91.0
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 23:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778134871; x=1778739671; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=PtSXoOfzhrlxxFOxnnDsYGazc/78nZXxdsW0qIp9Udg=;
        b=rY1R4oBO+LhJmfN4+hic2k7tkqmhs9TjaG1fIez9CPtDT5arSicEaQL/Z3pwhUN09c
         sHhwZj9cvSjgOQeuDvDinfx5lZpUhSUHaAcvDUodiQfkeBqsdbby/g1L9Me2k25BhYxc
         9FITvUHk7ZdU3DJYPx2HjNA+Ifn4ETrKhmvFjYcn7CN6GjDxLvC6yH2cXTufEGLw304O
         P6vSpGw6LmmM4xpKV/N2VWbkfflCa+ecCZv9T7gQ7Ksra8HE2KEQQfKVFD1aQ4nzs+tm
         W9uBNEJR+5gHqf6ZMVF7AlZ46DWOBg3Qm1QPb+PMlBY3m829tq17F0ul0J6AKDBiP8r5
         b9Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778134871; x=1778739671;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PtSXoOfzhrlxxFOxnnDsYGazc/78nZXxdsW0qIp9Udg=;
        b=Y7bZIEDnOW9afHOyWpWteQE4utan1F/RukkvDnBVBN/Xwu13hzGetCQC9t8jGilf2A
         wpaQV9ZYJdOPIk7pzjfOjs0ZQCeqa6//troVw+mpn8bADzahrqojUfH0ER+/JtKFUx17
         hebZTMohUJEP44qext8qsqC74j7rFMEUFyaC6IkMGpyE3sRf8ExBR+ExPvHMfk835hVB
         xY7r04JpKqIAi6w8SIGQpXOQ3aTwSo/NWIjhZtxmDZsgMy1XoQKLvlmVpn7iRo3G6xcO
         J4FNyxvxnnfaiCG5bTsPsrjyE3rzRlfCtMiTz51bTe2b+SF/ERaJ0c8sSRbJzYsXOnqd
         fjDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9sWaLBu4f2arqHndjALTI1/XsWrH3EWyMzYo07zlmttAw6fWnJjOdy1KjVo+NqTnWUj5g4dTtL/5SHOA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLAshbqlw0ghJCUM9kcTXOHEXJTiWHjTQLw/SQf0kazD3gTr4I
	aJlPPn5dl5W0My3nNIsJNvCCfHClTSA5WRtYt9u8okDcjW7wK6IHK+oLY9tcOR+fHlA1ITwJqlZ
	z8h21x+lYkGCeVlHfXaCZZZNlhg==
X-Received: from pga2.prod.google.com ([2002:a05:6a02:4f82:b0:c0e:ddf5:1299])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:9987:b0:3a2:f402:50f6 with SMTP id adf61e73a8af0-3aa5aafa96cmr7306979637.31.1778134870844;
 Wed, 06 May 2026 23:21:10 -0700 (PDT)
Date: Thu,  7 May 2026 06:21:07 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260507062107.2927600-1-joonwonkang@google.com>
Subject: [PATCH 6.18.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: stable@vger.kernel.org, jassisinghbrar@gmail.com
Cc: sudeep.holla@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-tegra@vger.kernel.org, joonwonkang@google.com, 
	Douglas Anderson <dianders@chromium.org>
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
[ add the MBOX_NO_MSG check to drivers/mailbox/pcc.c. ]
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 15 ++++++++-------
 drivers/mailbox/pcc.c              |  2 +-
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h |  3 +++
 4 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..caa98e38ce04 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -52,7 +52,7 @@ static void msg_submit(struct mbox_chan *chan)
 	int err = -EBUSY;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req)
+		if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
 			break;
 
 		count = chan->msg_count;
@@ -87,13 +87,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		mssg = chan->active_req;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 	}
 
 	/* Submit next message */
 	msg_submit(chan);
 
-	if (!mssg)
+	if (mssg == MBOX_NO_MSG)
 		return;
 
 	/* Notify the client */
@@ -114,7 +114,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -246,7 +246,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 
-	if (!chan || !chan->cl)
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	t = add_to_rbuf(chan, mssg);
@@ -319,7 +319,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
 
@@ -477,7 +477,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		if (chan->txdone_method == TXDONE_BY_ACK)
 			chan->txdone_method = TXDONE_BY_POLL;
 	}
@@ -534,6 +534,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
index ff292b9e0be9..7a2baeca2ba4 100644
--- a/drivers/mailbox/pcc.c
+++ b/drivers/mailbox/pcc.c
@@ -361,7 +361,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
 	if (pchan->chan.rx_alloc)
 		handle = write_response(pchan);
 
-	if (chan->active_req) {
+	if (chan->active_req != MBOX_NO_MSG) {
 		pcc_header = chan->active_req;
 		if (pcc_header->flags & PCC_CMD_COMPLETION_NOTIFY)
 			mbox_chan_txdone(chan, 0);
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..7991e8dba579 100644
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
index 80a427c7ca29..1db0069c27c5 100644
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
2.54.0.545.g6539524ca2-goog

