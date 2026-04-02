Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C8E3CBE6B
	for <linux-tegra@vger.kernel.org>; Thu,  2 Apr 2026 17:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775149673; cv=none; b=Tkyaa2zXPtHpGMNIRS1RiFmJjKK3ZjyR5jeUwgTCJE8gAUfqLFwGjhmirVk+M0LqytzLkHK8rvv0ix3xWDxTlkaGmNwIlIGdly4bAl8g56srU0zDyG7gkY87TtLQiAjy2jr8Filw37S13B8xliO2IpUKJY8PCvlWzFL6AlT6gTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775149673; c=relaxed/simple;
	bh=RX9yNp5j1OE/PaC+hIPLZ/izItPwEBkRp9rXwgexlsk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BenrlNCr5OENs1OgOCQ2gq/dEIUv19hQwYfJ/rDD55jxOCDLGxzanigyLZ3ZPxkk19Rk9p+Zs2GkrQTVSCWZlPw9uhjqrZEfgUAjH6iRruYq366WxFpBMLjxRsMfy3iU+zal/leJzPXLxqSWCyLkeLdPcxV6gaNehsO+uWJCJMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=REuD9243; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--joonwonkang.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="REuD9243"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c6e24ee93a6so1316822a12.0
        for <linux-tegra@vger.kernel.org>; Thu, 02 Apr 2026 10:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775149667; x=1775754467; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xtS1OkkhTmC+kJWduMT9+PxAc4KJJ2D34QZmfUPxalo=;
        b=REuD9243C1mcz2hU0ovnEFQt1Ye0+vC8eA9W2m7Tn8/z5W9zo6oQRPQdcAfmkaCkCJ
         Wmi7Tl5kRQr1Fkj1JDfgVNmJYoWjOdl+MwgveAxlq6saEvGao27pbx4sEApuZBbrK2pc
         36RtfJ10W7EusQlLIFw0fxk62uYiNEw3qEUx3SbGkB81l/KxoguSikkEDgKG0WqBgkcq
         qUF4/D0gL0iqQSJB4HhE5d5ryZBe6yUCiKl3FBoHqv8WyWy//h50m8qNmTi6krgUmd6k
         B/NbAwdHMKGf0CA5aBP7sQCY3w16tNeDgbO1Q+MQ0Vi9O63Y1HO+sx5vqjrhh7GcZUcK
         IbOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149667; x=1775754467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xtS1OkkhTmC+kJWduMT9+PxAc4KJJ2D34QZmfUPxalo=;
        b=l5xS+5yjOz09+lobM6ykNsj9Dk8VUmkr2KW78ACl4fvpziFo9hXZait+YQgXBY1rE6
         hVuKm+w424iA8D5MdJ2QJ7vPnqoJchaKsgZug7zvvUqAX0BIegpS02NCtgCNO6yu78gR
         liGS1Ye/s8Jt8x333DNUBHv/fs8hj1p1Q+t9+v606Kjcjyc/RuBaFJdeNpi7Sch3hSuG
         faAFfiHqvfuo/3EKzAEVrpyqc5j7NuXx4PXtyci5l/xFkbsWGo744B/EZxMT89H6U7mv
         PF62dP5QerFODhRnEH2meLkWoZqnHrCXGhrcCEooXXmo4HhclH6idTjbe2wpU3shECV2
         BQtA==
X-Forwarded-Encrypted: i=1; AJvYcCVfRAtmEHSYE/v3ULYJl+KR98kmosA+UxaxBZlKF7dQnQhtXcRXTtfTE+Kma7pHAd5VBAmOWr2+qqYcQQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzPULVI6Jv+MYfh/DCwE67XlXxHoweqAN+Wpiln2qisaO2bu2L
	2i1z7xWODuJtIJOCQBxN+eVp9bpg6BwBCQaIJRSNvTNodBs6E4fDj7gkgswEAyAtkIZVRgJxJcR
	1PKbTYUE4zpU9roqL2blRhzwfUw==
