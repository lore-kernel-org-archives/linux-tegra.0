Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEF13CC7CC
	for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 21:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790546400; cv=none; b=UKP71dPhY7102LEpdphtF1W6FNADNw9Pfb3mu9H/BL2429pA0L5hDTVe8KALjDVrXETaT0GLMb/7as3fbVQMS+Xtzwr5RiJOSA2TI9jKAnb5V9rF/0yXAT33W8TeaQtiIY/32ORuYvP7Jqy4yiEydUjusp3HUrulary0WoNrZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790546400; c=relaxed/simple;
	bh=rzqz19tdKiIDsU7aWYdQjxQohn7bMOmaxt0Fu4XDk60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ae7NxM8m/zuMUhFBytlogXjsmC2V0i4bnXyvOA/utRlLZnkSHKRBNFxiD6KzmjhCajyRymSazim2GzmQoA6wmFUwCWSylU7FwgEkBaMdyJM7k+2XDwMYvrDJ7G0baWeQd9x0BQuWmZPN4s2NL2Lefq0988Nw/kCbRC5wZatxkr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AFmoIsvM; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AFmoIsvM"
Received: by mail-oo2-f43.google.com with SMTP id 46e09a7af769-81b15bca7dfso665574a34.0
        for <linux-tegra@vger.kernel.org>; Sun, 27 Sep 2026 14:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790546393; x=1791151193; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sgAVUUxDB8OVhc+RGqtGQd2Cq3Rragg7xi0varaDwWI=;
        b=AFmoIsvMVsRaFchT0Hav9KSeMsYmE7ZHJEQKKPk6/sPyqfpozZXm458O6OnH+3GCMt
         qxsfWbYVv8lFuMiPuZXwa6cf3yaQ8H21WnALEwe7qnB7Km9WaDEqMd4Vrcu77VY5p2K7
         p4SUWY3UKwdaAFUfieq1uR0HgnaYrEViYgdotbs5WdvQbCrY5Rcr0oCRwUA7b3pD0zs/
         YbQkKCDrR+AAv5OUDyV7PoNQ6tgek8YNsW8N5yZjgHX9xZ/PNNJCi8RVdtVJZIthLFgp
         eWg+9CvEhL94jNvi4GfiFBHbSxDdVImZsRh22iMHg27jG7A2GwtbqVX43L4iXdOINuo2
         +pCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790546393; x=1791151193;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sgAVUUxDB8OVhc+RGqtGQd2Cq3Rragg7xi0varaDwWI=;
        b=oby+Dnwudloo91AjDz+Guklh4mFMJ37gFb2CYs1GQc9+JY1cJNHaP0c7OpG9/Uv3Ct
         2qQcR/6x/BjwKi5N33CX/e8eP2cXTd3fXaLG0GXAuvUIfc9aN+lEqbye4ExCkd9itfyE
         OawAnYsCuwZO0CRMiqycgmMeD5o9ylmaxJMrCr8TUJh2OEwJRCOJoS8okCuITaZimUMR
         mb1Mf6BYcvVCjU47uP0DUVj7wET1/XSknuF7FQjEYxqlLdsRbVF9DYcwttTLrmC515Rw
         AeOGuHszifMlJs+Jo28giVOrlGKVC9EC9apYQ/VV81eiuOau3gO6/F1XOD4xKGKtAj5Z
         kW/g==
X-Forwarded-Encrypted: i=1; AKwUvByhB2qSbbaZ9hao9ZQSQDmMApoYZuDvzkc3xG4DkzwyJ1JS4u+Emno8k5QZWi3VWKCU2hV3SeMgX8PCNg==@vger.kernel.org
X-Gm-Message-State: AFuF++lSM51jwF5OHV2uzR4U4euqgupGfGjxT65+P+CtD4sKXZVqzkG/
	wu8ymknCxYSeGFklbboeWvlqnDFPTlmlVI5W++VTHZeDsdfgEOK2VWqd
