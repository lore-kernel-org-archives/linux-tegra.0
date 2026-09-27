Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159C3D6CA7
	for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 22:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546409; cv=none; b=ZbpIK0KyTetltGv7CYNxzvnwN6zS7PUjTGYfQjg/SWZLyc61ybB2nmxA/KYfbljCCt/JF39VUhMH0T72CpbBnwSc2dx/QxfKl6q6XBTOFkHlYl1vAtJsHkfCMnvFftu4ggC1/Le3u9Q87laxuErnpRFINZvnlwKpyvX+gGJ+Hpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546409; c=relaxed/simple;
	bh=3ftdV+5R08Pr8zeGSaJM/WPcfoSQPOGMA1Wv4bA6gYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DkHgg/TdYr3bncDjDXoz/grfvrD/e8cEu72JYvyTsxl5mhAGLMtzHfWHaMokGY0qr8VWXooaSmT6wmoodMiub4L7bvvdYaVZ66fWU3SMFbxGSB+EHfo7aVK7xh3ieSX23OjT9NhIfHL7e5jYsK5F6jzvNfGdc7QJ5SBZyiBcFHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AOFn+KBC; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOFn+KBC"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-81be5042c51so623244a34.1
        for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 15:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546398; x=1791151198; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjhkJuFgnFRl+4PjzirvgdpItVJEMtde3SK4p8xZD1Y=;
        b=AOFn+KBCmwf9Hf+HnBsRN5MHuwsqj877YJNdRIFryVP2MV9HEF8ipEjP6TVFFbnJVO
         T7eQkbDppUVKe4tB+SLDlmd1XidTxqh6Sn5gJLFH9MYCIC3tN62vng26Rvf0mQ5nmTG7
         +0NRpWQS7VF3wwV6Knd6hr8uE8ilDxCaraFN5PkkrlpfENGlKscVxE6f85B2LnF0oy+4
         rklQ1866aqvxHRopu9Nxow9v7EVo40awpgqTjjEzGialY4ap+i7dw4HaPbwzy93TvB10
         hYFGksIBZSPy8xEwBKGTn2qu655FKXD4LStFDB303UoXHJLe0Hz36ei+/mSbaEUpMQ6n
         DSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546398; x=1791151198;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjhkJuFgnFRl+4PjzirvgdpItVJEMtde3SK4p8xZD1Y=;
        b=kTSQF84ZYfJ3Oa3are9HFvf3fnAe4O1Qb/8XpA1xEFZEX2orm6WemW423P9q5v+IJW
         npuxYXbVhh6ysMwhtJ1vaqwrcTIsVZp2v3TTEfWK1VxPiEAt23LB4ujJJi+G5uMywkAX
         HQFLvuNaS0goK0+1SP1usy1tJHlBgFYr39PSS60pXh6hrq63Vo/EtwdBbnkvNNeJNosa
         v85mNoiaBiXaZv/nSaXul37d2O5cjs2BTZ3/T33qdltIm9SAVtK773YrTX6/ifWiwjke
         CGTlY6jbxZkPgANu/jqC4rYQZbAogX7VZFXZPd7UGvotkGYFSbDfpHZsGDSHjaKJ9DBa
         vCww==
X-Forwarded-Encrypted: i=1; AKwUvBxQUJvuRlZbpTMnMuiMGhntI5chlFpYmdQ4LbemSg/2kSAVteV4RiqY04XTOhScokPuCVAcI1xMj0Jknw==@vger.kernel.org
X-Gm-Message-State: AFuF++mEneevPx6Upl27FaeCknYJZwMErszC6rfGAwD8mUIbs07hvBd9
	uUN32Cug7pn5qGKWAir+kQU0uLEMEiw1XaNQCDb/z0O3HH88puK5hPfD
