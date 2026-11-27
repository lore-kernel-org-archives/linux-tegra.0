Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795740961;
	b=Lhh1GD/W0KvmIBIfXx5BuogJ5xArWYyS39+sCatPlcfFR4QeK1ECoZLHg56y+AXOgubv
	 TdJ7j5W0cSUisqb2906wUJS+WXpjYs4gG8ADGJDd2yXiHcqdI1Dqo0/1m47he/m/ZwwiG
	 rwKBaLIP4Jemsu3JHWDm4v7yGrwrJQ6KLge9Vu3CSwEewo1aHKlfnGbKQLBqDV43IF356
	 qQRVXYrUC+/nvLD627zqZ98jidHySvlBz9hUD7NTqAECD0uww3qrwX7of7YtUMswu5wkz
	 yBzsk87t34y0QMGgId8vs9Rcz2vWgJE7WfMQG5vkmTeQyTb7FG3Vt0znFwXTtcR//qA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795740961;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xN8nnmn5MJ4M+oHgpLcyhfA9Ly2+AseenveAbSMUenY=;
	b=oFKHY7GfGmudiUWLNegnS5LC6t9U4bRcSmIZSBVahaHZFR2wSgyVOTj2YpRohHFMGSuV
	 SbnvkZWSItzkwHsiGO2Q3RLL57G1IxGcbNc+rvxzbnl60ev8f2njNNkVaqypj4TpqPN8J
	 eEfBToAWiyYHdyhiZKboRf54K7BZtCKS0sC8sSy7m8Okmvx4BfLGSTo4nly1NR8llE5Cg
	 0rhc3buHfMIlLMHnS9qiwQ7ekLC7Dkb6tks1EGrMm/HGsDlBR93MuhbA5zLdQlhyG7CfK
	 E72ir59BwGX0Uj/SbFSGLMmq1vixWO8huGsMxbOvl2o95FdBXMsfM3zg4aQ8soV1+EQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctJfppKp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF60606A682;
	Fri, 27 Nov 2026 00:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ctJfppKp
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795740960;
	b=OkPGaqsDIZ6Yx8zAhwdTx8W6uNa9dgsSAjA83Awf0E4ZK/GrmceUXlkrisB7xniVZ/cb
	 jd6nA68IADDjtkjDsW08o6XL8NuzB5F4fs07SUrIczzrph2qTJhXGbIfbQ4DX8Mm5fSaY
	 xD4L38uQotCXGqFAH7T1+Ut7y9kKm4Xwkfz2SGTXRpfDtmmWVEfuHQIg75dMIQp7rUNn8
	 9lQEhUPOHPZoUohQvLMEapfz9bfZoiC/FzQDTebm5F6FYTy5538T4O9IycNmvS6JCQ7Dg
	 QRT5Va56G2LGaeOg1ZXSJiTb8SPojXOeYm68wxa+HkOHPWMU53zIXCpe7ImfdrXhsww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795740960;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=xN8nnmn5MJ4M+oHgpLcyhfA9Ly2+AseenveAbSMUenY=;
	b=N1WtcExOJ3AJLmYFT9w0SaJXN8E4flMBFerKiQSAJH7fUrkNi8h7uYWmqdedW56jkvCU
	 5AwEZbbEPo/dtDeK4YsozH5Wi5xHBTn5DWepeTlVOLG25JRHJdFR38pPkWvDstO9HhacA
	 Lnl5GqAXv3H+dJihoIDhkhdff5WTEiNx4f+gn8qbF0xzD6Q/VGKtcldyWbO68vtkg879Z
	 WHTxDl8bfMN25jDMtam1CandiyY7dNofS2F0ddlHqyg/HnpjpOJOUdafJuBogI3oiubCG
	 ETLIhrFqjZ8SVHIYwnnFERFf1goV7MJb3Myn4yMFuylcvYj0RWv7XjqIVm/59dnbo0A==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 498E51F00898;
	Fri, 27 Nov 2026 00:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795740960;
	bh=xN8nnmn5MJ4M+oHgpLcyhfA9Ly2+AseenveAbSMUenY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ctJfppKpULkvqOql9NoXuGJnxU89SFqgu/r5Dg2Qh5DNIqEbcBgJXRqPdVAwkX92t
	 NlfsooleeA1L7zq3MxR2ZexdxnbWyj6fs0pQdUH+sYqNUgm0roQWAxzgyI0coCZzgg
	 zBsbrjgS4mBE7JrXBBD134YChU331uiCD13/kaUqrMf7xVemay2JgNy9hGww47RYMR
	 mLHQkRn8PWTXt5mc3VcziLY20A+7F1Rezwbsz2fFobJhKg/vkz3zlk3eYy6FMBZk1G
	 gzW+UiHHoyFXP3OTaQ4x20QzxjNNv9t0uUqYMZAtIpdZwv8p3wiDtOrsyVVe7bJMgq
	 509d99AXNEZ7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CB8554B4B8;
	Fri, 27 Nov 2026 00:55:48 +0000 (UTC)
