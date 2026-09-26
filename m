Received: from mail-oo2-f13.google.com (mail-oo2-f13.google.com [74.125.231.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2283134252C
	for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 15:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437772; cv=none; b=DZKI2nCLUcmIwMRgjX9zMPPpu+PBWp5efawSHYeacSMvVAhIGur3S7D8GhviPIkV0VNxqxIu1Fd6764T+e4R70gqCDL3pMAbQlJH/vV+p0HygrHoaGNEcf3I3w8QLx7zTBc6KL6mZ6Qf/hKfq+KG+JJC7SUiS7D20e6dwNIzG3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437772; c=relaxed/simple;
	bh=U0usEgD6eBVSyAl+4wuE0PhgO7aYIcSIWGg7AGP8BEg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WDqhKvrFx44Bd4qnQHN2R2pt7r6GbyfdaVJBwttcLWpcaIPSD+kzstYgukyELhJCYZ6qFxCHogmpjCdHd6+dtHdBLMPP/ILvi9z16i8FKNhzsMyQk5gK4EnoXacE85RsSJh50OHmGJZOdkRQqFAQEQr2Jw+Fk4SfBiW4vmlDtvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sRuhkRGd; arc=none smtp.client-ip=74.125.231.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sRuhkRGd"
Received: by mail-oo2-f13.google.com with SMTP id 006d021491bc7-6d7a52c9d62so127505eaf.1
        for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 08:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437763; x=1791042563; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0ScVIX3sPn/yQi4OeJT/F76Vd8VPP2euaNmJMN8ERw=;
        b=sRuhkRGd0u8nkOxa0GXrwphVrHhk1n3TOpBZ8Ki/iyxUfciGgghFsVF6tpv6Ttd7uS
         ASNaisI4iRsAK26INUqWMlXgR6DQuFiZhjXX0WyulRfkpsjnfZ2/DIdywIgrVZ08XFTD
         IZmUGtFkkLP9NQODz66uQUePhgLso6vCFuWu67JQ81fgzWZqIGjZHz/2QgYkvFRwvYN/
         RzXDykVxoV42Mnox1uwvBeIJ56SZLTxa17EnDIjZJFfrTT/LK3n9H4gE/NQZBEXfeB4B
         yCVpd1ec1iwItV2xGrF1tbdFpRymprAE60ajlhRNx8p5PlIANw5cVjB3hCoZwD79SsCf
         dOPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437763; x=1791042563;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0ScVIX3sPn/yQi4OeJT/F76Vd8VPP2euaNmJMN8ERw=;
        b=Re89K3xXff5hWx0lbyZuIzx0NrmU6zid/p0IZJTbt/6QVnp5oueoAXtypF3Xc/m0Bk
         GOrVHkCO+kLseP+bK4DB93QycNwefHRYHjuZyk+K1QmazdMRRNjp51/Wy9A2cwPwcP4j
         wySQWMvL/ge+6RKfVeUVUYf5qlOGGkCq3DF2gtYqnTTGhxDwahM32oFXGBQ3WnxiHpBE
         UU2OezdzOlXhXnJpyrEKprp3luxMSlXyfYFBR61qKzVfhLPRxxBiBwnn1VOhkGrFR5+c
         jkGkaxuRfuWPyibotQrpcBXkH8roexXrC96iIGIpNkVrbAp3XEZdtud72OKcNTewwbjC
         D17A==
X-Forwarded-Encrypted: i=1; AKwUvBzBbSTTF5HQejVvnpLY0AK8qwwU3eMTVuvMZwnPy++jaOfXacumzshHutdhd+dqM5FJ5Rm/bDsXCLqrkg==@vger.kernel.org
X-Gm-Message-State: AFuF++ndZdx4C4+C5KkGNGBH6E/D+vyju4P1bvZg1aCDM7sgF99Vu3Vc
	dAFY/QCLnaq4tUwiACu6D68ezmAmuskn80a0JkWEkCOSo7CqK/MzzgGu
X-Gm-Gg: AYBFou1A3iNtvjBmLGcqZTXlAaAcLgrONpbgNA4sl/OnuIMWvlwBnFpuR8v3x+8JbPw
	1p5/LXDzzlL3fYwTI1eEtXD2OY59wLJ0prz/mUeFyFhhRrzuDNfTYgbVm1wULhZy9Ybi+iEibZb
	efzvkbhPBUgRFWvCA8aEoR+X+ylkQ/P0094C+rF7fcXh8oG/Q2Dn1X1srqyRnn51UWaR5fNoU27
	vKif+veWpt9nFWXU5gtxYdFYAgOCRdCzZ7QLJsOf5HIklb0cP/bsuuIN0oDsD7y5M245l+D3Wh2
	BWbSTo+5w672oxBiBBJdzrMcmRffouNoBekSHGugdHOmmTXoPnqE+zw11lZWrqcdqlb591IsRUx
	Vy1gmqxGBwe7guUq1sNum7V1+CBg0JjFmbfxVcoso1pklfbu8sbzYYlJSSN5KdHYwldefyuFf2h
	3/lg6Yt8NKYGSj40bnkXFROCtIK9wl5uHQHDprTj8zYf6iRQTQGdI1YDllsLc6TnyOrNIIZw7Cb
	vHpmbK6We2pEWgnAuWAoKyE3e4U6qUUbVBODTvlzeL46t7HzI1irMABi236Ng09hwqe8xxqTBzj
	y2W1/jI/SdYG70Y2rOsEaX+5JJG7oPplgU+E1kYTPQC10VYEODYxN6HDPD+7QPchfk+6QCB6t4X
	AZ2K1er6AQULxhpKM+qk/
X-Received: by 2002:a05:6820:1ca6:b0:6d3:402e:1fca with SMTP id 006d021491bc7-6d43ebf0448mr8754440eaf.9.1790437762887;
        Sat, 26 Sep 2026 08:49:22 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:57 -0600
Subject: [PATCH net v4 02/15] net: stmmac: reuse the MDIO reset GPIO on
 resume
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-2-ec1c0250b3c9@gmail.com>
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

MDIO bus registration acquires the optional snps,reset GPIO through
devres. A later bus reset must reuse that descriptor: requesting the
same exclusive GPIO again returns -EBUSY while devres still owns it.
Cache the successfully acquired descriptor for subsequent resets.
Propagate acquisition errors without caching an error pointer.

Fixes: 7c86f20d15b7 ("net: stmmac: use GPIO descriptors in stmmac_mdio_reset")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      |  1 +
 drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7582fca63741..c7c876408d85 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -287,6 +287,7 @@ struct stmmac_priv {
 
 	unsigned int pause_time;
 	struct mii_bus *mii;
+	struct gpio_desc *mdio_reset_gpio;
 
 	struct stmmac_pcs *integrated_pcs;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
index afe98ff5bdcb..07d5eab05996 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_mdio.c
@@ -386,14 +386,20 @@ int stmmac_mdio_reset(struct mii_bus *bus)
 
 #ifdef CONFIG_OF
 	if (priv->device->of_node) {
-		struct gpio_desc *reset_gpio;
+		struct gpio_desc *reset_gpio = priv->mdio_reset_gpio;
 		u32 delays[3] = { 0, 0, 0 };
 
-		reset_gpio = devm_gpiod_get_optional(priv->device,
-						     "snps,reset",
-						     GPIOD_OUT_LOW);
-		if (IS_ERR(reset_gpio))
-			return PTR_ERR(reset_gpio);
+		/* The bus reset also runs on resume. Devres retains the GPIO
+		 * until unbind, so do not request an already owned line again.
+		 */
+		if (!reset_gpio) {
+			reset_gpio = devm_gpiod_get_optional(priv->device,
+							     "snps,reset",
+							     GPIOD_OUT_LOW);
+			if (IS_ERR(reset_gpio))
+				return PTR_ERR(reset_gpio);
+			priv->mdio_reset_gpio = reset_gpio;
+		}
 
 		device_property_read_u32_array(priv->device,
 					       "snps,reset-delays-us",

-- 
2.53.0

