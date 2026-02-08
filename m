Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C921A92F
	for <linux-tegra@vger.kernel.org>; Sun,  8 Feb 2026 04:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770523447; cv=none; b=H7+VPnRoTtgRz4d33MtvAzSkJEoT+kMvRj7mkj9S5bKG73y9BUe4f/XATCJyL8puKgid1n8X6voQ/1gB0OIPcu0oWB6NVa+rfGxq2pV0XUs6YHkDW2pKyg48Vjy+Mno9c7gii+i5hfaQWPc1h6y1s61Yg/IHFzMcJchQnndbXy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770523447; c=relaxed/simple;
	bh=6sWk+ZD5EZZpFdZwa80I6qB0RSa/sFczAV6WHYqa1ag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WywVnjWhLoHE2AKd2nF98CK+0MmrJH8N2PW+bEy8i8EDgO4O4Al4NMG7oLcN6QhZPtpGrDytbtSUx/hOu5/AR0zybQauxKIwq6mM1cP7Swj9qP++3WF3XV/3FJvbS04W4v/jexyXiGVvlnBD5iQgZmYpDTYFbELs1BIXEP6OGDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ltDvnGtR; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ltDvnGtR"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12460a7caa2so2239956c88.1
        for <linux-tegra@vger.kernel.org>; Sat, 07 Feb 2026 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523447; x=1771128247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U37aKUtc6RlOePvT1hsucle0pebLyklaSQDosLHQp6Q=;
        b=ltDvnGtRcGf5B+cxKtuAB/QHl4Pk1JDGGi39lkhneTUggKtjbehjd67CXEPog5qFTE
         0X5avq3gXUJrUfruBap9PA9l7xrLb52SeRq+/CcBMhH0g0oy/+xdg6LkMennMGeiwURj
         xULNrRZOzztcJw38ljmhCY1NzTxlfYHTencZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523447; x=1771128247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U37aKUtc6RlOePvT1hsucle0pebLyklaSQDosLHQp6Q=;
        b=LvJZ11+N+JqnDYL7W0znDam9XQP79FzQrrLrwoMEsC5m1ll1wywXesKpjleG/AMLMw
         s6F2t/X0XVXNW1fYP0Db9OgfNPGCm8CYPCQpCkDCrR1fFCc/CvTro3v87dGh6WeAWXba
         U5FZ9OUGswANGK4dcaLtJf1mIbeZP0fEwiWFtnuR2GBhutu8cEtrK1k49mOFtbWepmIG
         GvKm4taMSy4SyLtnTpp+G4Q3sBA6ntc+bH9bgkSfcxiNZ3kDJQKQg4//FK3V7/NjcHUN
         BYLR7ncGc/lU73OUcZ5iCS55za+z7uVovOwIdlWQ3L5joXYU7O9nWo/G9yD9KGojZEi3
         mPUw==
X-Forwarded-Encrypted: i=1; AJvYcCW9UFUopOOiGDW3dvFPVNFqVP//Uu2E5PZ0aXzauufEVofO1f1JZ2dUxVPXmnTCrrrPh7tSao13H4lMgw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwF3QyhOyX9DKm9MXkW9ElNzRXifbH8KLlwcEGvPDp6B71b0RO6
	IhWPdMCDMZNMtYLtNzNHgUxGUHsg4hMP4NGXTrGVKvLkUynaZd24O0/qnbLVtbZ5RW5zGrKCzwa
	uUeA=
X-Gm-Gg: AZuq6aKgc9dEOVxx/JnQdIF6oRwL/MBbNoalS9l6/cdSH0RqTQY8xtEa93jumWaJBGh
	BZjluEtiFSxJE8l5WXiWvKdpS10RqsTUq1p62iofPBhshawJ0ZpvgCyY2zXPUzZ00rAWs3/Mo0y
	4xQHpcBRVEYGr7XeNA7at9faUEZVQ3PsWlKMoUKe2FEwkYyLAkNg9BzFyh186iPSG64FQF1Zdzr
	hI4f+hdO68QeiZElT3ZcBUVTsjqPIMQfvoZI06A1OYRiK1/QqsrFmuzTmzf/2dUOae9hvzldA1h
	tUjCbFMU8svSg6+Q4+EIgHwNxhl0ci7X8JL6VQ0iFc/gXhSfdxFMo7UeAn6dkqFmuI7KIMf8HHQ
	IDmr37Rh+rLJVshrJ8JbJ6ceB4nWQ9jH66SOUYG9+kut/spK8UA4Y/fNsXn3tOplu3sebo2Rxmh
	FyYXvz5wHvgzhSZVZEiTwCrI4tKREmmaTnQsNKBfIXDOXPTBORJfLkrM8szyNAy3VO4jLfnOo=
