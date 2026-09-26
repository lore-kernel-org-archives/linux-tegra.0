Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FF3B37C934
	for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 15:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437786; cv=none; b=gLr3UQB/d+mm+fLCOHMlTnJ6xM9K2YXgLZEEVsTNPvsjl5uDVCUcFs4+um4hwS07YzKJYm8LuMF4tVHCMNk3FsnaZF7qwRgWe3zRoA1nKfCC+9PxI3xfg/PF0jRj7JWBakcfnRnfoDpH2Dsu5k3JLyrpGWK0h/T6VmYtfPUvuCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437786; c=relaxed/simple;
	bh=7Ua19WHK3jdthCgj9xvgyVjQKuCb0g5nlx2k3CtuFFg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mBid0M/1XU1JqMV1VaQU68obV4xLGhQi3ZHonIF0H+cp9gKZQv018dS4P7uFmrS0ft0xAKS+/mgWcj62Z/LuxM8/oQKWMAm1qD4jFZ8ro/6bg9mMFvkxbXuKulTKAPVicDUJZfSgpNT3RaWNNUFM3FU4klUAwaVDIGK2pxPdJQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QkP4m5eZ; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QkP4m5eZ"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b36a8d5b5so120143a34.3
        for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 08:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437780; x=1791042580; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CDcUYAqS9g6d7QBEC66SaiDLKySPzBTN2KggUWEIauA=;
        b=QkP4m5eZ36p0QUeWS7+w8TeploaW37d8AOHAkR/5UmFFvsOuZLZO6eFm55Zyj5jX4s
         l6Pe6EApuC+zazYJJmkHFhrbs83hsuEHGOyZxKQgkbR+ONV84W+YzTECkjIHE9wDMglC
         IhMWCK9YhjrhsTENZazaGURGuAWOqMxgOwxrtb9zgG89ZI/X/UowqaREGbUf20Z7pO03
         4yezUR+TLAXiF+nihWy0rvfJ70LA6gl/cfJ9rjAzXPEzuOTmJ1YJTcYzTsKX7eLTX9/3
         63EgtFtWI+5NsbrgEQ/R71lfSDRvS0jaV86sdyO/+7TOEyjFPwINPURS7eMC0rVvDefc
         v9uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437780; x=1791042580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CDcUYAqS9g6d7QBEC66SaiDLKySPzBTN2KggUWEIauA=;
        b=ICXxCnD2r28VAyOq3Py6bOEAeEYqirHBjUUXlCOmgXc3X7c+ugI4edASBxOy84VCq7
         SWu4q6JtN+zX9eeEisATsccqABr2RjJA8SoMkBdWDBmwLp8yzUuTf4AOsObtalYWpqfW
         o3Il1RgEpkusKOibQvuoeS4TrtTcYRQOIHLIak9tOr/ArGiNfsF/SHBLwrNHgoZqc6+j
         dXRbv22RMYT3hyDnS4ESZ+2h3VnSuRRS94V4NRhkcIMyJvOEhU29e5opYIx7vg3PJyb6
         r29b9O2Z8Ys8MKFAO600tmEiERLoE4cjhqmVeN1Irx7KviNTdohhdf2xYNW6C7vnraB2
         EKoA==
X-Forwarded-Encrypted: i=1; AKwUvBxKoDDP9hxouQcvhB7RkdG5DZRHTi9Dbfetc1iShdMKATOgVwDr8sZv27bxrKFD6ebHtg6fnGPXJRBnUg==@vger.kernel.org
X-Gm-Message-State: AFuF++nDAbY41PKqD3XgOECXOc8klk3Ch+X0flhBJrwCg4DaPPHwD5ND
	jZ8FvCuG7FJUgP4LzR2rsOaVHW1HOqDCaPb+AXjkYGKKXv1kpLuwHyvv