From: Jerome Berclaz via B4 Relay <devnull+jerome.berclaz.proton.me@kernel.org>
Date: Thu, 26 Nov 2026 16:55:46 -0800
Subject: [PATCH 2/4] media: tegra-vde: allow cache hints on the capture
 queue
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
Message-Id: <20261126-tegra-vde-fixes-v1-2-fa4a7c1d24cc@proton.me>
References: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
In-Reply-To: <20261126-tegra-vde-fixes-v1-0-fa4a7c1d24cc@proton.me>
To: Dmitry Osipenko <digetx@gmail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jerome Berclaz <jerome.berclaz@proton.me>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=jerome.berclaz@proton.me; s=2026-11; h=from:subject:message-id;
 bh=zLiW2FSkpXZ0lI6JCWYLwvCRGSU1EAnRKmDeIdvXN4w=;
 b=owGbwMvMwCVmvC9341tRgSLG02pJDNkcV4VWqzXuZJ1mpRj3xPfMG+YES+9T0W0fvux4YHsm5
 K6xsUB0RykLgxgXg6yYIgtrg2Hq/BNsAYX68w7BzGFlAhnCwMUpABPx2sjI8HR97oGZc4/FdJ68
 l7/JokFpV2w576HqtDkSRcc8597cuYrhN/vOk6sPPOX0XfukpGVWk6DjyeO5Dk2huw+2ne2e6Fp
 9nRkA
X-Developer-Key: i=jerome.berclaz@proton.me; a=openpgp;
 fpr=058031659FC80650712F9EC233BE6DB1ED151072
X-Endpoint-Received: by B4 Relay for jerome.berclaz@proton.me/2026-11 with
 auth_id=1658
X-Original-From: Jerome Berclaz <jerome.berclaz@proton.me>
Reply-To: jerome.berclaz@proton.me
Content-Transfer-Encoding: 7bit

From: Jerome Berclaz <jerome.berclaz@proton.me>

When the decoder sits behind the SMMU, buffers use vb2_dma_sg_memops,
i.e. cached pages, and vb2 cleans and invalidates every decoded frame
(1.4 MB at 720p) on each QBUF and DQBUF. A client that hands the frames
to the display or GPU as dma-bufs never reads them through the CPU, and
when it does, the dma-buf begin/end_cpu_access ops do the sync.

Set allow_cache_hints on the capture queue so that such clients can pass
V4L2_BUF_FLAG_NO_CACHE_CLEAN / V4L2_BUF_FLAG_NO_CACHE_INVALIDATE, as the
MediaTek decoder already allows.

Signed-off-by: Jerome Berclaz <jerome.berclaz@proton.me>
---
 drivers/media/platform/nvidia/tegra-vde/v4l2.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/nvidia/tegra-vde/v4l2.c b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
index 9fe31b5c0275..cd25307ad9db 100644
--- a/drivers/media/platform/nvidia/tegra-vde/v4l2.c
+++ b/drivers/media/platform/nvidia/tegra-vde/v4l2.c
@@ -385,6 +385,7 @@ static int tegra_queue_init(void *priv,
 	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
 	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE;
 	dst_vq->io_modes = VB2_DMABUF | VB2_MMAP;
+	dst_vq->allow_cache_hints = 1;
 	dst_vq->lock = &vde->v4l2_lock;
 	dst_vq->dma_attrs = dma_attrs;
 	dst_vq->mem_ops = mem_ops;

-- 
2.53.0


