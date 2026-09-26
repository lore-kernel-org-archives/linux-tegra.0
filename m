Received: from mail-oo2-f39.google.com (mail-oo2-f39.google.com [74.125.231.167])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55D44371D10
	for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 15:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.167
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437781; cv=none; b=AvYGRqlqcrYnMcckkse+d7qcagPCXeJh78cAJxfXciqEsMKwqbAiaUXV9IOCVsFHd1R3d187ZipS0PXhtK0AOUDvVIKaGRwOU2TtmE+vR/97o4qEOX4q/Pwc7TXGLHBZX9lfLoqG3qgFz9JjZZ/URz5T8vXhpRgbLgPap1Llf2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437781; c=relaxed/simple;
	bh=UTFnmKMIa/HphfeRGv/w2u8lZ3AUss0q6DN+VLPgUAA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XuRGM7vKJHHLEcL5W0VO39xK6O0HJ5xp/XMkMQE3AmOo55KWhUpz+rqqCRGjjPt1AZxtyRcxThMhll9jh9eGCOS81t5UwozqcbAS9DKRCSFvniZQyKeZEi9PDT2kbtNxGd6h3fb2Oe+8DC3PEPggRzRYDRwX38wW0/86PC5c3S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tIAkH5El; arc=none smtp.client-ip=74.125.231.167
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tIAkH5El"
Received: by mail-oo2-f39.google.com with SMTP id 46e09a7af769-8144632e066so968389a34.0
        for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 08:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437774; x=1791042574; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r2upeAgz4ZvptOHZYdf2cN5u9HukHte/X4VwE60m55w=;
        b=tIAkH5EluYYxGMHKycqN3o6lgHsJc/9Tg+zlSqGRjcLhiIlY/pLpwXYclP3xql9j9z
         QQuBE7Jjkd4C0xahxwoc71+ukP3UmfdG+2/0v3xo6q/wHuPLoExMMbHdVp+V2OYKvNXy
         Oey5MY4u7fRnPBcfIbA9hKltYqmH0sa1J6vnSx1FSrIKGcF1RqcEh9+WyYWX7+tsKUWV
         HSL6BpGtJAM0VxtK5JP4KOeJUA4312YP1K9aa9whWeG8TLKCNXCWXqCKnw4cbeR5XLfF
         r6J0wFGaDwBhuGs9HP+AVaetpz9f8IoaI842sleiDTtzS01EN/P5K46dCqtq8SKqL6GU
         C0GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437774; x=1791042574;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r2upeAgz4ZvptOHZYdf2cN5u9HukHte/X4VwE60m55w=;
        b=1cEdoioa5fe/tDVUphQtNslijPSd29geKA6FHfGva9tMQ8cN2HD1uv1joFBxzf3Gw3
         9MRvDu45jRfvr4i9U/8fwulzE7zJ00CjJhAYKmZOFdQpDaNKLU0R6pVgh0fgDxCF/F35
         bAZ6jRCZlD8Oi323XwIuDRru22XWO69frhWoWkGPRmYifG+MGqXDQgfWz3bUg7jual1R
         lJY+nr5JRFLuP+miGpZfnXVaQmtbtaOA3tHOqueR8dbzRJs/IsGgnOuPu40AcBfwVgE9
         7ZMe+O9VVn7qLjtyMBuopBzIMBgvvE0ol05AXWnQIKPqjGQsvtQ9hrQXprShVEuDQQ4C
         zUqw==
X-Forwarded-Encrypted: i=1; AKwUvBxzCoufxbl8W8jna0G8IAadGQK6ByB90jr42ruhjom8CLeLBTrD8SN2KfpswDzrzEwXhJ2ksr33oQo0sw==@vger.kernel.org
X-Gm-Message-State: AFuF++kl1TpY3YfgxGTCNSohZC6Yn1gQdzkZHwUFBzNNZw+zfOJ6cMeS
	KRVelPLgipXf7TfcIK411cWB12YsqCexNuvSsuQ/9onUrwVDjDKiDo5S