X-Received: by 2002:a05:7022:250e:b0:11a:2f10:fa46 with SMTP id a92af1059eb24-12703e569femr3754647c88.0.1770523446753;
        Sat, 07 Feb 2026 20:04:06 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:03 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	shawn.guo@linaro.org,
	ssantosh@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
Date: Sat,  7 Feb 2026 20:01:23 -0800
Message-ID: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The way the mailbox core behaves when you pass a NULL `mssg` parameter
to mbox_send_message() is a little questionable. Specifically, the
mailbox core stores the currently active message directly in its
`active_req` field. In at least two places it decides that if this
field is `NULL` then there is no active request. That means if `mssg`
is ever NULL it will cause the mailbox core to think is no active
request. The two places where it does this are:

1. When a client calls mbox_send_message(), if `active_req` is NULL
   then it will call the mailbox controller to send the new message
   even if the mailbox controller hasn't yet called mbox_chan_txdone()
   on the previous (NULL) message.
2. The mailbox core will never call the client's `tx_done()` callback
   with a NULL message because `tx_tick()` returns early whenever the
   message is NULL.

Though the above doesn't look like it was a conscious design choice,
it does have the benefit of providing a simple way to assert an
edge-triggered interrupt to the remote processor on the other side of
the mailbox. Specifically:

1. Like a normal edge-triggered interrupt, if multiple edges arrive
   before the interrupt is Acked they are coalesced.
2. Like a normal edge-triggered interrupt, as long as the receiver
   (the remote processor in this case) "Ack"s the interrupt _before_
   checking for work and the sender (the mailbox client in this case)
   posts the interrupt _after_ adding new work then we can always be
   certain that new work will be noticed. This assumes that the
   mailbox client and remote processor have some out-of-band way to
   communicate work and the mailbox is just being used as an
   interrupt.

Doing a `git grep -A1 mbox_send_message | grep NULL` shows 14 hits in
mainline today, but it's not 100% clear if all of those users are
relying on the benefits/quirks of the existing behavior.

Since the current NULL `mssg` behavior is a bit questionable but has
some benefits, let's:

1. Deprecate the NULL behavior and print a warning.
2. Add a new mbox_ring_doorbell() function that is very similar to the
   existing NULL `mssg` case but a tad bit cleaner.

The design of the new mbox_ring_doorbell() will be to maximize
compatibility with the old NULL `mssg` behavior. Specifically:

* We'll still pass NULL to the mailbox controller to indicate a
  doorbell.
* Doorbells will not be queued and won't have txdone.
* We'll call immediately into the mailbox controller when a doorbell
  is posted.

With the above, any mailbox clients that don't mix doorbells and
normal messages are intended to see no change in behavior when
switching to the new API. Using the new API, which officiall documents
that mbox_client_txdone() shouldn't be called for doorbells, does
allow us to remove those calls.

There are two differences in behavior between the old sending a NULL
message and the new mbox_ring_doorbell():

1. If the mailbox controller returned an error when trying to send a
   NULL message, the old NULL message could have ended up being queued
   up in the core's FIFO. Now we will just return the error.
2. If a client rings a doorbell while a non-doorbell message is in
   progress, previously NULL messages would have been "queued" in that
   case and now doorbells will be immediately posted.

I'm hoping that nobody was relying on either of the two differences.
In general holding NULL messages in the mailbox core's queue has odd
behavior and is hard to reason about. Hopefully it's reasonable to
assume nobody was doing this.

As mentioned above, it should be noted that it's now documented that
"txdone" shouldn't be called (by both mailbox drivers and clients) for
doorbells. That being said, in most cases it won't hurt since the
mailbox core will ignore the bogus "txdone". The only case where it's
critical for a mailbox controller not to call "txdone" for a doorbell
is when a mailbox channel mixes normal messages and doorbells and
cares about the txdone callback. Specifically, when you ring a
doorbell and immediately send a normal message, if the controller
calls "txdone" for the doorbell it could look as if the normal message
finished before it should have. This issue also would have happened
with the old NULL `mssg`, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Instead of just documenting NULL, introduce a new function

 drivers/mailbox/mailbox.c          | 82 +++++++++++++++++++++++++++++-
 include/linux/mailbox_client.h     |  1 +
 include/linux/mailbox_controller.h |  4 +-
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..c1e7f6b1fe72 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -161,6 +161,9 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  * The controller that has IRQ for TX ACK calls this atomic API
  * to tick the TX state machine. It works only if txdone_irq
  * is set by the controller.
+ *
+ * Should not be called for "doorbell" messages (any time the message
+ * sent was NULL).
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
@@ -182,6 +185,9 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  * The client/protocol had received some 'ACK' packet and it notifies
  * the API that the last packet was sent successfully. This only works
  * if the controller can't sense TX-Done.