X-Gm-Gg: AYBFou2ACF6yl3lguhW+riLaIqYF8vrKRoEjOnc8XoOtP3s7zKjyIUw3JIE70dncd6X
	5S26xhPFuqrUPyO+yBqB92FrMExFPuhnecN3WKdW/veD2RCDdu6rTVXeE8xhlbq7Yxc433DMf8R
	GL/hiMP+FnTUr8SNiMcZki28VvOY87JKZN6qCQY+HhHN063/39UlHrGQxLycXpzyuFtJWfHpnmH
	GK7Ip1UwiIPHClRXoewaBN2Mv/8BmP5jmRwShwVq1TdmalOu27WYTHcGnP+kLy30fNokYwsfcWP
	WjN2sHviSRho8H8IIGsoqUNFjgUw/hIrr4khkwtietVNid35Qcmkm4n7tJhnI6YxS4EJleOLk9I
	c73FwgVwggVkVcfqVAGlzzqLtT4cpf6QjEBjDIu5KWCcJcTWTA66XJlivg1dmIhXs0Nw06O+Cx1
	OgtLVMb+2Zn6ceGtKSnQSeKdjGzlVxcE3urYhoErq7wBKx+QFe2bp6swfBdAAn5TUOB3ylnkcMm
	87oUUA+DSxRBEPcjk2G5n/iho5MMpWt53Ry0SS1XgEcbHyYoMPeG8neoeEfrBBOFfdCAACTRxKM
	qK1gin7ZR+4yipnvp9rvdCJVvX/DDPhXVmVaUKfGLZNMJA7BqtXRoX+nT91xHnxhtmJuq6vWqgQ
	IucYKZAmUTkI5CeNjzbUkhx/3MxrP054=
X-Received: by 2002:a05:6830:4129:b0:816:9a55:4776 with SMTP id 46e09a7af769-81915268e1fmr6113951a34.8.1790437780448;
        Sat, 26 Sep 2026 08:49:40 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:49:05 -0600
Subject: [PATCH net v4 10/15] net: stmmac: use the tracked datapath restart
 for XSK pool changes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-10-ec1c0250b3c9@gmail.com>
References: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
In-Reply-To: <20260926-submit-stmmac-reset-fixes-v1-v4-0-ec1c0250b3c9@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Joakim Zhang <qiangqing.zhang@nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Tiezhu Yang <yangtiezhu@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Serge Semin <fancer.lancer@gmail.com>, 
 Suraj Jaiswal <quic_jsuraj@quicinc.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Joao Pinto <Joao.Pinto@synopsys.com>, 
 Vladimir Oltean <vladimir.oltean@nxp.com>, 
 Ong Boon Leong <boon.leong.ong@intel.com>, 
 Voon Weifeng <weifeng.voon@intel.com>, 
 "Song, Yoong Siang" <yoong.siang.song@intel.com>, 
 Linus Walleij <linusw@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Eric Dumazet <edumazet@kernel.org>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, James Hilliard <james.hilliard1@gmail.com>, 
 linux-tegra@vger.kernel.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.15.2

Replace the void per-queue enable helpers with the tracked XDP restart.
Pause all queues and MAC link resolution while the pool bitmap and rings
change, leaving the PHY running through phylink replay.

Unwind a failed pool attachment without leaving NAPI over missing
buffers. Pool removal must complete even if ordinary-ring rebuilding
fails, after retiring all references to the departing pool. Preserve TBS
configuration and return a detached interface to the ordinary down/up
recovery path.

Fixes: bba2556efad6 ("net: stmmac: Enable RX via AF_XDP zero-copy")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   5 -
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 116 +++-------------------
 drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c  |  44 ++++----
 3 files changed, 32 insertions(+), 133 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 2fa7b18eb9a4..b65f47db3c2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -461,11 +461,6 @@ static inline bool stmmac_tc_active(struct stmmac_priv *priv)
 	       netif_device_present(priv->dev) && !priv->hw_unavailable;
 }
 
-void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue);
-void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue);
-void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue);
-void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue);
-int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags);
 struct timespec64 stmmac_calc_tas_basetime(ktime_t old_base_time,
 					   ktime_t current_time,
 					   u64 cycle_time);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 22a65c1c1681..618e01772ab8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2268,6 +2268,7 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 	tx_q->dma_etx = NULL;
 	tx_q->dma_entx = NULL;
 	tx_q->dma_tx = NULL;
+	tx_q->xsk_pool = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
@@ -2756,6 +2757,12 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 	bool work_done = true;
 	u32 tx_set_ic_bit = 0;
 
+	/* Nothing can be submitted while the link is down. Let NAPI complete;
+	 * userspace can retry ndo_xsk_wakeup() once carrier has returned.
+	 */
+	if (!netif_carrier_ok(priv->dev))
+		return true;
+
 	/* Avoids TX time-out as we are sharing with slow path */
 	txq_trans_cond_update(nq);
 
@@ -2770,8 +2777,7 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		/* We are sharing with slow path and stop XSK TX desc submission when
 		 * available TX ring is less than threshold.
 		 */
