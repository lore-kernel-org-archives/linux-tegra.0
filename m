Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794115308;
	b=g89lbqYHy+lzHaPacd6KmRw3s+aCYpME3L/Z9AOWwyhQ8UJbcyvCjkpesseqhA+NUhD+
	 7tAKODM9l51nQVP3z9xdks+j/xNOAdmwGO6sZpU/5+H3O94KOxZlXeUnMtYkGcjiyUKE4
	 BtMhjTUmOemRYI0KMT/jcfA/6BYWq1oZLlytlUQcntDFSh/Y7mfOBbPJVcp6EddVNEBna
	 zyrliFmA8wpQMuLdB1TgrFkx0989Pm4R/hPCwWg1MED4aKHWAIWKFFJMbfwymmVvNKbWD
	 t3K5s/RyufshIYw0OLNEQVJKa/4/TSd2LW331FfLOG50w1I87RX+bn6ictgbRKgAybw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794115308;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SoIh5IaJ5fx+BCvM2MKwezXGTpCbXK/6YMkiNnlkXjg=;
	b=QnKaERJKBd4xTN3FTO2KiXk2sill866wVaritwQ9chlv0hwiFkB3TuNfJXOkGHqYvzzF
	 2qdbg5xT/CpGHEh3Pgo9ISXcnWr9KZ3O9if95dEb5HjtbZ80S/EjLZFa1Aozu/roQCexL
	 RpBNf5MIb4csdVBnQg7tiGBjb1ekgUhPwRWHPxVODhv1j9M4r/CsFXQy2lO5QTpX+QzVg
	 BlUMHDce23HdWhX9942buAVcg44xmvZynyPkaKJbWutZ3BFAu3X4hpWSv/Teg5vcng6Qf
	 LAG81mW2Sn/QF2CTsnRjIYBnzKOE6S55brFI48DhPBd33CUqI5kAtDkt7trJZLzXjZA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xekfr9v3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67B45606A31D;
	Sun,  8 Nov 2026 05:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xekfr9v3
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794115308;
	b=pXjmPdeFiLDOvvAD+y6j2jC5krQqak0nS+uoHeYw02Bp6LHq0llW+K5s9t5iHGyvnVTb
	 ymvNRTfnUf0xAiCCZfHdA3geB54kh6iHteIkud2M8ZmKRkk4hljq0++fkMybkuQ6gsRtS
	 uqO0mqbSHTAylDouxIDPZ7dLxPKyvz6tFOeZ4yeDRY0OEWlcr2tQGeh6RmeSxUy2qZiUc
	 2/7qORHQaHIwAaC1hEkUtff2gHsKcfgZCcSRVwhBDthE8UsLQuA52RrLhoOz5jgnCkarT
	 VKRToqkqW7EVVXWuKSy5At4jtfMbx6PlJFshbEiFqEZcaH9Yyia8jehjD3YQqp08B1A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794115308;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SoIh5IaJ5fx+BCvM2MKwezXGTpCbXK/6YMkiNnlkXjg=;
	b=cyGCOdGv8aBwM3sLwEfNBkr5Z9AdV+pabUcWFzNnhjHlMLsJQs4gJbPUJK5DVdDpkcIB
	 LbLw1vuhsRzzPI6Rrq6cCjIl5k+ITEXBO08QZ+CRmebG+1EXeRnPC38Kaf/MNHNAGIKeP
	 YiTOlXoTxBhPdVb/9BtNW42ig8lP0Xi1mxdD+28Dh6gV3nKfzeBxm8sHhzxkangfXYTFB
	 hIv9MuC9P822XjWMOoJotSp3BW7nB+6m7P0gTrWHLYKvHR5+EA8//Vv8SOm8E+SJlc28O
	 AcsYOWhkZc4jQRlHw7kv/ezqEAyyh4ItWv75B/2aCO4Mo4/s0uXke+A0oVKBVOzH3MQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 48A481F008A2;
	Sun,  8 Nov 2026 05:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794115308;
	bh=SoIh5IaJ5fx+BCvM2MKwezXGTpCbXK/6YMkiNnlkXjg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Xekfr9v3qAfIpCpGJnv9VlsH/hJ5haZuB9kErQPFPo2lt078AOyZXgTqZw9hoafGs
	 J5BQwIjv021SqZO0hFIjiFfYJiTdwxjpDn2ezsALj6FWJpGISwQX6eKI4/n7swpNN4
	 XVMsa8ydANSBeMTzinC2FKp/vsu7WQHhKS8u1h4alYQQfaH1fgqrPD9pViSrXp5PC+
	 cL9L6p4lq5sMMglFJjUANAsDBcwNOVZx8tanABoJ7zz2pNiav6eQ3iFmlgcUM+HlyF
	 SyTkZM9JcreOP++VDxp9mjgKxT0BFnkNnuD0pg7Gf0jMM90AlmRc3JyFQ3DGgCfHos
	 10uiJZ5duHw3w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B355947E1D;
	Sun,  8 Nov 2026 05:21:46 +0000 (UTC)
