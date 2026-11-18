Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010001;
	b=sVbXGFc/nOGVN04eOO1+wktj2afE3kUIPNUh+yqOrbjH5lPlYEU7Zy5UnKVrDrTx8Z9m
	 iSEH2qCkmfEI1UzQlJRuxf5eLeQ/UBG13BhZVUJEk4bkw6AxLqv5HPPw+zyq/wvDEmta0
	 lXDA+p1BiNxQ10Eq9rGaVAAGhjupSnVjw9uR3wSuHmmkKJYHzRoB3snKji9jmNNhg1b5K
	 TdEejVmUngEdoKSDZihW2j1yKqZHxFGyzniAnPasAw9BwjROTS9ABvSm/XTHdicDPb1A5
	 mjT+E4Va+DehTGxR2pXJE/osi5EdzH5fsktN2Ll6aMisZP18xhXWQ+WQVBqZdUS8mUw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010001;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-CM-TRANSID:X-Coremail-Antispam:X-Originating-IP:X-CM-SenderInfo;
	bh=NLeu6B84TB3cba6KWMiNe9d0rCfS3RkNAZ9oG5NH2D4=;
	b=eWyQ3DpjtaNAWdh0fSojv3yKZcH4DiH9h3kUy8851cTD+j49fQA5Ax4DMw1tHcNnAVi8
	 bhfGHgaQU3rgNnTSzura66H9HEYUzEtRLQNOANI35oeqQiF3rA8X3zL8XcrNyk4mBueiK
	 wdYQzezhXZPbI4bWyzj+Ur7VipavVr0inOQr5GaXVV1IS5A1z9TnAqtERr3XONY6s34Is
	 EMCWCLoMxgkRvAe9nhYnr4G9IPCik/bDA7TkOQISP+w6z4bDGJQ2GBKv5aKI0Wo/GtGxi
	 9EWZ+epXEIMEMvhOUBcW96lAEnwx4XN3YYViQjbZRItBXMFq5kp7zFkyKuG8zjV0VDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=b+InCj1k;
	arc=none smtp.remote-ip=117.135.210.3
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1A82606A31C;
	Wed, 18 Nov 2026 13:53:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1A82606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=b+InCj1k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=NL
	eu6B84TB3cba6KWMiNe9d0rCfS3RkNAZ9oG5NH2D4=; b=b+InCj1kq1glkgtETQ
	deHvCrkodl+W+e8CfkCjqfSR4qeKpa825YdhbiUYv8m0qmEcYCuOqm8tQrZXZjJy
	/zhme7egAhNfi659q0w9FWIvwOunW56MmIbqpEQpep/NbtINW59TQyGpHUpJ0aU8
	UrBEKuesCooZOJXuEA5pr4djw=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgAnJTy6rf1qx_EVGw--.1930S2;
	Wed, 18 Nov 2026 21:53:00 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	kees+treewide@kernel.org,
	pdeschrijver@nvidia.com
Cc: linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>
Subject: [PATCH] firmware: tegra: bpmp: Free SRAM on channel initialization failure
Date: Wed, 18 Nov 2026 21:52:58 +0800
Message-Id: <20261118135258.2368093-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PigvCgAnJTy6rf1qx_EVGw--.1930S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJrW3Cw17urW7Aw4UWryfJFb_yoW5Jr43pr
	WxG3yUuFs3JFs3Aa4xXw45AF48JF48G3W7GasIk3WkAw4DCr9rAr15Ka4Yga15JrZ2yr43
	t3W3JryrW3W7GF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR3CzAUUUUU=
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbC7hy0I2r9rbwRDgAA38

If TX or RX channel initialization fails after SRAM allocation
succeeds, tegra186_bpmp_setup_channels() returns without freeing
the two SRAM buffers.

Route all channel initialization failures through the existing
teardown path. Check the bpmp field before cleaning up the TX
and RX channels so that teardown skips channels that were not
successfully initialized.

Fixes: 2abd484ca48f ("firmware: tegra: bpmp: Add support for DRAM MRQ GSCs")
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/firmware/tegra/bpmp-tegra186.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra186.c b/drivers/firmware/tegra/bpmp-tegra186.c
index 5a97496600ac..d0a865ad604c 100644
--- a/drivers/firmware/tegra/bpmp-tegra186.c
+++ b/drivers/firmware/tegra/bpmp-tegra186.c
@@ -179,8 +179,10 @@ static void tegra186_bpmp_teardown_channels(struct tegra_bpmp *bpmp)
 		tegra186_bpmp_channel_cleanup(&bpmp->threaded_channels[i]);
 	}
 
-	tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
-	tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
+	if (bpmp->rx_channel->bpmp)
+		tegra186_bpmp_channel_cleanup(bpmp->rx_channel);
+	if (bpmp->tx_channel->bpmp)
+		tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
 
 	if (priv->tx.pool) {
 		gen_pool_free(priv->tx.pool, (unsigned long)priv->tx.sram, 4096);
@@ -283,14 +285,12 @@ static int tegra186_bpmp_setup_channels(struct tegra_bpmp *bpmp)
 	err = tegra186_bpmp_channel_init(bpmp->tx_channel, bpmp,
 					 bpmp->soc->channels.cpu_tx.offset);
 	if (err < 0)
-		return err;
+		goto err_teardown;
 
 	err = tegra186_bpmp_channel_init(bpmp->rx_channel, bpmp,
 					 bpmp->soc->channels.cpu_rx.offset);
-	if (err < 0) {
-		tegra186_bpmp_channel_cleanup(bpmp->tx_channel);
-		return err;
-	}
+	if (err < 0)
+		goto err_teardown;
 
 	for (i = 0; i < bpmp->threaded.count; i++) {
 		unsigned int index = bpmp->soc->channels.thread.offset + i;
@@ -298,11 +298,13 @@ static int tegra186_bpmp_setup_channels(struct tegra_bpmp *bpmp)
 		err = tegra186_bpmp_channel_init(&bpmp->threaded_channels[i],
 						 bpmp, index);
 		if (err < 0)
-			break;
+			goto err_teardown;
 	}
 
-	if (err < 0)
-		tegra186_bpmp_teardown_channels(bpmp);
+	return 0;
+
+err_teardown:
+	tegra186_bpmp_teardown_channels(bpmp);
 
 	return err;
 }
-- 
2.25.1

