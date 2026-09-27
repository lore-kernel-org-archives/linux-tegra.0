Received: from mail-oo2-f38.google.com (mail-oo2-f38.google.com [74.125.231.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE53C3CFF66
	for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546398; cv=none; b=amojgs7eQvMrxdiOp4NfgTPBQsvd8Vwp7mx4K2VmDqFTNm3S3sVDOfAWgX7Ckf8nFx1r9kisLwPe12QKOWMV3azY7OFL1JYNrLyqD0CPgNKKh+VeFimTyHzeyceZ3QbjZbtaV8FWhFKgA/a6hVcS0yuZbSqqFXr9Uo/R7rPcxmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546398; c=relaxed/simple;
	bh=Y0o1r20SUN85wmZaOSkDQLTs++Jzg9wfmOIT41V9CN8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PU94cOcuK/4gUdu/uilOwfHw1oKCJkAXZRUOfMLPEbcqZdK9k0nJtZI9KqSKcAaCKH9Mx4uJWKS/yGyP8paP0/ZUDeSQgeJx+ijdfDrXQYyDqZr6kTCzh7nGY+WFfAEu8nUx4uvaE4yL/4GdNzvgz3LBE5YRXSOHci4YYLglS1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQXx0HGN; arc=none smtp.client-ip=74.125.231.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQXx0HGN"
Received: by mail-oo2-f38.google.com with SMTP id 46e09a7af769-8138dddb94bso1759937a34.2
        for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 14:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546391; x=1791151191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AOmjI/wuMW3PMPrcgaqqBQf7jBpBeERU9IwSvc2Be6c=;
        b=ZQXx0HGNdGvUJyf7MjcmhSYyc1sNCTHJ9Ee9kHQ6LRMTUgO8gtVDcyAqXizRUDBZ6s
         PGHajSq0OTRlIl0zqXPVfHlg0/ecMWiv/pGkQb32uqDLvcxyDqlJSLDc4L9lJn08Brem
         TdUGL8FIZhA3f6RCL7e/3l8gXxQiTducIo2qaJ2LaHxza5LcgmXM7ijOwQKk27W9HtKi
         7D9K/6HTyCu1P3oWza5gg+8od67QNMYjJXYxhuTZa/1cfyTDLFNmwKfDGhaeKtcDAgMo
         6QW0UqAleTzM9LyFQa0HuQfihBtbv5o9QDuEn3kh0ur03t879rqW/i3huIjmFU7ocQ1Z
         dbqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546391; x=1791151191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AOmjI/wuMW3PMPrcgaqqBQf7jBpBeERU9IwSvc2Be6c=;
        b=ReNROboJZj/B+7rLlIQnVwDNeoK9DWoN/lSdlM6Mg15Xgr29Nn47ebb0NOdDcXNVpN
         aITwcsHk/VsxENrK0UCtx6VA2/XTRxF60aKc13rCOXi1rpoQh+KojGP8uJMpG2ZSlJp3
         kawzRlwUlR0rCS1ArdIcEZXxxVzPYREtHSSxIfOM+NvJrr5XUSRyIxwkcLQ/CRy16B2P
         cjTNqL89CHmRaC/lF/x3sgNU2Jrs0DdNVxMdPLVk+w7bu8I5P6orOxOEmqAAQAAeHJA7
         pXh3ZwD2UnAfFqEP+HKjwVYRhFQuLEgRsRh6E4IVAcwXOtpEldnZFwgSYHbbubjl4gqa
         DKkw==
X-Forwarded-Encrypted: i=1; AKwUvBwUHzQgCwgALsyq9pUpLgWAetGaIUz3Sbe9B3JCo/odRl84flywfNZx4kQu0mrqTBATCWZW4jCFLXZE7w==@vger.kernel.org
X-Gm-Message-State: AFuF++koLeTqXtlEnsdoJvjQQ7L+aux7LrG5zQv2PYCfTTBrbBx27x3w
	GBjCnhi8W8jP6M7KGk5Ek9VGdW6W1vHpLU8SH85NYU1R5QLQFhFHeWoC
X-Gm-Gg: AYBFou38Lar35xCgLOhHGRu4l/xf9CmPcYJG6eWZDIWb5PQ3mcllX2dRRV7UXop938N
	lEzXEcl/2t/LBz6foP++GN4FcNmJA2K0SRL8O7jPvWXYdUQbxq++al+7TF87f7GGufQIa76p0jS
	03YBCcLpNhM4kFtJOgzAf9b6//pr/BwgAetDhlZI8aQZUi6ZV8FpMzG8vI37qByYbC9+P2LR8TL
	MLCuVjrWeSSVFzMtKdz1udnqCpxoDBSxWxpRHTcVunRgwuer0MvEFu/v09oeHo54NWx1hOHZUxF
	Q9FcrA4Y8D2XOx/PmSoz30z1c6hW4cWMxRn8voyj2/EUfNhCGSTBWQs1+9gA8WfuOe9uYlYNVws
	/sTyl8jGc7BlkSCYDPJ9Cyirxg5Zf/8ks3sBrCqppkW8TT7TDC9uOMrK9e9aphy7fjkmV+IAQO2
	7mxvmV+jg8DDFI1H3KIN294ZWCGEDKSct9zqqX5evvt6jsO6tV4pbndgmzPKxNZ7c9xmWTjOO51
	ImrVTOB82BhQo6GpzTjZQ4fnS5A/+HfYSH1t7T7T7ZD3zHdT6B7+BA+fxFTe9FxKk5BpRwDipTm
	uUXzlD9/wPEt0gUOyLslUGMG7g+opbdixJ3Y0lRXG0jb3Zb4ZADC+HARz4YkVRXnI1lQK4C7OaZ
	7M9v+VqhQoKgnWV9RWQL0
X-Received: by 2002:a05:6820:811:b0:6d8:e5d4:9539 with SMTP id 006d021491bc7-6d8e5d495e2mr1540745eaf.25.1790546390675;
        Sun, 27 Sep 2026 14:59:50 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:50 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:37 -0600
Subject: [PATCH net-next v5 02/19] net: stmmac: request the MDIO reset GPIO
 only once
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-2-feec6c14dd06@gmail.com>
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
 linux-sunxi@lists.linux.dev, James Hilliard <james.hilliard1@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2

From: Linkui Xiao <xiaolinkui@kylinos.cn>

stmmac_mdio_reset() calls devm_gpiod_get_optional() every time it runs.
A GPIO line can only be requested once, so from the second call on
gpiod_request_commit() returns -EBUSY. devm_gpiod_get_optional() only
turns -ENOENT into NULL, hence the error is passed straight back and
stmmac_mdio_reset() bails out before pulsing "snps,reset" and before
running the STE101P MDC workaround.

The first call, made by of_mdiobus_register(), succeeds, so the failure
is only visible later on: every resume that does not use WoL goes
through stmmac_resume() -> stmmac_mdio_reset(), and that caller ignores
the return value, so the PHY silently stays un-reset.

The descriptor used to be requested exactly once: stmmac_mdio_reset()
resolved "snps,reset-gpio" itself and cached the GPIO number in
stmmac_mdio_bus_data::reset_gpio, and commit ae26c1c6cb9b ("stmmac: fix
PHY reset during resume") relies on that cache to reuse the line on
every call. commit 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in
stmmac_mdio_reset") replaced it with a devm_gpiod_get_optional() that
caches nothing, so the request is repeated on every call and fails from
the second one on.

Parse the whole reset description, the GPIO and "snps,reset-delays-us",
in stmmac_mdio_register() at probe time, and keep it in struct
stmmac_priv. This is where devm-gpiod is meant to be used: the line is
acquired with the device and released with it, and any failure to
acquire it is reported during probe instead of being ignored by
stmmac_resume(). stmmac_mdio_reset() then only pulses the cached line,
with the delays that were read once and for all at probe time.

Cache the request and delays for DT devices regardless of
mdio_bus_data->needs_reset. That flag controls the registration-time
bus reset callback, but system resume calls stmmac_mdio_reset()
directly. The reset routine no longer looks at the device tree: where
the description is absent the cached descriptor is NULL and the delays
are zero, so the pulse remains a no-op.

Keep acquisition conditional on CONFIG_STMMAC_PLATFORM, matching the
reset callback, so non-platform configurations do not request an unused
GPIO. Also skip acquisition for a disabled MDIO child: registering that
bus returns -ENODEV without calling its reset callback, and the driver
must retain the existing disabled-bus success path even if the unused
GPIO is unavailable. Remove the unnecessary gpio_desc forward declaration.

Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_reset")
Cc: stable@vger.kernel.org
Signed-off-by: Linkui Xiao <xiaolinkui@kylinos.cn>
Co-developed-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  2 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 50 +++++++++++------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 4fc96b317d79..83c30b39f704 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -287,6 +287,8 @@ struct stmmac_priv {
 
 	unsigned int pause_time;
 	struct mii_bus *mii;
+	struct gpio_desc *mdio_reset_gpio;
+	u32 mdio_reset_delays[3];
 
 	struct stmmac_pcs *integrated_pcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..63287ad9652f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -384,33 +384,16 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 	struct stmmac_priv *priv = netdev_priv(bus->priv);
 	unsigned int mii_address = priv->hw->mii.addr;
 
-#ifdef CONFIG_OF
-	if (priv->device->of_node) {
-		struct gpio_desc *reset_gpio;
-		u32 delays[3] = { 0, 0, 0 };
+	if (priv->mdio_reset_delays[0])
+		msleep(DIV_ROUND_UP(priv->mdio_reset_delays[0], 1000));
 
-		reset_gpio = devm_gpiod_get_optional(priv->device,
-						     "snps,reset",
-						     GPIOD_OUT_LOW);
-		if (IS_ERR(reset_gpio))
-			return PTR_ERR(reset_gpio);
+	gpiod_set_value_cansleep(priv->mdio_reset_gpio, 1);
+	if (priv->mdio_reset_delays[1])
+		msleep(DIV_ROUND_UP(priv->mdio_reset_delays[1], 1000));
 
-		device_property_read_u32_array(priv->device,
-					       "snps,reset-delays-us",
-					       delays, ARRAY_SIZE(delays));
-
-		if (delays[0])
-			msleep(DIV_ROUND_UP(delays[0], 1000));
-
-		gpiod_set_value_cansleep(reset_gpio, 1);
-		if (delays[1])
-			msleep(DIV_ROUND_UP(delays[1], 1000));
-
-		gpiod_set_value_cansleep(reset_gpio, 0);
-		if (delays[2])
-			msleep(DIV_ROUND_UP(delays[2], 1000));
-	}
-#endif
+	gpiod_set_value_cansleep(priv->mdio_reset_gpio, 0);
+	if (priv->mdio_reset_delays[2])
+		msleep(DIV_ROUND_UP(priv->mdio_reset_delays[2], 1000));
 
 	/* This is a workaround for problems with the STE101P PHY.
 	 * It doesn't complete its reset until at least one clock cycle
@@ -608,6 +591,23 @@ int stmmac_mdio_register(struct net_device *ndev)
 	if (!mdio_bus_data)
 		return 0;
 
+	/* Resume calls stmmac_mdio_reset() even when registration does not
+	 * install a bus reset callback, so cache its resources in both cases.
+	 */
+	if (IS_ENABLED(CONFIG_STMMAC_PLATFORM) && dev_of_node(priv->device) &&
+	    (!mdio_node || of_device_is_available(mdio_node))) {
+		priv->mdio_reset_gpio =
+			devm_gpiod_get_optional(priv->device, "snps,reset",
+						GPIOD_OUT_LOW);
+		if (IS_ERR(priv->mdio_reset_gpio))
+			return PTR_ERR(priv->mdio_reset_gpio);
+
+		device_property_read_u32_array(priv->device,
+					       "snps,reset-delays-us",
+					       priv->mdio_reset_delays,
+					       ARRAY_SIZE(priv->mdio_reset_delays));
+	}
+
 	stmmac_mdio_bus_config(priv);
 
 	new_bus = mdiobus_alloc();

-- 
2.53.0

