Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751CB325494
	for <linux-tegra@vger.kernel.org>; Thu,  7 May 2026 05:51:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778133102; cv=none; b=QELeKysygAVY5iDzlpxybjLWzDVyp+SkW60RG+GqRYvqj+MAm5z8a82YOjT5boLfWUzHL9RICDzP5USWK5V7zp4+2N3YGDY+tX+7vVIs6vWeDnmD3jqfC528iK0QLnUtk2reec8oMJgrpyOmWCHE+D40cGiSHGqVUd3IQ3hPLpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778133102; c=relaxed/simple;
	bh=jspcJ+XGVtmcJoLA2b6dVBoyp7lmH5gwX62B+Q0P7Ig=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nzASfzZ2zSNuCz/tWmXbhDxDB7Zcvgits5H0oCzaBAB3M2i41eelaE/EGDaOX0CN/A5u5BIy14PY5i9LINulos9DSf4S8KITic5YkZwyfDRqhCF5+rQW9wBDZvUPLIwjnLKHFjaDJtagCXlybuBFHfc32R7r+G5X7Notvg/CLTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IV2xAIQX; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IV2xAIQX"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c798fc1a426so305266a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 06 May 2026 22:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778133101; x=1778737901; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MYuyuGpque6//gGJu9ipQm1QDza51zuHMLqXnZVgYuA=;
        b=IV2xAIQXEwbVcrLP69/o8tKAYXAXrlsLiNkjmDlX0Q+PRAJhCYvFv2i8kOGneA7H+J
         Kh4BdujkBEXd9DDFSIxQ3rLAnE9qYkOUN+AkO6EwQoh+v2J8gRpJL8PvbxtNX0tlfGW4
         Bch0DpJ81U4A99MM07xN6g3s9K59RoL42g/WobM7GCB049nIhUN1c2OSdhnVBjTHHCxA
         xc66EF9VkFeF2ztjbIB7EuCuMFf2q0RpsdvUaMnx1TzBFqy2o00rtHkI5RKwSUp0b96i
         jpWIq7jGb6T3Mne77JX7gOjdln6gHf8bWZNMPub0hewvKNnA918+7S4uU/dVPmikIZaJ
         McMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778133101; x=1778737901;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYuyuGpque6//gGJu9ipQm1QDza51zuHMLqXnZVgYuA=;
        b=RCXJz3D9QzIOTb9VtsU12PFMIt5OvFXP1MHb5pSaAQUm9hdUz2RZZv31QuH+dKXcSx
         JFzlXrmjW4LORPxQJ6h9zWkYlqz+TmAknrrNxjNb4V+md7rW6OkrdMLXhT86SmMVJMsq
         QcrjMD/gqgEuL4UlwOe1XdICflkLpxMCfHYr9RcBFKhvznfyeIph7BZIfbnsK/P1dyQw
         LUILC3W8D3wh3J0rEH3k0HXkuz1vPFP4+A7xH0NiMoCw0+OQxmGNZcL0Epxh6+0EWvk8
         R288PIigCSpFbBQknDwBFbIg9EhpCJLNU9HM4/SVKzuGDErjU0XfQiSm0GmBRiJplwH4
         lHtQ==
X-Forwarded-Encrypted: i=1; AFNElJ+njHonPJu/3Sock0+I7jlLdwGVHc0KsrbRX/QgRA+ogE4UELx5xnZ/sVOVWfYSGQC9H9kDoNdPTSey2g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUyKR+s1BrACQFVZtPEZSwDFqX3IGINzo5at1cRxGjLkhiPXSS
	emYuJ6aF0akRvG1A0LQR2ve2N8WIf4VKWngc5Z7cuJ/or+AtveVXMmdXtgGOKfyWAHMn8H211fj
	Rkj3n/HHKdLrH1hFvtZ+w2UOr0g==
X-Received: from pgbbj25.prod.google.com ([2002:a05:6a02:199:b0:c7b:b2bd:6cb])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:94c7:b0:39c:14b3:6234 with SMTP id adf61e73a8af0-3aa5a86e53dmr6933824637.15.1778133100373;
 Wed, 06 May 2026 22:51:40 -0700 (PDT)
Date: Thu,  7 May 2026 05:51:17 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260507055117.2466957-1-joonwonkang@google.com>
Subject: [PATCH 6.12.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: stable@vger.kernel.org, jassisinghbrar@gmail.com
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	joonwonkang@google.com, Douglas Anderson <dianders@chromium.org>
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
index d3d26a2c9895..aee552a2fbc7 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -60,7 +60,7 @@ static void msg_submit(struct mbox_chan *chan)
 
 	spin_lock_irqsave(&chan->lock, flags);
 
-	if (!chan->msg_count || chan->active_req)
+	if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
 		goto exit;
 
 	count = chan->msg_count;
@@ -98,13 +98,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
 
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
@@ -126,7 +126,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -258,7 +258,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 
-	if (!chan || !chan->cl)
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	t = add_to_rbuf(chan, mssg);
@@ -332,7 +332,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->msg_free = 0;
 	chan->msg_count = 0;
-	chan->active_req = NULL;
+	chan->active_req = MBOX_NO_MSG;
 	chan->cl = cl;
 	init_completion(&chan->tx_complete);
 
@@ -485,7 +485,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	spin_lock_irqsave(&chan->lock, flags);
 	chan->cl = NULL;
-	chan->active_req = NULL;
+	chan->active_req = MBOX_NO_MSG;
 	if (chan->txdone_method == TXDONE_BY_ACK)
 		chan->txdone_method = TXDONE_BY_POLL;
 
@@ -545,6 +545,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 19ef56cbcfd3..7a422d563948 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -487,7 +487,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != NULL)
+			if (chan->active_req != MBOX_NO_MSG)
 				continue;
 
 			return 0;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 6fee33cb52f5..fa5020262dda 100644
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