+ *
+ * Should not be called for "doorbell" messages (any time the message
+ * sent was NULL).
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
@@ -222,7 +228,7 @@ EXPORT_SYMBOL_GPL(mbox_client_peek_data);
  * mbox_send_message -	For client to submit a message to be
  *				sent to the remote.
  * @chan: Mailbox channel assigned to this client.
- * @mssg: Client specific message typecasted.
+ * @mssg: Client specific message typecasted. Should not be NULL.
  *
  * For client to submit data to the controller destined for a remote
  * processor. If the client had set 'tx_block', the call will return
@@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
+	/*
+	 * The mailbox core gets confused when mbox_send_message() is called
+	 * with NULL messages since the code directly stores messages in
+	 * `active_req` and assumes that a NULL `active_req` means no request
+	 * is active. This causes the core to call the mailbox controller a
+	 * second time even if the previous message hasn't finished and also
+	 * means the client's tx_done() callback will never be called. However,
+	 * clients historically passed NULL anyway. Deprecate passing NULL
+	 * here by adding a warning.
+	 *
+	 * Clients who don't have a message should switch to using
+	 * mbox_ring_doorbell(), which explicitly documents the immediate
+	 * sending of doorbells, the lack of txdone, and what happens if you
+	 * mix doorbells and normal messages.
+	 *
+	 * TODO: when it's certain that all clients have transitioned, consider
+	 * changing this to return -EINVAL.
+	 */
+	if (!mssg)
+		dev_warn_once(chan->mbox->dev,
+			      "NULL mailbox messages are deprecated\n");
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -277,6 +305,58 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_ring_doorbell - Client function to ring the doorbell with no message.
+ * @chan: Mailbox channel assigned to this client.
+ *
+ * Send a notification to the remote side of the mailbox but don't actually
+ * send any data. This is typically used when the client and the remote side
+ * of the mailbox have some other (non-mailbox) way to communicate and the
+ * mailbox is simply used as an "interrupt" to notify the remote side.
+ *
+ * This function has a few important differences from mbox_send_message():
+ * - There is no concept of "txdone" for mbox_ring_doorbell(), even if the
+ *   controller itself would be able to tell when the remote CPU saw or Acked
+ *   the doorbell.
+ * - Because there is no concept of "txdone", there is no need to wait for
+ *   previous doorbells to "finish" before notifying the controller of another
+ *   doorbell.
+ * - Because we never wait to notify a controller of a doorbell, there is no
+ *   queue for doorbells.
+ *
+ * The above properties mean that calling mbox_ring_doorbell() is the equivalent
+ * of re-asserting an edge triggered interrupt to the remote side. If the remote
+ * side hasn't yet "cleared" the interrupt this is a no-op. If the remote side
+ * has cleared the interrupt, it will be re-asserted. Expected usage:
+ *
+ * This CPU:
+ * - Update out-of-band (OOB) memory shared between this CPU and remote CPU.
+ * - Ring doorbell.
+ * Remote CPU:
+ * - Clear doorbell.
+ * - Read OOB shared memory and act on it.
+ *
+ * The remote CPU will always be guaranteed to notice changes, even if this CPU
+ * updates / rings multiple times before the remote CPU has a chance to run.
+ *
+ * Mixing calls of mbox_ring_doorbell() and mbox_send_message() on the same
+ * mailbox channel is allowed, assuming the mailbox controller correctly avoids
+ * calling mbox_chan_txdone() for doorbells.
+ *
+ * NOTE: For compatibility reasons, doorbells are sent to the mailbox
+ *	 controller driver by passing NULL to the mailbox controller's
+ *	 send_data() callback.
+ *
+ * Return: Negative error code upon failure.
+ */
+int mbox_ring_doorbell(struct mbox_chan *chan)
+{
+	guard(spinlock_irqsave)(&chan->lock);
+
+	return chan->mbox->ops->send_data(chan, NULL);
+}
+EXPORT_SYMBOL_GPL(mbox_ring_doorbell);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..e3fc11e42c58 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -42,6 +42,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_ring_doorbell(struct mbox_chan *chan);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 80a427c7ca29..36648fa7b6f3 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -19,7 +19,9 @@ struct mbox_chan;
  *		if the remote hasn't yet read the last data sent. Actual
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
- *		sleep.
+ *		sleep. Will be passed NULL data for doorbell-only messages.
+ *		Note that doorbell messages are always sent immediately with
+ *		no queuing. mbox_chan_txdone() shouldn't be called on doorbells.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
-- 
2.53.0.rc2.204.g2597b5adb4-goog