X-Gm-Gg: AYBFou3AacmJnLCT6PLJ+Wiuz2cZv19qDRY/0fAkImB+Q0fOmuLG0JnctZAidJgmoGG
	9KtR4XxWtVL19bJiucJ1N8fGkCgq/HEffJYdkccBZ9XFyr239IPfkjHzcf6fFVWU/9J24bGtxUx
	7GeDEDpOHhN4iUToNBAnAAH9GyaEOAcTQ4Ao2QESNh0zpP1ykkDImrxXK36V2TNEChvy0udYzqB
	5fR0OFaxQ0wKjlxacZL3Iv71AFt0oYlQOpxHcLBv3ZSfo7x3LIeQDqBEz3T804jJ2mNppkt08hP
	JZNfTSHO9D9LQfNdoGgurxwSO7FlsjdtzxJbhZ2rdxvRJD2offBmifxGYjDdzRDDlahPsR4jkjJ
	YH/hYxjIngsoV4ziBMSYbnDEaw11k5waOTHQF7/XtGc0wrOOow4rCsfVpE3OZ7xIA9bexwd0NJv
	c8t3EnhcV1BYIvAlCV/oyb6LabsT2GJCpPUaNuwlwe1FBu5jxLWKFbYtLnLhd1G5jEkjLbBfEgw
	LPvQS3ISy0BlYFxUEesL7H/z6XFwkLt2khu0i8XswDkRzutkhVr0AGNbtoiU5iQUIQG/Va3RELn
	rrsPR/r/8wOeIXJzLSJEfQw/juxq20Fq+jpreT9bYGs/4bd2u1PDaY4VqwE65mpaRxcS2WhH9Jg
	q4/FQOHhcuffpZ4txE/mds/suErSgNLY=
X-Received: by 2002:a05:6830:43a0:b0:7dc:dbe4:3f21 with SMTP id 46e09a7af769-81780d9a632mr11559233a34.1.1790546398452;
        Sun, 27 Sep 2026 14:59:58 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:57 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:40 -0600
Subject: [PATCH net-next v5 05/19] net: stmmac: embed struct stmmac_est in
 stmmac_priv struct
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-5-feec6c14dd06@gmail.com>
References: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
In-Reply-To: <20260927-submit-stmmac-reset-fixes-v1-v5-0-feec6c14dd06@gmail.com>
To: Russell King <linux@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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
 Samuel Holland <samuel@sholland.org>, Jose Abreu <Jose.Abreu@synopsys.com>, 
 Yao Zi <me@ziyao.cc>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Richard Genoud <richard.genoud@bootlin.com>, 
 Alastair D'Silva <alastair@d-silva.org>, Maxime Ripard <mripard@kernel.org>, 
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org, 
 ZhaoJinming <zhaojinming@uniontech.com>, 
 Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>, 
 Ding Hui <dinghui1111@163.com>, Linkui Xiao <xiaolinkui@kylinos.cn>, 
 Linkui Xiao <xiaolinkui@126.com>, linux-tegra@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