X-Gm-Gg: AYBFou1LBidwmeZlWClYpMPMntkKB3eVl+kb6A1xFDxAL/biOqKimMwzAUGc4AoHBXZ
	ls1g3Luumj36KBnsJOlyLVc28F03MizaU9tQ5D/ZvJV3FLWbSSGJ78WvPxZ6iOo6eMex5ODNAoV
	If9NzAWMs2VfQGVFT4e38DocZ055Rn/c+MkVGwg0HPgcgiiO4KAevL4GT17b/+3SkjLq084bi8+
	tvmOCMEG5Fg3LK+7V7NPbPKf4EArKHKXMTVJ1Dxpdcmq/f/OsjKb+6PN9FkJ6w0SoAotwHLlTSe
	pTO10DQp5IKc10d+WSff6L3P+7QsV1FPYSKjpVPbu+GQ9ZKbVHImc+tTXU1TrGm9rU+e+uCzqR6
	vBfWev3vc+Qvs0ukuhl2PhBxx7Oy+dBA7Z7gXCthHhkKiuP7qwJmnUD4wJsCYetjvhwwW/qVO+q
	azepGq1IMt/NDG+a28dy1zDBsUtCpmHR9iS/SiavZsZzIXImKOqHsojUYaX6BbP977kghpK/6vQ
	FyoGifeUk2NDyKET67JYpfzqvYs8GelQYl+UwilvDm9+AONAJ+JuqEiZF86gYGzCodw1tlIUjMJ
	ajtL9pF+tZ+sfoFjefZq6qRkTQ0auTAuCdYlFTyIOzFNRMocfqHfJTJEhzM4LirJLwn/Db9eg1P
	iUHACBQ94hZhEiEjsLEuA
X-Received: by 2002:a05:6820:4b97:b0:6b7:46e9:96f5 with SMTP id 006d021491bc7-6d43fe7118cmr10987249eaf.37.1790546393220;
        Sun, 27 Sep 2026 14:59:53 -0700 (PDT)
Received: from [127.0.1.1] (174-29-1-49.hlrn.qwest.net. [174.29.1.49])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-81b3de6f7e1sm4874147a34.22.2026.09.27.14.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 14:59:52 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 27 Sep 2026 15:59:38 -0600
Subject: [PATCH net-next v5 03/19] net: phylink: allow stopping a suspended
 instance
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260927-submit-stmmac-reset-fixes-v1-v5-3-feec6c14dd06@gmail.com>
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

If a network driver's system resume fails before phylink_resume(), the
network device can remain administratively up with phylink suspended.
Closing the interface then needs to terminate that suspended instance.
Calling phylink_resume() merely to make phylink_stop() work is not a
safe substitute: resume reconfigures the MAC and restarts link
resolution, although the driver has not successfully restored the MAC.

This is a missing suspend-to-stop transition, independent of the reason
hardware restoration failed. No MAC recovery policy belongs in phylink;
the driver still decides whether to retry resume or wait for an ordinary
administrative down/up cycle.

Without MAC Wake-on-LAN, phylink_suspend() has already called
phylink_stop(). Do not repeat PHY, SFP and PCS shutdown. However,
phylink_prepare_resume() may have powered that stopped PHY back up to
provide the receive clock for MAC reset. Suspend it again if WoL
permits, without repeating phy_stop() on a PHY which is already halted.

With MAC Wake-on-LAN, suspend deliberately defers mac_link_down() and
sets PHYLINK_DISABLE_MAC_WOL. Finish that deferred link-down, drain
resolution work and clear the WoL disable bit while retaining
PHYLINK_DISABLE_STOPPED. Otherwise a subsequent start cannot resolve the
link.

Also undo PHY speed control performed by phylink_suspend(). As Andrew
Lunn pointed out, phylink_start() does not restore the advertised speeds
that phylink_resume() normally restores. Track suspend-owned speed
control and restore the saved advertisement from either resume or
suspended stop, including when PHY shutdown has already completed.

An explicit driver speed-down request, such as stmmac's close-time power
saving, must remain in effect until its matching speed-up. Restore any
suspend-owned reduction before applying that request, so it cannot save
the reduced advertisement over the original one. The following stop must
not undo the driver's new reduction.

Document that a suspended instance can be stopped directly. This neither
resumes the PHY nor reconfigures or brings up the MAC.

