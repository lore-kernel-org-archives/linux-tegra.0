Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93D5370D6D
	for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 15:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790437764; cv=none; b=m0gw2c2nA7GQUouyC3na3fSBF88qLEGmecWe7jLS1ioj2E9AJGlF0YDg6h4DFnOi7By3hNsoqwLV/xV2PS+9WIzkx4aWo9LdtCMExAJQj6m7WW3McnvTOpPQ9K7fHO3LT4cE4ux5n8OQgUK3OhFj0PrWCe9V3LulHlEENdDnZHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790437764; c=relaxed/simple;
	bh=KS/8rL8UeoBvoNAjD7fEnF4xbmiricnrL+uNpL65yjc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nHilDfrxNPjckBYiVbC/nmQgyPXzcbZY7neYibMIKZUS/wB50ZwP+zl6RYsoEr8V7hgYC67etsdJ6dtVKMD/RNsaPOTM7mTK+kXgyOnR5cT3MLkYF/eHTK3GU3B7CD1TKAKb2AdtKdZebf/gMrMjRuz5rC2VRot+0lRP7p9L4ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZYQj66vV; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZYQj66vV"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b15bca7e0so202280a34.2
        for <linux-tegra@vger.kernel.org>; Sat, 26 Sep 2026 08:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790437761; x=1791042561; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ux2E3gKwjBl0LaPoZnc38g0A76GDt8ClA7XYMblBPIo=;
        b=ZYQj66vVNAQ2yWSuR657ndMiocyvCVppkJ8SN8xr50O2vMUbx6YcXkYGykxb2qTNhk
         PWfwfp0VXMqN9s5iPOe4sbHlNBftKWszL9A9sfPlzBDIjm1fL/+ViSwIZKj+tLMgr0WA
         7kBszEVWIazl8H38sKrQ2qLgnNmn2sVe8fvODgHr9ETwcrYd01ZRI8r+ddiXYhNBpBhj
         cPfsYtMfEF5ckF0hOzG+GcmBiieOVoYggrVt9WXL3zbC0XM8Kz6cwyoXJ26BeZjkbPQp
         0YI1lgtJsRQGsDtU/xK/2bho1P+pL3weWYuSWRGEAHk4aQQqApJfJI2Zm+yCbH1NMsZ0
         wrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790437761; x=1791042561;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ux2E3gKwjBl0LaPoZnc38g0A76GDt8ClA7XYMblBPIo=;
        b=TNm4CQDM06tELuNExK/OcmaF2AURknG5/q1P25pfRGJEQjCfWQjkR9xG3RVvCEJLg7
         2BKcaZZ6MEpt0R/23dUqJbQrD48fG1lv6cwa53FxbH6GN9bO1favLkl1LCP1xLwBevD2
         3eLPotpExKWas10/AUo2LkLPPgwjyCerkElhJYWawQyJj4U126aMWLXAgJN7ffgxpHWy
         ty0c8WCjI3QELfU5u2Qt9NanbLVlKTEJeaIPiWLaxQ6A6zxVtt8B2L2rx3o5Hr2ZXSKa
         mdrZZetJZw2uR1pVdMfEukURKQHl1g1vY8OeKOCXbVnc5IfW4eSrc1DqBusAX0SDiotV
         /wAw==
X-Forwarded-Encrypted: i=1; AKwUvBxbsIOjbeA3KlGch/9YcjSWuQkUDcBn6CalIQr+oz8lVwvLdEAwzbmkky56eFSFGlFMi19/fzPND3smYA==@vger.kernel.org
X-Gm-Message-State: AFuF++nI19+AfxA+HHKcFm+yW+8SiougCGSx377K6PVjaFGmxCpJm8Hv
	tlSEFJF3H9krUlVjIN9KXi/9j/n66rhtDJ0fQF//9vs0NomeVUtGIwY9