This is a preliminary change to fix EST reconfiguration in the open
and resume paths: the taprio offload must be re-applied after the DMA
soft reset clears the MTL_EST registers, but the current layout makes
that fragile.
priv->est is currently a pointer allocated with devm_kzalloc() on the
first taprio REPLACE, and the mutex guarding it (priv->est_lock) is
initialized at the same time. That ties the lock's validity to whether
taprio has ever been configured, so the EST parameters can not be
read under the lock (e.g. to check priv->est->enable in the open and
resume paths) before the first offload setup.
Embed struct stmmac_est into struct stmmac_priv and initialize the mutex
in probe(). This makes the code simpler (no logical changes added).
Moreover, the lock is now unconditionally valid, so the enable flag can
be inspected under the lock from any control path.

Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 17 +++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  | 22 ++++----
 drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 61 ++++++++++-------------
 4 files changed, 45 insertions(+), 57 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 83c30b39f704..c65d95fc4760 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -300,7 +300,7 @@ struct stmmac_priv {
 	struct plat_stmmacenet_data *plat;
 	/* Protect est parameters */
 	struct mutex est_lock;
-	struct stmmac_est *est;
+	struct stmmac_est est;
 	struct dma_features dma_cap;
 	struct stmmac_counters mmc;
 	int hw_cap_support;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 894de213b92f..b233105cb449 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -2745,9 +2745,8 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
 		if (!xsk_tx_peek_desc(pool, &xdp_desc))
 			break;
 
-		if (priv->est && priv->est->enable &&
-		    priv->est->max_sdu[queue] &&
-		    xdp_desc.len > priv->est->max_sdu[queue]) {
+		if (priv->est.enable && priv->est.max_sdu[queue] &&
+		    xdp_desc.len > priv->est.max_sdu[queue]) {
 			priv->xstats.max_sdu_txq_drop[queue]++;
 			continue;
 		}
@@ -4843,13 +4842,12 @@ static netdev_tx_t stmmac_xmit(struct sk_buff *skb, struct net_device *dev)
 	if (skb_is_gso(skb))
 		return stmmac_tso_xmit(skb, dev);
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue]) {
+	if (priv->est.enable && priv->est.max_sdu[queue]) {
 		sdu_len = skb->len;
 		/* Add VLAN tag length if VLAN tag insertion offload is requested */
 		if (priv->dma_cap.vlins && skb_vlan_tag_present(skb))
 			sdu_len += VLAN_HLEN;
-		if (sdu_len > priv->est->max_sdu[queue]) {
+		if (sdu_len > priv->est.max_sdu[queue]) {
 			priv->xstats.max_sdu_txq_drop[queue]++;
 			goto max_sdu_err;
 		}
@@ -5253,9 +5251,8 @@ static int stmmac_xdp_xmit_xdpf(struct stmmac_priv *priv, int queue,
 	if (stmmac_tx_avail(priv, queue) < STMMAC_TX_THRESH(priv))
 		return STMMAC_XDP_CONSUMED;
 
-	if (priv->est && priv->est->enable &&
-	    priv->est->max_sdu[queue] &&
-	    xdpf->len > priv->est->max_sdu[queue]) {
+	if (priv->est.enable && priv->est.max_sdu[queue] &&
+	    xdpf->len > priv->est.max_sdu[queue]) {
 		priv->xstats.max_sdu_txq_drop[queue]++;
 		return STMMAC_XDP_CONSUMED;
 	}
@@ -8106,6 +8103,7 @@ static int __stmmac_dvr_probe(struct device *device,
 	stmmac_napi_add(ndev);
 
 	mutex_init(&priv->lock);
+	mutex_init(&priv->est_lock);
 	rwlock_init(&priv->ptp_lock);
 
 	stmmac_fpe_init(priv);
@@ -8238,6 +8236,7 @@ void stmmac_dvr_remove(struct device *dev)
 	stmmac_mdio_unregister(ndev);
 
 	destroy_workqueue(priv->wq);
+	mutex_destroy(&priv->est_lock);
 	mutex_destroy(&priv->lock);
 	bitmap_free(priv->af_xdp_zc_qps);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
index 3bfcc9760dce..2a4099fe470c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
@@ -69,11 +69,11 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 	nsec = reminder;
 
 	/* If EST is enabled, disabled it before adjust ptp time. */
-	if (priv->est && priv->est->enable) {
+	if (priv->est.enable) {
 		est_rst = true;
 		mutex_lock(&priv->est_lock);
-		priv->est->enable = false;
-		stmmac_est_configure(priv, priv, priv->est,
+		priv->est.enable = false;
+		stmmac_est_configure(priv, priv, &priv->est,
 				     priv->plat->clk_ptp_rate);
 		mutex_unlock(&priv->est_lock);
 	}
@@ -91,19 +91,19 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
 		mutex_lock(&priv->est_lock);
 		priv->ptp_clock_ops.gettime64(&priv->ptp_clock_ops, &current_time);
 		current_time_ns = timespec64_to_ktime(current_time);
-		time.tv_nsec = priv->est->btr_reserve[0];
-		time.tv_sec = priv->est->btr_reserve[1];
+		time.tv_nsec = priv->est.btr_reserve[0];
+		time.tv_sec = priv->est.btr_reserve[1];
 		basetime = timespec64_to_ktime(time);
-		cycle_time = (u64)priv->est->ctr[1] * NSEC_PER_SEC +
-			     priv->est->ctr[0];
+		cycle_time = (u64)priv->est.ctr[1] * NSEC_PER_SEC +
+			     priv->est.ctr[0];
 		time = stmmac_calc_tas_basetime(basetime,
 						current_time_ns,
 						cycle_time);
 
-		priv->est->btr[0] = (u32)time.tv_nsec;
-		priv->est->btr[1] = (u32)time.tv_sec;
-		priv->est->enable = true;
-		ret = stmmac_est_configure(priv, priv, priv->est,
+		priv->est.btr[0] = (u32)time.tv_nsec;
+		priv->est.btr[1] = (u32)time.tv_sec;
+		priv->est.enable = true;
+		ret = stmmac_est_configure(priv, priv, &priv->est,
 					   priv->plat->clk_ptp_rate);
 		mutex_unlock(&priv->est_lock);
 		if (ret)
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
index 42a00446e9b4..357d1eaf0d7d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
@@ -959,7 +959,7 @@ static void tc_taprio_map_maxsdu_txq(struct stmmac_priv *priv,
 		count = qopt->mqprio.qopt.count[i];
 
 		for (j = offset; j < offset + count; j++)
-			priv->est->max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
+			priv->est.max_sdu[j] = qopt->max_sdu[i] + ETH_HLEN - ETH_TLEN;
 	}
 }
 
@@ -1023,24 +1023,15 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	if (qopt->cycle_time_extension >= BIT(wid + 7))
 		return -ERANGE;
 
-	if (!priv->est) {
-		priv->est = devm_kzalloc(priv->device, sizeof(*priv->est),
-					 GFP_KERNEL);
-		if (!priv->est)
-			return -ENOMEM;
-
-		mutex_init(&priv->est_lock);
-	} else {
-		mutex_lock(&priv->est_lock);
-		memset(priv->est, 0, sizeof(*priv->est));
-		mutex_unlock(&priv->est_lock);
-	}
+	mutex_lock(&priv->est_lock);
+	memset(&priv->est, 0, sizeof(priv->est));
+	mutex_unlock(&priv->est_lock);
 
 	size = qopt->num_entries;
 
 	mutex_lock(&priv->est_lock);
-	priv->est->gcl_size = size;
-	priv->est->enable = qopt->cmd == TAPRIO_CMD_REPLACE;
+	priv->est.gcl_size = size;
+	priv->est.enable = qopt->cmd == TAPRIO_CMD_REPLACE;
 	mutex_unlock(&priv->est_lock);
 
 	for (i = 0; i < size; i++) {
@@ -1065,7 +1056,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 			return -EOPNOTSUPP;
 		}
 
-		priv->est->gcl[i] = delta_ns | (gates << wid);
+		priv->est.gcl[i] = delta_ns | (gates << wid);
 	}
 
 	mutex_lock(&priv->est_lock);
@@ -1075,22 +1066,22 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	time = stmmac_calc_tas_basetime(qopt->base_time, current_time_ns,
 					qopt->cycle_time);
 
-	priv->est->btr[0] = (u32)time.tv_nsec;
-	priv->est->btr[1] = (u32)time.tv_sec;
+	priv->est.btr[0] = (u32)time.tv_nsec;
+	priv->est.btr[1] = (u32)time.tv_sec;
 
 	qopt_time = ktime_to_timespec64(qopt->base_time);
-	priv->est->btr_reserve[0] = (u32)qopt_time.tv_nsec;
-	priv->est->btr_reserve[1] = (u32)qopt_time.tv_sec;
+	priv->est.btr_reserve[0] = (u32)qopt_time.tv_nsec;
+	priv->est.btr_reserve[1] = (u32)qopt_time.tv_sec;
 
 	ctr = qopt->cycle_time;
-	priv->est->ctr[0] = do_div(ctr, NSEC_PER_SEC);
-	priv->est->ctr[1] = (u32)ctr;
+	priv->est.ctr[0] = do_div(ctr, NSEC_PER_SEC);
+	priv->est.ctr[1] = (u32)ctr;
 
-	priv->est->ter = qopt->cycle_time_extension;
+	priv->est.ter = qopt->cycle_time_extension;
 
 	tc_taprio_map_maxsdu_txq(priv, qopt);
 
-	ret = stmmac_est_configure(priv, priv, priv->est,
+	ret = stmmac_est_configure(priv, priv, &priv->est,
 				   priv->plat->clk_ptp_rate);
 	mutex_unlock(&priv->est_lock);
 	if (ret) {
@@ -1106,19 +1097,17 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
 	return 0;
 
 disable:
-	if (priv->est) {
-		mutex_lock(&priv->est_lock);
-		priv->est->enable = false;
-		stmmac_est_configure(priv, priv, priv->est,
-				     priv->plat->clk_ptp_rate);
-		/* Reset taprio status */
-		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
-			priv->xstats.max_sdu_txq_drop[i] = 0;
-			priv->xstats.mtl_est_txq_hlbf[i] = 0;
-			priv->xstats.mtl_est_txq_hlbs[i] = 0;
-		}
-		mutex_unlock(&priv->est_lock);
+	mutex_lock(&priv->est_lock);
+	priv->est.enable = false;
+	stmmac_est_configure(priv, priv, &priv->est,
+			     priv->plat->clk_ptp_rate);
+	/* Reset taprio status */
+	for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
+		priv->xstats.max_sdu_txq_drop[i] = 0;
+		priv->xstats.mtl_est_txq_hlbf[i] = 0;
+		priv->xstats.mtl_est_txq_hlbs[i] = 0;
 	}
+	mutex_unlock(&priv->est_lock);
 
 	err = stmmac_fpe_map_preemption_class(priv, priv->dev, extack, 0);
 

-- 
2.53.0