-		if (unlikely(stmmac_tx_avail(priv, queue) < STMMAC_TX_XSK_AVAIL) ||
-		    !netif_carrier_ok(priv->dev)) {
+		if (unlikely(stmmac_tx_avail(priv, queue) < STMMAC_TX_XSK_AVAIL)) {
 			work_done = false;
 			break;
 		}
@@ -7352,107 +7358,6 @@ static int stmmac_xdp_xmit(struct net_device *dev, int num_frames,
 	return nxmit;
 }
 
-void stmmac_disable_rx_queue(struct stmmac_priv *priv, u32 queue)
-{
-	struct stmmac_channel *ch = &priv->channel[queue];
-	unsigned long flags;
-
-	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, 1, 0);
-	spin_unlock_irqrestore(&ch->lock, flags);
-
-	stmmac_stop_rx_dma(priv, queue);
-	__free_dma_rx_desc_resources(priv, priv->dma_conf, queue);
-}
-
-void stmmac_enable_rx_queue(struct stmmac_priv *priv, u32 queue)
-{
-	struct stmmac_rx_queue *rx_q = &priv->dma_conf->rx_queue[queue];
-	struct stmmac_channel *ch = &priv->channel[queue];
-	unsigned long flags;
-	int ret;
-
-	ret = __alloc_dma_rx_desc_resources(priv, priv->dma_conf, queue);
-	if (ret) {
-		netdev_err(priv->dev, "Failed to alloc RX desc.\n");
-		return;
-	}
-
-	ret = __init_dma_rx_desc_rings(priv, priv->dma_conf, queue, GFP_KERNEL);
-	if (ret) {
-		__free_dma_rx_desc_resources(priv, priv->dma_conf, queue);
-		netdev_err(priv->dev, "Failed to init RX desc.\n");
-		return;
-	}
-
-	stmmac_reset_rx_queue(priv, queue);
-	stmmac_clear_rx_descriptors(priv, priv->dma_conf, queue);
-
-	stmmac_init_rx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
-			    rx_q->dma_rx_phy, queue);
-
-	stmmac_set_queue_rx_tail_ptr(priv, rx_q, queue, rx_q->buf_alloc_num);
-
-	stmmac_set_queue_rx_buf_size(priv, rx_q, queue);
-
-	stmmac_start_rx_dma(priv, queue);
-
-	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, 1, 0);
-	spin_unlock_irqrestore(&ch->lock, flags);
-}
-
-void stmmac_disable_tx_queue(struct stmmac_priv *priv, u32 queue)
-{
-	struct stmmac_channel *ch = &priv->channel[queue];
-	unsigned long flags;
-
-	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_disable_dma_irq(priv, priv->ioaddr, queue, 0, 1);
-	spin_unlock_irqrestore(&ch->lock, flags);
-
-	stmmac_stop_tx_dma(priv, queue);
-	__free_dma_tx_desc_resources(priv, priv->dma_conf, queue);
-}
-
-void stmmac_enable_tx_queue(struct stmmac_priv *priv, u32 queue)
-{
-	struct stmmac_tx_queue *tx_q = &priv->dma_conf->tx_queue[queue];
-	struct stmmac_channel *ch = &priv->channel[queue];
-	unsigned long flags;
-	int ret;
-
-	ret = __alloc_dma_tx_desc_resources(priv, priv->dma_conf, queue);
-	if (ret) {
-		netdev_err(priv->dev, "Failed to alloc TX desc.\n");
-		return;
-	}
-
-	ret = __init_dma_tx_desc_rings(priv,  priv->dma_conf, queue);
-	if (ret) {
-		__free_dma_tx_desc_resources(priv, priv->dma_conf, queue);
-		netdev_err(priv->dev, "Failed to init TX desc.\n");
-		return;
-	}
-
-	stmmac_reset_tx_queue(priv, queue);
-	stmmac_clear_tx_descriptors(priv, priv->dma_conf, queue);
-
-	stmmac_init_tx_chan(priv, priv->ioaddr, priv->plat->dma_cfg,
-			    tx_q->dma_tx_phy, queue);
-
-	if (tx_q->tbs & STMMAC_TBS_AVAIL)
-		stmmac_enable_tbs(priv, priv->ioaddr, 1, queue);
-
-	stmmac_set_queue_tx_tail_ptr(priv, tx_q, queue, 0);
-
-	stmmac_start_tx_dma(priv, queue);
-
-	spin_lock_irqsave(&ch->lock, flags);
-	stmmac_enable_dma_irq(priv, priv->ioaddr, queue, 0, 1);
-	spin_unlock_irqrestore(&ch->lock, flags);
-}
-
 void stmmac_xdp_release(struct net_device *dev)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