X-Gm-Gg: AYBFou14JEMqBdRvuAfJSaFvV6gzB0vBXNEmPZhe8kG9OaJEO0ad9ZMVEbuiSj95eFd
	cCruQhoaPmFp8R466P7ZtsKM81orHCjGa/g8bZEc4yXqpSNFkZAWB5J7mXX9WO/HpJptwLtnXPE
	l+zXEYnEVj+mgX6dtQxbOrm2ayD++tkKU/d3j3PiBiL/eJA6Fam+mg2QWhQg+pEIymPgbhBjWk/
	zArnnPPaV35+hNzX4pjEalhRQcNjqzg+nODNhgpvdCmPrjBGqEczpiDrcdD/miS0LdHTA6jHtHQ
	AL3SYMsn05AW0yEGWlzuPvrBoFj+lFXfqeHrPr0i8npcSqmRGV31yq3QCjfqH85JpfnvTxJ3LLA
	NdG8eftiQX9J29OP1IrZ7FbZVmf4mQcBXvmScD9SnuzLIrIdrq/XloBGSOMJ9GRklrl/ShfExyA
	d6gPqWdWwI/j+3f4LDLDdfHtA+tYNYKn7BDWGhKTH1VTGDIwwNyu9k3pfpnYApQ+YbC0O0OsWgI
	dllqiHuYaR+t/HcygHr68snCVoEfGng0+cZLiYoP5JrUqB8C/4vSVpqBP+f2GJNbyxRfsODAqZO
	E/QdRMHxs537+7RYHL9uzfopcxO9q72NHGK2WvHjLvckS3EOzkm+1wJuTMhildRlkwfOKEbfcqJ
	/ur7HYlAs2Yoryr12gfcc
X-Received: by 2002:a05:6830:628c:b0:804:bb22:6d42 with SMTP id 46e09a7af769-81781d92d4cmr10071685a34.17.1790437773995;
        Sat, 26 Sep 2026 08:49:33 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:49:02 -0600
Subject: [PATCH net v4 07/15] net: stmmac: unwind partially allocated DMA
 configurations
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-7-ec1c0250b3c9@gmail.com>
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

RX and TX allocation failure paths release all configured queues, even
when the failing queue has not allocated its buffer array or
descriptors. Only walk buffer arrays and free coherent memory when those
allocations exist. If TX allocation fails after RX allocation succeeds,
release the RX resources too.

Propagate RXQ memory-model registration errors instead of continuing
with an unusable RXQ. Clear XSK RXQ bindings before the RXQ goes away,
release any saved partial packet, and clear released resource pointers.
This also leaves configurations which are reused after close or XDP
reconfiguration with a consistent empty state.

The MTU transaction added later relies on preparation failures being
fully unwound without touching the currently active configuration.

Take ownership of saved partial RX state at poll entry by clearing the
saved flag and skb pointer immediately. Preserve incomplete state if the
next descriptor is still DMA-owned. A budget-one completion must not
leave an already delivered or freed skb reachable by the new teardown
cleanup.

Fixes: 71fedb0198cb ("net: stmmac: break some functions into RX and TX scopes")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 69 +++++++++++++++++------
 1 file changed, 52 insertions(+), 17 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index bdebc5bfa2b8..1cc68c1cf37d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -1766,6 +1766,9 @@ static void dma_free_rx_skbufs(struct stmmac_priv *priv,
 	struct stmmac_rx_queue *rx_q = &dma_conf->rx_queue[queue];
 	int i;
 
+	if (!rx_q->buf_pool)
+		return;
+
 	for (i = 0; i < dma_conf->dma_rx_size; i++)
 		stmmac_free_rx_buffer(priv, rx_q, i);
 }
@@ -1889,17 +1892,19 @@ static int __init_dma_rx_desc_rings(struct stmmac_priv *priv,
 	rx_q->xsk_pool = stmmac_get_xsk_pool(priv, queue);
 
 	if (rx_q->xsk_pool) {
-		WARN_ON(xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
-						   MEM_TYPE_XSK_BUFF_POOL,
-						   NULL));
+		ret = xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
+						 MEM_TYPE_XSK_BUFF_POOL, NULL);
+		if (ret)
+			return ret;
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_XSK_BUFF_POOL RxQ-%d\n",
 			    queue);
 		xsk_pool_set_rxq_info(rx_q->xsk_pool, &rx_q->xdp_rxq);
 	} else {
-		WARN_ON(xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
-						   MEM_TYPE_PAGE_POOL,
-						   rx_q->page_pool));
+		ret = xdp_rxq_info_reg_mem_model(&rx_q->xdp_rxq,
+						 MEM_TYPE_PAGE_POOL, rx_q->page_pool);
+		if (ret)
+			return ret;
 		netdev_info(priv->dev,
 			    "Register MEM_TYPE_PAGE_POOL RxQ-%d\n",
 			    queue);
