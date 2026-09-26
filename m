Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F2336CE19
	for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 15:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437784; cv=none; b=Xj72fu8dF0hUYG29pN0O+wigbp1wYQKUOZqwQDvrYT233q1041r/LKxF3Ca07+HaZ7Cu2dSYmzGy64+rnDaa9QT+B9WaLMwbD9DzENiQ+dO0EWAVCuYxNDArGSHix+Lib/RlUdBuG7mUvWio9U6WP2WO9xKRJcIQkjQgjzFk62o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437784; c=relaxed/simple;
	bh=Fs1fLcJcakNPYti2xesmjolkKKjRCOnYepmgSWO4EZk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rNupLgZ8ONfaegSyNUB49TepdivpkZnrpsTkjk6lPA/BJ1FTJosHe3IuhY4+uByh8oqqpP+XCuKRgzfHuEg2hFmYo1REZO+xeqQs9ZZegpRKCz1QVDRXwR0jyPjUKjd+k2Fr7B/6al+eFasduDXrJ3kGcCgFbmOgheR6mvAnu1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ezwJTl+8; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ezwJTl+8"
Received: by mail-oo2-f42.google.com with SMTP id 006d021491bc7-6d797cfdd5fso186811eaf.2
        for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 08:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437772; x=1791042572; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XgjZN8ALEfDluGPl+zvIInMEXTqsuH7e7EhuIKCn+Ic=;
        b=ezwJTl+8XDy6ICdAkHU/Oz1I3/PWGtlErLyaBdFVE6ig6/5vaU7gLAQTbh3nNBJcLc
         44BioCN6vLGK6fDOy7e/CG4DyWy4RI4x3jR3155XjdL/l3G2mepIzWYESh89HVpetz2r
         3LTlIvCU2SxTvegPUS0dnvgOCO1CqTPRRDnlbHN1N4gssRNirzP6wawTIwGMnPAFV4d3
         /TMKh3PHokjkvNssBQmdcLu9o4mRyHrdqJoZwtXggI5VoG4ZhHu5m8x1AQrRXr1aWRUU
         dbsEzjIVp1d3FNiJze0BsVs6MmtD6yRJQsc5vFM6tRLeChL/4gQ2E3Kv40CDvePaR8Y+
         TcSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437772; x=1791042572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XgjZN8ALEfDluGPl+zvIInMEXTqsuH7e7EhuIKCn+Ic=;
        b=D3OmyDaW2+t5B9O1q0Coi5Oem3O0Zzi0eFEknTT+x9ou8O5ZgNSqDDTIGwrBO1BupY
         rwDlZmvKcWnronfr8SbjVWB/piPoVh8wSP961RyLYU1eJEk5+89legjWFCiQtID1Okm8
         xoGrMjww5CqmyTieV4/5O1cd4EUhsa2ZKWJuTl8gvAM+u+o0QkolJ3WSoy17TnwipW/3
         2O2YZWRTfXrkOXsS3ejxyhNTn5gk8xubR/J+FRIi2KkPRs/4dBHLWb+katWM1OEVoxyO
         0VwLabZo0LuA5HAP4vqYZxasSQXEU5SUymd8WW8s0COwdsCcSlpuuR07zbQPxT+hxkV9
         nEMA==
X-Forwarded-Encrypted: i=1; AKwUvBzVTck5Rl3JppooUs7gob1NwQrMqBDV+deBND5PHeehmhynniGABztvVW5QIkTI295m0EjH+LvhtUJGRA==@vger.kernel.org
X-Gm-Message-State: AFuF++kpUa78Ktt6FVADMzxUWch1Wr0FAOVMro4IZkjBYQ9VBG4crcmv
	fqyLvrtshNxdZt8rvz4TDYbuXk54YfBEVGf16DmSpIzGNIFoGG2BNJLb
X-Gm-Gg: AYBFou3dZEb5xH5rhzkgNoYJrJB6SDy8WP65oO02u3XoYDTyY5jwq7A+PprsJ/3dNpI
	m1qWlMOcKUM7nvMqlmY6ynFu7/8QGNmSaJDncnwsWi1jYSW72BBM0jcj7oPxRN2HpLq8FInCg0g
	ZyzhrlrrBLhXShfBogCtklw2k5obcoXiLdtSITwugTqNyPvjoqMNcR2E0ptoKTigWLYClK+qpz1
	kUtSSPcz590lvG4i4R7Fcvx5t8mn2m7VC1qE0lcDjSp4oLBwqQpZ/Kl+K8NZZCUv5G4+zWXPKbl
	R48FLqP8045X/hmza4pB8ufnpp8cLejdas6fRH5yDQCl660H+aG03BDu9KrA5v6F98rJNgGoXnm
	P1SG3mI1qyjJSNUK0ZVMpbchH5lTO1gkYAfJ6xOKFx34Iee4m6Jjt1Q3w9xhfBNFGuQ8uguvgz3
	0preQY2FXFY4y7b+vrtZWU0ikV00UHnYQl6SShlIQ1vRdS5fLZYrDMt4KZnl3vSpZvgGN4cEpC7
	gDiDQ/SBTx/ET8B7cJyIGutwB6sDZh81P9Vw5fOTzFpG29m71Fnax/M8L00njgFTtYhpih/7t8Z
	RHWyqLj+RpRKxmSgz+HTHazl9Gz/DfvkCjx0kAshAFSz5x/WJyA62q0DFVwH+1VY/HK/qQrnyo0
	LcPFRzQqIdxdj7zm0vvDHIEXCE7lCujg=
X-Received: by 2002:a05:6820:f02d:b0:6b4:117e:543 with SMTP id 006d021491bc7-6d43f7a6d39mr9544686eaf.21.1790437771939;
        Sat, 26 Sep 2026 08:49:31 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:49:01 -0600
Subject: [PATCH net v4 06/15] net: stmmac: leave the datapath running for
 normal-size MTU changes
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-6-ec1c0250b3c9@gmail.com>
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

Changing an MTU at or below ETH_DATA_LEN does not change the receive
buffer size or the MAC receive limit when the previous MTU was also in
that range. Do not release and reopen the datapath for those changes.

Besides avoiding unnecessary hardware resets and their failure paths,
this keeps live AF_XDP pool bindings intact. Preparing replacement rings
before stopping the old rings otherwise binds the pool to a temporary
RXQ and consumes fill-ring entries while its current RXQ is still
active. XDP already rejects jumbo MTUs, so all supported live XDP MTU
changes can use this path without preparing replacement rings.

Keep jumbo transitions on the existing reinitialization path for now.
The later ownership and rollback changes address that path separately.

Fixes: 3470079687448 ("net: ethernet: stmicro: stmmac: permit MTU change with interface up")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 8b0bc7c46df9..bdebc5bfa2b8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -6166,7 +6166,12 @@ static int stmmac_change_mtu(struct net_device *dev, int new_mtu)
 	if ((txfifosz < new_mtu) || (new_mtu > BUF_SIZE_16KiB))
 		return -EINVAL;
 
-	if (netif_running(dev)) {
+	/* Normal-size frames use the same buffers and MAC receive limits.
+	 * In particular, do not disturb a live AF_XDP pool: XDP does not
+	 * support jumbo frames, so it never needs the ring replacement below.
+	 */
+	if (netif_running(dev) &&
+	    (dev->mtu > ETH_DATA_LEN || mtu > ETH_DATA_LEN)) {
 		netdev_dbg(priv->dev, "restarting interface to change its MTU\n");
 		/* Try to allocate the new DMA conf with the new mtu */
 		dma_conf = stmmac_setup_dma_desc(priv, mtu);

-- 
2.53.0

