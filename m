Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7E42749E6
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 14:03:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296983; cv=none; b=for7pl7T29CkTyfLI1iH8E/pChurzr+92Ou5599C7pCjM5O8lXAQccPeqhy8N9Q0y/mkSBN2FBt2eZoc/kGogwTqLFO8agXVc2eBIDtKhz496XF8E5y3Dolan7T/uyWD0/WFSY+U18x5P389dS8Jw4/IrQjhoSq9huh2jSV2ybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296983; c=relaxed/simple;
	bh=FTIUpYJulTDPMntpPJg3cHAwQl8IpGYir+ZH1v5UeXQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwyPWbmioxeSTGPJFyAO/kc6EuIB1PYVaONnYcSMjZhjUC65/SFekHtGdtTl9ttaXtkmhZsteV3h1D/DyN3QGO0cdCOgG9tws2TCZjot3qz0fdxtjzubfrQ/zUa++tDU889/RZUld23b+KaZQw0uVksYXgNQBM2J/33ByKgTLIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TW2beS6M; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TW2beS6M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784296980;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VGJka35hl1u+NTZhYLLi9zxEwwQ2DlQIwAaKGDObA0o=;
	b=TW2beS6MJ0umS+USBijiRCYB4r69nj4NhUX0S1IL1mv1v1t31x9RR79xn42Rnj8KXBVi6d
	IYQ+s9aK7JoMKpEGA3D4cC0BbHrWNqXz97QT/o/o4zGv5s9oFMZSKG1WdXCWAniBBHK4bq
	8x5qHPfcl0tOXs/BbADkQ0i4jm5SVRI=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-542-1W4X1tnkPoGaSo0U6wqzFg-1; Fri,
 17 Jul 2026 10:02:58 -0400
X-MC-Unique: 1W4X1tnkPoGaSo0U6wqzFg-1
X-Mimecast-MFC-AGG-ID: 1W4X1tnkPoGaSo0U6wqzFg_1784296976
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1028D180074C;
	Fri, 17 Jul 2026 14:02:55 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 39396180025B;
	Fri, 17 Jul 2026 14:02:38 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Date: Fri, 17 Jul 2026 16:02:04 +0200
Subject: [PATCH v3 1/4] drm/panel: have drm_panel_add/remove manage a list
 reference
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-drm_refcount_wiring-v3-1-023900c32e01@redhat.com>
References: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
In-Reply-To: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, 
 Lucas Stach <l.stach@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Paul Cercueil <paul@crapouillou.net>, 
 Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Jyri Sarha <jyri.sarha@iki.fi>, Jingoo Han <jingoohan1@gmail.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
 Albert Esteve <aesteve@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784296938; l=1577;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=FTIUpYJulTDPMntpPJg3cHAwQl8IpGYir+ZH1v5UeXQ=;
 b=YrbusurGGSB7YvjF6ZccKN+vcKVUHQpfLac942+Cranf6atmGaR9SI9po6YBiflKgqH3V3Uoc
 fE7eQSMY2CcDc+mWaONJx9YbrBOGvZ4cSQGsIw9XOJoVNKgKBXhpN1g
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The global panel_list holds raw pointers to drm_panel objects.
Nothing prevents a panel from being freed while it is still linked
in the list: if a driver's probe calls drm_panel_add() and then
fails at a later step, panel->list remains in panel_list. Any
subsequent call to of_drm_find_panel() that iterates the list will
dereference freed memory.

Have drm_panel_add() acquire a reference via drm_panel_get() before
inserting the panel into the list, and have drm_panel_remove() drop
it via drm_panel_put() after removing the panel from the list. The
global registry now holds a counted reference for as long as the
panel is listed, ensuring the object outlives any concurrent lookup.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 drivers/gpu/drm/drm_panel.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 2c5649e433dfb..545fe93dc28fe 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -81,6 +81,7 @@ static void drm_panel_init(struct drm_panel *panel, struct device *dev,
  */
 void drm_panel_add(struct drm_panel *panel)
 {
+	drm_panel_get(panel);
 	mutex_lock(&panel_lock);
 	list_add_tail(&panel->list, &panel_list);
 	mutex_unlock(&panel_lock);
@@ -98,6 +99,7 @@ void drm_panel_remove(struct drm_panel *panel)
 	mutex_lock(&panel_lock);
 	list_del_init(&panel->list);
 	mutex_unlock(&panel_lock);
+	drm_panel_put(panel);
 }
 EXPORT_SYMBOL(drm_panel_remove);
 

-- 
2.55.0

