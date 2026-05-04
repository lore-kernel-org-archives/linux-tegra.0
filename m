Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7D713A7F4D
	for <linux-tegra@vger.kernel.org>; Mon,  4 May 2026 16:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777912519; cv=none; b=ClUlN4jwfr3UbzMJqgrO3mchdm87E8Ff9guMpxILLogatwO8/46Qlir+LgDfRMwnoyivG+fzaHzd6wRXdr6C79srObxky6tRbXbdv0BucTzzaBQSHRml7xb0iZAO8tfvDmtU24FW4mPCUFClF1n5ZzddGsL9HhE8ZSdtEtUV8EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777912519; c=relaxed/simple;
	bh=RMF2wbDO7Cu7Ode2EIeZxKPPw0UUdDh35IH+0ozJRxE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O960MGhF8LBo8AxOpVFtqZmUyADvd8gR0yoHEkav+29wpuaOYOXJIlgC0FgqqgT7jpvCJqIdeV8GGnyJmuNsiBY8z5Ub0LloArcB+ANeGmq+dlZBVWA9gbn8pUg0DNTWmd99b3CpsOfP0X3aeBXKfk2Hio3wspGbSyY/Qo0UORI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C3oglvce; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C3oglvce"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1777912516;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IOVlEIey1KL6W7eekEzWzNHwKHVr2WijrrD98LUvP0s=;
	b=C3oglvcecBN0z7lwfDcPEamk1nvsAbTa3eogfp6jCIKEt7+OKjdggG/ozeWdcQY8MCOIoU
	ukq17md7M2Z4ZwYlIMR0xiRlCm+FVfznozKj/L/e2d51UnTLW46jJyMli65hQzwqHpqo9O
	aAjoZlKxSHbkNvNYnVAmL/fV5ewacMM=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-196-AE3on9EYNqKaeRjvsL30WQ-1; Mon,
 04 May 2026 12:35:12 -0400
X-MC-Unique: AE3on9EYNqKaeRjvsL30WQ-1
X-Mimecast-MFC-AGG-ID: AE3on9EYNqKaeRjvsL30WQ_1777912511
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D2061800578;
	Mon,  4 May 2026 16:35:11 +0000 (UTC)
Received: from llong-thinkpadp16vgen1.westford.csb (unknown [10.2.16.173])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 163731944CED;
	Mon,  4 May 2026 16:35:07 +0000 (UTC)
From: Waiman Long <longman@redhat.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	jberring@redhat.com,
	Waiman Long <longman@redhat.com>
Subject: [PATCH] firmware: tegra: bpmp: Make atomic_tx_lock a raw_spinlock
Date: Mon,  4 May 2026 12:34:48 -0400
Message-ID: <20260504163448.1063474-1-longman@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

The atomic_tx_lock was first introduced by commit 1abb081e41a7
("firmware: tegra: Simplify channel management") as a spinlock_t. It
is used only in tegra_bpmp_transfer_atomic() to ensure mutual exclusion.

Since the merging of PREEMPT_RT support into mainline Linux kernel
in v6.12, a spinlock becomes a sleeping lock when CONFIG_PREEMPT_RT
is enabled. As tegra_bpmp_transfer_atomic() is called with interrupt
disabled, acquiring a sleeping lock will lead to the following bug
report when booting up a PREEMPT_RT kernel on an tegra based arm64
system with Boot and Power Management Processor (BPMP).

  BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
  in_atomic(): 0, irqs_disabled(): 1, non_block: 0, pid: 1, name: swapper/0
  preempt_count: 0, expected: 0
  RCU nest depth: 0, expected: 0
  2 locks held by swapper/0/1:
   #0: ffff42bda2d5b0f0 (&dev->mutex){....}-{3:3}, at: __driver_attach+0x110/0x2c0
   #1: ffff42bda4da5138 (&bpmp->atomic_tx_lock){....}-{2:2}, at: tegra_bpmp_transfer_atomic+0x118/0x3c0

Fix it by changing the type of atomic_tx_lock in the tegra_bpmp structure
to raw_spinlock_t and use raw_spinlock APIs to access it.

Signed-off-by: Waiman Long <longman@redhat.com>
---
 drivers/firmware/tegra/bpmp.c | 8 ++++----
 include/soc/tegra/bpmp.h      | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index 753472b53bd8..1a82ce7d340d 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -365,16 +365,16 @@ int tegra_bpmp_transfer_atomic(struct tegra_bpmp *bpmp,
 
 	channel = bpmp->tx_channel;
 
-	spin_lock(&bpmp->atomic_tx_lock);
+	raw_spin_lock(&bpmp->atomic_tx_lock);
 
 	err = tegra_bpmp_channel_write(channel, msg->mrq, MSG_ACK,
 				       msg->tx.data, msg->tx.size);
 	if (err < 0) {
-		spin_unlock(&bpmp->atomic_tx_lock);
+		raw_spin_unlock(&bpmp->atomic_tx_lock);
 		return err;
 	}
 
-	spin_unlock(&bpmp->atomic_tx_lock);
+	raw_spin_unlock(&bpmp->atomic_tx_lock);
 
 	err = tegra_bpmp_ring_doorbell(bpmp);
 	if (err < 0)
@@ -763,7 +763,7 @@ static int tegra_bpmp_probe(struct platform_device *pdev)
 	if (!bpmp->threaded.busy)
 		return -ENOMEM;
 
-	spin_lock_init(&bpmp->atomic_tx_lock);
+	raw_spin_lock_init(&bpmp->atomic_tx_lock);
 	bpmp->tx_channel = devm_kzalloc(&pdev->dev, sizeof(*bpmp->tx_channel),
 					GFP_KERNEL);
 	if (!bpmp->tx_channel)
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index a33582590a3b..fdd8739715dc 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -79,7 +79,7 @@ struct tegra_bpmp {
 		struct mbox_chan *channel;
 	} mbox;
 
-	spinlock_t atomic_tx_lock;
+	raw_spinlock_t atomic_tx_lock;
 	struct tegra_bpmp_channel *tx_channel, *rx_channel, *threaded_channels;
 
 	struct {
-- 
2.53.0