@@ -1961,6 +1966,8 @@ static int init_dma_rx_desc_rings(struct net_device *dev,
 			dma_free_rx_skbufs(priv, dma_conf, queue);
 
 		rx_q->buf_alloc_num = 0;
+		if (rx_q->xsk_pool)
+			xsk_pool_set_rxq_info(rx_q->xsk_pool, NULL);
 		rx_q->xsk_pool = NULL;
 
 		queue--;
@@ -2104,6 +2111,9 @@ static void dma_free_tx_skbufs(struct stmmac_priv *priv,
 
 	tx_q->xsk_frames_done = 0;
 
+	if (!tx_q->tx_skbuff_dma || !tx_q->tx_skbuff)
+		return;
+
 	for (i = 0; i < dma_conf->dma_tx_size; i++)
 		stmmac_free_tx_buffer(priv, dma_conf, queue, i);
 
@@ -2142,10 +2152,16 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	void *addr;
 
 	/* Release the DMA RX socket buffers */
-	if (rx_q->xsk_pool)
+	if (rx_q->xsk_pool) {
 		dma_free_rx_xskbufs(priv, dma_conf, queue);
-	else
+		xsk_pool_set_rxq_info(rx_q->xsk_pool, NULL);
+	} else {
 		dma_free_rx_skbufs(priv, dma_conf, queue);
+	}
+	if (rx_q->state_saved)
+		dev_kfree_skb_any(rx_q->state.skb);
+	rx_q->state.skb = NULL;
+	rx_q->state_saved = 0;
 
 	rx_q->buf_alloc_num = 0;
 	rx_q->xsk_pool = NULL;
@@ -2158,7 +2174,8 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_rx_desc_size(priv) * dma_conf->dma_rx_size;
 
-	dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
+	if (addr)
+		dma_free_coherent(priv->device, size, addr, rx_q->dma_rx_phy);
 
 	if (xdp_rxq_info_is_reg(&rx_q->xdp_rxq))
 		xdp_rxq_info_unreg(&rx_q->xdp_rxq);
@@ -2166,6 +2183,10 @@ static void __free_dma_rx_desc_resources(struct stmmac_priv *priv,
 	kfree(rx_q->buf_pool);
 	if (rx_q->page_pool)
 		page_pool_destroy(rx_q->page_pool);
+	rx_q->buf_pool = NULL;
+	rx_q->page_pool = NULL;
+	rx_q->dma_erx = NULL;
+	rx_q->dma_rx = NULL;
 }
 
 static void free_dma_rx_desc_resources(struct stmmac_priv *priv,
@@ -2206,10 +2227,16 @@ static void __free_dma_tx_desc_resources(struct stmmac_priv *priv,
 
 	size = stmmac_get_tx_desc_size(priv, tx_q) * dma_conf->dma_tx_size;
 
-	dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
+	if (addr)
+		dma_free_coherent(priv->device, size, addr, tx_q->dma_tx_phy);
 
 	kfree(tx_q->tx_skbuff_dma);
 	kfree(tx_q->tx_skbuff);
+	tx_q->tx_skbuff_dma = NULL;
+	tx_q->tx_skbuff = NULL;
+	tx_q->dma_etx = NULL;
+	tx_q->dma_entx = NULL;
+	tx_q->dma_tx = NULL;
 }
 
 static void free_dma_tx_desc_resources(struct stmmac_priv *priv,
@@ -2416,6 +2443,8 @@ static int alloc_dma_desc_resources(struct stmmac_priv *priv,
 		return ret;
 
 	ret = alloc_dma_tx_desc_resources(priv, dma_conf);
+	if (ret)
+		free_dma_rx_desc_resources(priv, dma_conf);
 
 	return ret;
 }
@@ -5726,6 +5755,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 	struct sk_buff *skb = NULL;
 	struct stmmac_xdp_buff ctx;
 	int xdp_status = 0;
+	bool in_progress = rx_q->state_saved;
 	int bufsz;
 
 	dma_dir = page_pool_get_dma_dir(rx_q->page_pool);
@@ -5740,6 +5770,14 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		stmmac_display_ring(priv, rx_head, priv->dma_conf.dma_rx_size, true,
 				    rx_q->dma_rx_phy, desc_size);
 	}
+	if (in_progress) {
+		skb = rx_q->state.skb;
+		error = rx_q->state.error;
+		len = rx_q->state.len;
+		rx_q->state.skb = NULL;
+		rx_q->state_saved = false;
+	}
+
 	while (count < limit) {
 		unsigned int buf1_len = 0, buf2_len = 0;
 		enum pkt_hash_types hash_type;
@@ -5748,12 +5786,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		int entry;
 		u32 hash;
 
-		if (!count && rx_q->state_saved) {
-			skb = rx_q->state.skb;
-			error = rx_q->state.error;
-			len = rx_q->state.len;
-		} else {
-			rx_q->state_saved = false;
+		if (!in_progress) {
 			skb = NULL;
 			error = 0;
 			len = 0;
@@ -5787,6 +5820,8 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 
 		prefetch(np);
 
+		in_progress = status & rx_not_ls;
+
 		if (priv->extend_desc)
 			stmmac_rx_extended_status(priv, &priv->xstats, rx_q->dma_erx + entry);
 		if (unlikely(status == discard_frame)) {
@@ -5961,7 +5996,7 @@ static int stmmac_rx(struct stmmac_priv *priv, int limit, u32 queue)
 		count++;
 	}
 
-	if (status & rx_not_ls || skb) {
+	if (in_progress || skb) {
 		rx_q->state_saved = true;
 		rx_q->state.skb = skb;
 		rx_q->state.error = error;

-- 
2.53.0