Fixes: f97493657c63 ("net: phylink: add suspend/resume support")
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/net/phy/phylink.c | 51 ++++++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
index a7d086cdc9b2..f97fee908df6 100644
--- a/drivers/net/phy/phylink.c
+++ b/drivers/net/phy/phylink.c
@@ -78,6 +78,7 @@ struct phylink {
 
 	bool link_failed;
 	bool suspend_link_up;
+	bool suspend_speed_down;
 	bool force_major_config;
 	bool major_config_failed;
 	bool mac_supports_eee_ops;
@@ -2618,6 +2619,14 @@ void phylink_start(struct phylink *pl)
 }
 EXPORT_SYMBOL_GPL(phylink_start);
 
+static void phylink_restore_suspend_speed(struct phylink *pl)
+{
+	if (pl->suspend_speed_down) {
+		phylink_speed_up(pl);
+		pl->suspend_speed_down = false;
+	}
+}
+
 /**
  * phylink_stop() - stop a phylink instance
  * @pl: a pointer to a &struct phylink returned from phylink_create()
@@ -2629,11 +2638,30 @@ EXPORT_SYMBOL_GPL(phylink_start);
  *
  * This will synchronously bring down the link if the link is not already
  * down (in other words, it will trigger a mac_link_down() method call.)
+ * A suspended instance may be stopped without first calling phylink_resume().
+ * In particular, closing a device after a failed resume must not restart the
+ * link or reconfigure the MAC just to finish shutting it down.
+ * Any PHY advertisement reduced by phylink_suspend() is restored as part
+ * of this transition.
+ * If phylink_prepare_resume() powered up an already stopped PHY, suspend
+ * it again when Wake-on-LAN permits.
  */
 void phylink_stop(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
+	/* Also undo PHY speed control when terminating a suspended instance. */
+	phylink_restore_suspend_speed(pl);
+
+	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state)) {
+		/* A failed MAC resume may have called phylink_prepare_resume()
+		 * and powered the stopped PHY back up to supply its RX clock.
+		 */
+		if (pl->phydev)
+			phy_suspend(pl->phydev);
+		return;
+	}
+
 	if (pl->sfp_bus)
 		sfp_upstream_stop(pl->sfp_bus);
 	if (pl->phydev)
@@ -2646,6 +2674,16 @@ void phylink_stop(struct phylink *pl)
 
 	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
 
+	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
+		/* Finish the link-down deferred by MAC WoL, without restarting. */
+		flush_work(&pl->resolve);
+		mutex_lock(&pl->state_mutex);
+		if (pl->suspend_link_up)
+			phylink_link_down(pl);
+		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
+		mutex_unlock(&pl->state_mutex);
+	}
+
 	pl->pcs_state = PCS_STATE_DOWN;
 
 	phylink_pcs_disable(pl->pcs);
@@ -2777,8 +2815,10 @@ void phylink_suspend(struct phylink *pl, bool mac_wol)
 		phylink_stop(pl);
 	}
 
-	if (phylink_phy_pm_speed_ctrl(pl))
+	if (phylink_phy_pm_speed_ctrl(pl)) {
 		phylink_speed_down(pl, false);
+		pl->suspend_speed_down = true;
+	}
 }
 EXPORT_SYMBOL_GPL(phylink_suspend);
 
@@ -2818,8 +2858,7 @@ void phylink_resume(struct phylink *pl)
 {
 	ASSERT_RTNL();
 
-	if (phylink_phy_pm_speed_ctrl(pl))
-		phylink_speed_up(pl);
+	phylink_restore_suspend_speed(pl);
 
 	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
 		/* Wake-on-Lan enabled, MAC handling */
@@ -3687,6 +3726,12 @@ int phylink_speed_down(struct phylink *pl, bool sync)
 
 	ASSERT_RTNL();
 
+	/* An explicit request takes over from suspend-time speed control.
+	 * Restore the original advertisement before saving it again, so a
+	 * repeated speed-down cannot replace it with the reduced advertisement.
+	 */
+	phylink_restore_suspend_speed(pl);
+
 	if (!pl->sfp_bus && pl->phydev)
 		ret = phy_speed_down(pl->phydev, sync);
 

-- 
2.53.0