X-Gm-Gg: AYBFou0fCV79roumXbuaYCHvRc6MET4gR+AtI4ZxE9XAoDisqAAj6oO2sy+7SIoGfah
	ScQDPtYGSvIxQjtgAywTL7uLxAesJ6f6U5wu6mQkQQ6MHOFrW/I83LEFFvs6XebaTFVzAJ9uUGV
	JBbytf7/AvPODWRSymzTwj4+a7ui9MW3QoOuwqhGT9jKpDyULbnjTf/c9c9vBF/h3r/Hgmk2eUG
	+kVZiAKV5nd8L6IsWtYlAqo0ISaUQ5qFhbSd0BIz/n3WDcwE97JfZ5kwZ0oUpSoBnJqPRE4ukbw
	Q+7X0XNPa1QV5C/p69Ju9rprRqo0nNzDZ8z4Itd/6KRPLxFbrU46PriADofKGyP96z5E15gQs+B
	MoOGJ7ZBDDBqFgN1aesUhNUYaObLu0Fj4FteSvjbgcGxMHMibLrnSOEA+s9OKAlN/3HHfSUU/SU
	TFNE1MiaJNcNjGij43R6wD5FHIqGS98DZvQ9fQo964QY1YS2sv5lP8ZjT+Jkg6U86ksFrXAtH8S
	0Tl4SWFzA831t6M8/OCYtaxgxPGilozxK+4w8LUSsxF0VvuVVCD0TnAs6K4DB2QJ0QtVjDq11Xa
	yscgfwW8d9ym2yf+sdYZsBJm4zv+769M2sCwbLWrCraOmHFTiDyfXYsmKA+95qAZ3D34OiEXaS8
	rhXl/AlU/SZzkDGeY0DxY
X-Received: by 2002:a05:6830:43ac:b0:7e9:ea28:4c1f with SMTP id 46e09a7af769-81781790b5emr8931706a34.8.1790437760721;
        Sat, 26 Sep 2026 08:49:20 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-818e98b16d4sm5442366a34.26.2026.09.26.08.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 08:49:20 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 26 Sep 2026 09:48:56 -0600
Subject: [PATCH net v4 01/15] net: stmmac: unwind the WoL IRQ after a
 safety IRQ request failure
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-submit-stmmac-reset-fixes-v1-v4-1-ec1c0250b3c9@gmail.com>
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

The IRQ setup paths request the MAC IRQ, then the optional WoL IRQ, then
the common safety IRQ. If requesting the safety IRQ fails, cleanup must
release the WoL and MAC IRQs, but not the failed safety IRQ.

The REQ_IRQ_ERR_SFTY case instead frees the safety IRQ and skips the WoL
IRQ. Allocation fault injection during live XDP reopening reproduces a
"Trying to free already-free IRQ" warning and leaves the WoL handler
registered after the datapath resources have been released. A subsequent
open can then fail to request that still-owned IRQ.

Move safety IRQ cleanup before REQ_IRQ_ERR_SFTY and WoL IRQ cleanup
after it. This restores reverse acquisition order for both shared and
MSI IRQ setup, including unwind after failures in later per-queue IRQ
requests.

Fixes: 5c2215167d12 ("net: stmmac: Add driver support for common safety IRQ")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 3f34d491c959..4f3d452c3503 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -3797,13 +3797,13 @@ static void stmmac_free_irq(struct net_device *dev,
 			free_irq(msi->sfty_ce_irq, dev);
 		fallthrough;
 	case REQ_IRQ_ERR_SFTY_CE:
-		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
-			free_irq(priv->wol_irq, dev);
-		fallthrough;
-	case REQ_IRQ_ERR_SFTY:
 		if (priv->sfty_irq > 0 && priv->sfty_irq != dev->irq)
 			free_irq(priv->sfty_irq, dev);
 		fallthrough;
+	case REQ_IRQ_ERR_SFTY:
+		if (priv->wol_irq > 0 && priv->wol_irq != dev->irq)
+			free_irq(priv->wol_irq, dev);
+		fallthrough;
 	case REQ_IRQ_ERR_WOL:
 		free_irq(dev->irq, dev);
 		fallthrough;

-- 
2.53.0

