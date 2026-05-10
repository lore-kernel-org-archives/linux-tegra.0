Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2BCA248886
	for <linux-tegra@vger.kernel.org>; Sun, 10 May 2026 05:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778392697; cv=none; b=pnz+lxh0n9GVxxbvnAGOtoAZBh+WfO6WmJTKFQnNhojLPYznXI6GSeH2RYceTViX3r+9aH/cRTBCSTfNUtgMA399U1Aux//Koh4E/aqAnfo7orpjUaIME26sCMSAv3qdKSrqJ1T3e4GUnVoW5vG6ufP0VR40ICpXENJQzQr4Ro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778392697; c=relaxed/simple;
	bh=Lq/ueWM/AB4IC60AiiI03UXnPNsQQSOHqsWz+/zeDCk=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SFSC9RtCOX7lfz0as7ZwjPUisk5Q/ulYSCnqst8bKr6RcpKCoXBInIyxf8X4UDPZXD6J1VIBzqz3lw4jWSS7N50wJbNdAXWzsiBD2SfSO5ckvKgEQPnLWcl7brpTbZA5Ahl0W1x8+fKBuXsZ95+pomCWNV+IvDPMEUkxJSb4UY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=uNAsrMIt; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="uNAsrMIt"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2b4530a90fdso82540735ad.1
        for <linux-tegra@vger.kernel.org>; Sat, 09 May 2026 22:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778392694; x=1778997494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=02FEpfqnOksLNZlovsl9fXdj4f/QI9yL1mFs8SDMyuE=;
        b=uNAsrMItE9LOZuwEj+dkz6cngPwtSWSFMLr1+LRaB8psp5H0oSHb0z6ul96rvBFPGP
         TStMjVt+009jlkw6VKZXKyDfNh1YHQXJ1laMcNTbINdsmWgz7vUBohjaKnHReMPv7mdP
         17Imi9jpIuYUejB3Ni4NM/haZrZgyrPvdgoOjkMourObk5aUt8Vxj/t5Ps4CBC5kZQHM
         jypWiEl1AZGhn9dS6JvPH1M7m41ytdwhD+dnkKSXcRQ3U0aBXhdd6GyamjNcNfifSYxH
         zLcaAVAHAOaqhBQQucCL7VAxIeEIJCZy1QR2zU3dd9af7k4X776HKfutwUIDZ+SGKBM3
         soRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778392694; x=1778997494;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=02FEpfqnOksLNZlovsl9fXdj4f/QI9yL1mFs8SDMyuE=;
        b=gLB5x5M6cYPW/ND2d3pE6uaHeaa1nGT6zDF/cAMsXn7WPdYdsByIRyIbkob4Sdacl9
         1NO0LKk4LyjDPsxsOZRa5Rzs+NpgqXBNhMmM/kIfuqCaXwvNQpm5qiq+zjx2JKmCChss
         l6mWRwkhZXJCKJFWFlzanYe2wF7GcFQHrcRE7wvf66C9/kdMC8cvsppQowThvARZragb
         fSMCcT0LXiSIhziZuzzlmEj3orcTLCjmbf6Y2LzmWd5q4TNKAcyF2D/0SBRX41GV66Vg
         tE7pgbgY5MNC8cuL4n7iVE9nrtkAZwMkZkOcWDubx0uTFTYGMGLZ4afuAZ9o7HGiJuUj
         HyWw==
X-Forwarded-Encrypted: i=1; AFNElJ8iA8scABkx2j5gAmqH1C95dneT4Hrn0XOMjTbXJhWlLsw5Q3S8DiUISYjp25H3uR9tQb+Pab3oxQlV+g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxTBx0sW+FG5fA0b9aosfom6r8+1YAXMZZg9Rc1V6z1irPXgME0
	oH+TjLCfqR05xjOSstPJF39eZ6GRDvvy5KZjEmr605zb8bfGTHeC5atIlIHmD/KXsvw19wtP0en
	drRl+3DgrXjHBG0Yea4LtP/QBbA==
X-Received: from plhn9.prod.google.com ([2002:a17:903:1109:b0:2b7:b346:a2c7])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:3dc8:b0:2ba:4ad9:70f6 with SMTP id d9443c01a7336-2ba7a32346dmr157161015ad.31.1778392694015;
 Sat, 09 May 2026 22:58:14 -0700 (PDT)
Date: Sun, 10 May 2026 05:58:10 +0000
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260510055810.796976-1-joonwonkang@google.com>
Subject: [PATCH v2 v6.18.y] mailbox: Fix NULL message support in mbox_send_message()
From: Joonwon Kang <joonwonkang@google.com>
To: sashal@kernel.org, stable@vger.kernel.org, jassisinghbrar@gmail.com
Cc: sudeep.holla@arm.com, thierry.reding@gmail.com, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-tegra@vger.kernel.org, joonwonkang@google.com, dianders@chromium.org
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
v2: Remove the obsolete change for drivers/mailbox/pcc.c.
v1: Add the MBOX_NO_MSG check to drivers/mailbox/pcc.c.

 drivers/mailbox/mailbox.c          | 15 ++++++++-------
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h |  3 +++
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 617ba505691d..9622369cab66 100644
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
@@ -532,6 +532,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
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
2.54.0.563.g4f69b47b94-goog