From: DelaySystem via B4 Relay <devnull+DelaySystem.tubot.lat@kernel.org>
Date: Sat, 07 Nov 2026 21:21:47 -0800
Subject: [PATCH RFC 2/2] staging: media: tegra-video: uninterruptible
 syncpt wait for tegra20
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-batch1-b1-host1x-wait-v1-2-8c8198adf600@tubot.lat>
References: <20261107-batch1-b1-host1x-wait-v1-0-8c8198adf600@tubot.lat>
In-Reply-To: <20261107-batch1-b1-host1x-wait-v1-0-8c8198adf600@tubot.lat>
To: mperttunen@nvidia.com, thierry.reding@kernel.org
Cc: DelaySystem <DelaySystem@tubot.lat>, dri-devel@lists.freedesktop.org, 
 luca.ceresoli@bootlin.com, gregkh@linuxfoundation.org, mchehab@kernel.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 clamor95@gmail.com, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
 skomatineni@nvidia.com, linux-media@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3090;
 i=DelaySystem@tubot.lat; h=from:subject:message-id;
 bh=7uslf2XS4oy14/GfacExPmou0Ikg+kCKP6aBJT8Gwy0=;
 b=owGbwMvMwCH2SNl4+SzWXm/G02pJDFkf2F5ZZzAysWlkRNotNl89g+nGy8TPGo7er+YqdjzIv
 +Oh+VCoo5SFQYyDQVZMkUVMhud9/X2dOGurOSdg5rAygQxh4OIUgIm0XGb4X/4spIKP18/ewqGm
 3nj26Vd2WyQ+d7CuiAg46yLsGbbCl+F/pXpCn+AUJ89QoWsRWSrfDBzd10m9j3WaZuyYVPFogxw
 3AA==
X-Developer-Key: i=DelaySystem@tubot.lat; a=openpgp;
 fpr=161C0CEF7FDF2C5E3B3A9CC8E22333A79A058D4B
X-Endpoint-Received: by B4 Relay for DelaySystem@tubot.lat/default with
 auth_id=1447
X-Original-From: DelaySystem <DelaySystem@tubot.lat>
Reply-To: DelaySystem@tubot.lat
Content-Transfer-Encoding: 7bit

From: DelaySystem <DelaySystem@tubot.lat>

The Tegra20 capture path runs in a kernel thread and retries
host1x_syncpt_wait() in a do/while loop to survive the -ERESTARTSYS
its unconditionally interruptible wait returns spuriously at high
resolutions and framerates.

Now that host1x provides host1x_syncpt_wait_uninterruptible(), use it
for both the frame-start and MW-ACK waits and drop the retry loops,
fulfilling the TODO above the frame-start wait.  Timeouts still fail
the capture as before; only the spurious signal failures go away.

Signed-off-by: DelaySystem <DelaySystem@tubot.lat>
---
 drivers/staging/media/tegra-video/tegra20.c | 37 ++++++++---------------------
 1 file changed, 10 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra20.c b/drivers/staging/media/tegra-video/tegra20.c
index cdadff98eae7..e618d1722841 100644
--- a/drivers/staging/media/tegra-video/tegra20.c
+++ b/drivers/staging/media/tegra-video/tegra20.c
@@ -589,28 +589,14 @@ static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
 				  CSI_PP_START_MARKER_FRAME_MAX(0xf) |
 				  CSI_PP_SINGLE_SHOT | CSI_PP_ENABLE);
 
-		/*
-		 * ERESTARTSYS workaround for syncpoints is used because host1x_syncpt_wait
-		 * is unconditionally interruptible. This is not an issue with single shots
-		 * or low resolution capture, but -ERESTARTSYS occurs quite often with high
-		 * resolution or high framerate captures and if not addressed here will
-		 * cause capture to fail entirely.
-		 *
-		 * TODO: once uninterruptible version of host1x_syncpt_wait is available,
-		 * host1x_syncpt_wait should be swapped and ERESTARTSYS workaround can be
-		 * removed.
-		 */
-
 		val = host1x_syncpt_read(chan->frame_start_sp[0]);
-		do {
-			err = host1x_syncpt_wait(chan->frame_start_sp[0],
-						 val + 1, TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
-		} while (err == -ERESTARTSYS);
-
+		err = host1x_syncpt_wait_uninterruptible(chan->frame_start_sp[0],
+							 val + 1,
+							 TEGRA_VI_SYNCPT_WAIT_TIMEOUT,
+							 NULL);
 		if (err) {
-			if (err != -ERESTARTSYS)
-				dev_err_ratelimited(&chan->video.dev,
-						    "frame start syncpt timeout: %d\n", err);
+			dev_err_ratelimited(&chan->video.dev,
+					    "frame start syncpt timeout: %d\n", err);
 
 			tegra20_csi_write(csi_chan, TEGRA_CSI_PIXEL_STREAM_PP_COMMAND(port),
 					  CSI_PP_START_MARKER_FRAME_MAX(0xf) | CSI_PP_RESET);
@@ -625,14 +611,11 @@ static int tegra20_channel_capture_frame(struct tegra_vi_channel *chan,
 	}
 
 	val = host1x_syncpt_read(chan->mw_ack_sp[0]);
-	do {
-		err = host1x_syncpt_wait(chan->mw_ack_sp[0], val + 1,
-					 TEGRA_VI_SYNCPT_WAIT_TIMEOUT, NULL);
-	} while (err == -ERESTARTSYS);
-
+	err = host1x_syncpt_wait_uninterruptible(chan->mw_ack_sp[0], val + 1,
+						 TEGRA_VI_SYNCPT_WAIT_TIMEOUT,
+						 NULL);
 	if (err) {
-		if (err != -ERESTARTSYS)
-			dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", err);
+		dev_err_ratelimited(&chan->video.dev, "mw ack syncpt timeout: %d\n", err);
 		goto exit;
 	}
 

-- 
2.34.1