@@ -7552,6 +7457,9 @@ int stmmac_xdp_open(struct net_device *dev)
 
 		stmmac_set_queue_tx_tail_ptr(priv, tx_q, chan, 0);
 
+		if (tx_q->tbs & STMMAC_TBS_AVAIL)
+			stmmac_enable_tbs(priv, priv->ioaddr, 1, chan);
+
 		hrtimer_setup(&tx_q->txtimer, stmmac_tx_timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 	}
 
@@ -7589,7 +7497,7 @@ int stmmac_xdp_open(struct net_device *dev)
 	return ret;
 }
 
-int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags)
+static int stmmac_xsk_wakeup(struct net_device *dev, u32 queue, u32 flags)
 {
 	struct stmmac_priv *priv = netdev_priv(dev);
 	struct stmmac_channel *ch;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
index 7ecb7addd2ea..907ac49a1b76 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_xdp.c
@@ -9,7 +9,6 @@
 static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 				  struct xsk_buff_pool *pool, u16 queue)
 {
-	struct stmmac_channel *ch = &priv->channel[queue];
 	bool need_update;
 	u32 frame_size;
 	int err;
@@ -34,23 +33,23 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 	need_update = priv->datapath == STMMAC_DATAPATH_RUNNING &&
 		      stmmac_xdp_is_enabled(priv);
 
-	if (need_update) {
-		napi_disable(&ch->rx_napi);
-		napi_disable(&ch->tx_napi);
-		stmmac_disable_rx_queue(priv, queue);
-		stmmac_disable_tx_queue(priv, queue);
-	}
+	if (need_update)
+		stmmac_xdp_release(priv->dev);
 
 	set_bit(queue, priv->af_xdp_zc_qps);
 
 	if (need_update) {
-		stmmac_enable_rx_queue(priv, queue);
-		stmmac_enable_tx_queue(priv, queue);
-		napi_enable(&ch->rxtx_napi);
-
-		err = stmmac_xsk_wakeup(priv->dev, queue, XDP_WAKEUP_RX);
-		if (err)
+		err = stmmac_xdp_open(priv->dev);
+		if (err) {
+			clear_bit(queue, priv->af_xdp_zc_qps);
+			xsk_pool_dma_unmap(pool, STMMAC_RX_DMA_ATTR);
+			netdev_err(priv->dev, "failed reopening after XSK pool attach: %pe; interface remains detached\n",
+				   ERR_PTR(err));
 			return err;
+		}
+
+		/* The pool is installed even if link resolution is still pending. */
+		napi_schedule(&priv->channel[queue].rxtx_napi);
 	}
 
 	return 0;
@@ -58,9 +57,9 @@ static int stmmac_xdp_enable_pool(struct stmmac_priv *priv,
 
 static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 {
-	struct stmmac_channel *ch = &priv->channel[queue];
 	struct xsk_buff_pool *pool;
 	bool need_update;
+	int err;
 
 	if (queue >= priv->plat->rx_queues_to_use ||
 	    queue >= priv->plat->tx_queues_to_use)
@@ -73,24 +72,21 @@ static int stmmac_xdp_disable_pool(struct stmmac_priv *priv, u16 queue)
 	need_update = priv->datapath == STMMAC_DATAPATH_RUNNING &&
 		      stmmac_xdp_is_enabled(priv);
 
-	if (need_update) {
-		napi_disable(&ch->rxtx_napi);
-		stmmac_disable_rx_queue(priv, queue);
-		stmmac_disable_tx_queue(priv, queue);
-		synchronize_rcu();
-	}
+	if (need_update)
+		stmmac_xdp_release(priv->dev);
 
 	xsk_pool_dma_unmap(pool, STMMAC_RX_DMA_ATTR);
 
 	clear_bit(queue, priv->af_xdp_zc_qps);
 
 	if (need_update) {
-		stmmac_enable_rx_queue(priv, queue);
-		stmmac_enable_tx_queue(priv, queue);
-		napi_enable(&ch->rx_napi);
-		napi_enable(&ch->tx_napi);
+		err = stmmac_xdp_open(priv->dev);
+		if (err)
+			netdev_err(priv->dev, "failed reopening after XSK pool removal: %pe; interface remains detached\n",
+				   ERR_PTR(err));
 	}
 
+	/* Socket teardown must be able to unmap and free the removed pool. */
 	return 0;
 }
 

-- 
2.53.0