X-Received: from plse12.prod.google.com ([2002:a17:902:b78c:b0:2b0:537d:70cc])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:e850:b0:2b2:4f43:b49a with SMTP id d9443c01a7336-2b277e52d1dmr29085885ad.22.1775149666599;
 Thu, 02 Apr 2026 10:07:46 -0700 (PDT)
Date: Thu,  2 Apr 2026 17:06:41 +0000
In-Reply-To: <20260402170641.2082547-1-joonwonkang@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402170641.2082547-3-joonwonkang@google.com>
Subject: [PATCH v3 2/2] mailbox: Make mbox_send_message() return error code
 when tx fails
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

When the mailbox controller failed transmitting message, the error code
was only passed to the client's tx done handler and not to
mbox_send_message(). For this reason, the function could return a false
success. This commit resolves the issue by introducing the tx status and
checking it before mbox_send_message() returns.

Cc: stable@vger.kernel.org
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 20 +++++++++++++++-----
 include/linux/mailbox_controller.h |  2 ++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index d63386468982..ea9aec9dc947 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -21,7 +21,10 @@
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
-static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete)
+static int add_to_rbuf(struct mbox_chan *chan,
+		       void *mssg,
+		       struct completion *tx_complete,
+		       int *tx_status)
 {
 	int idx;
 
@@ -34,6 +37,7 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx
 	idx = chan->msg_free;
 	chan->msg_data[idx].data = mssg;
 	chan->msg_data[idx].tx_complete = tx_complete;
+	chan->msg_data[idx].tx_status = tx_status;
 	chan->msg_count++;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
@@ -91,12 +95,13 @@ static void msg_submit(struct mbox_chan *chan)
 
 static void tx_tick(struct mbox_chan *chan, int r, int idx)
 {
-	struct mbox_message mssg = {MBOX_NO_MSG, NULL};
+	struct mbox_message mssg = {MBOX_NO_MSG, NULL, NULL};
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		if (idx >= 0 && idx != chan->active_req) {
 			chan->msg_data[idx].data = MBOX_NO_MSG;
 			chan->msg_data[idx].tx_complete = NULL;
+			chan->msg_data[idx].tx_status = NULL;
 			return;
 		}
 
@@ -116,8 +121,10 @@ static void tx_tick(struct mbox_chan *chan, int r, int idx)
 	if (chan->cl->tx_done)
 		chan->cl->tx_done(chan->cl, mssg.data, r);
 
-	if (r != -ETIME && chan->cl->tx_block)
+	if (r != -ETIME && chan->cl->tx_block) {
+		*mssg.tx_status = r;
 		complete(mssg.tx_complete);
+	}
 }
 
 static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
@@ -286,15 +293,16 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	int t;
 	int idx;
 	struct completion tx_complete;
+	int tx_status = 0;
 
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	if (chan->cl->tx_block) {
 		init_completion(&tx_complete);
-		t = add_to_rbuf(chan, mssg, &tx_complete);
+		t = add_to_rbuf(chan, mssg, &tx_complete, &tx_status);
 	} else {
-		t = add_to_rbuf(chan, mssg, NULL);
+		t = add_to_rbuf(chan, mssg, NULL, NULL);
 	}
 
 	if (t < 0) {
@@ -318,6 +326,8 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 			idx = t;
 			t = -ETIME;
 			tx_tick(chan, t, idx);
+		} else if (tx_status < 0) {
+			t = tx_status;
 		}
 	}
 
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 912499ad08ed..890da97bcb50 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -117,10 +117,12 @@ struct mbox_controller {
  * struct mbox_message - Internal representation of a mailbox message
  * @data:		Data packet
  * @tx_complete:	Pointer to the transmission completion
+ * @tx_status:		Pointer to the transmission status
  */
 struct mbox_message {
 	void *data;
 	struct completion *tx_complete;
+	int *tx_status;
 };
 
 /**
-- 
2.53.0.1185.g05d4b7b318-goog

