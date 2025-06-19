Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CD2924501C
	for <linux-tegra@vger.kernel.org>; Thu, 19 Jun 2025 19:19:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750360754; cv=none; b=Mu1gO/+8s9YCs9+d03Ta2tr9nq0JuhE1gaV8vTalG3EInFP3yYHSmCgOrDgfONTzzyVEC23ym9ruUl4QI2zgQTFxsz/7rHJ5my1wdLAdraDgsQeoxENhrEG16zHNt4ds+r1nCORuWp8fGpt9kLFW9WJUF4UpwBA8u4onIk8eflU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750360754; c=relaxed/simple;
	bh=yNvjv7hb6ySNQZ968pU8oFIf8+51CHNBGcedVDbIpZQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XPttLHO76JBAObhJUOWlxmnH3UoZjXE5BbEzMZULFGkPANYNKuYYO20uyAoXuOtuzsjOTVEZ3OZppk1M1+VmYhHk6chn1k4FvOmialk6GafnUpDOCZDd1GqF7Ff00zGoNKbkdFlUKxgWDPR+cLhK5/5PkxwsDB+HbQFkmCiLwC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eoTCZ/pA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eoTCZ/pA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750360752;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DaPEqK1ftZ2q8jPM1X2TY9mvqbsIChLSEqaubg3Qn14=;
	b=eoTCZ/pAHdO4HZkSa6CSvhnyHa5Enla4i26AOMsyFW9uHxE5G/BU6rJuNf5gWgJGL8RCfa
	B0KcQkuuciqLLjouaHL2Ff4qhO7ScqMHxkbnPh22H6bDB3hhuojy83a1UGB8C2yg3X32hE
	4f9kLSLDJrPULr7H2eSqOJxHliohG8U=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-663-P-xQEcNjPZ2X5DMB_NCRUg-1; Thu,
 19 Jun 2025 15:19:10 -0400
X-MC-Unique: P-xQEcNjPZ2X5DMB_NCRUg-1
X-Mimecast-MFC-AGG-ID: P-xQEcNjPZ2X5DMB_NCRUg_1750360745
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7B7DA19560B2;
	Thu, 19 Jun 2025 19:19:05 +0000 (UTC)
Received: from asrivats-na.rmtustx.csb (unknown [10.2.16.132])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A054819560A3;
	Thu, 19 Jun 2025 19:18:56 +0000 (UTC)
From: Anusha Srivatsa <asrivats@redhat.com>
Date: Thu, 19 Jun 2025 14:16:02 -0500
Subject: [PATCH v2 10/16] drm/panel/omapdrm: Keep up with refcounting
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-b4-of_drm_find_panel_part1-v2-10-0df94aecc43d@redhat.com>
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
 Alison Wang <alison.wang@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-tegra@vger.kernel.org, Anusha Srivatsa <asrivats@redhat.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750360565; l=1123;
 i=asrivats@redhat.com; s=20250122; h=from:subject:message-id;
 bh=yNvjv7hb6ySNQZ968pU8oFIf8+51CHNBGcedVDbIpZQ=;
 b=Pf17x5qSnl1YboGZisOg1cYhskCTcpvu2mq/FNYcxXkDWPbt08xnacLBCfVPhW+Co+JmewGCl
 BQ1ZjYD5uzNBVuKCKB3K5jIsd+v82S9388H3cI9wFxUXoYITXzt+97K
X-Developer-Key: i=asrivats@redhat.com; a=ed25519;
 pk=brnIHkBsUZEhyW6Zyn0U92AeIZ1psws/q8VFbIkf1AU=
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

Put the reference of the panel returned by
of_drm_find_panel().

Patch added in v2.

Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
---
 drivers/gpu/drm/omapdrm/dss/output.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/output.c b/drivers/gpu/drm/omapdrm/dss/output.c
index 7378e855c278c3809bc431ff48a1c5a41b7dedfc..259ef19d4be2cb559ba9ffe53db9e6e4b4409b21 100644
--- a/drivers/gpu/drm/omapdrm/dss/output.c
+++ b/drivers/gpu/drm/omapdrm/dss/output.c
@@ -48,7 +48,6 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 			ret = PTR_ERR(bridge);
 			goto error;
 		}
-
 		out->bridge = bridge;
 	}
 
@@ -76,9 +75,12 @@ int omapdss_device_init_output(struct omap_dss_device *out,
 
 void omapdss_device_cleanup_output(struct omap_dss_device *out)
 {
-	if (out->bridge && out->panel)
+	if (out->bridge && out->panel) {
 		drm_panel_bridge_remove(out->next_bridge ?
 					out->next_bridge : out->bridge);
+		drm_panel_put(out->panel);
+
+	}
 }
 
 void dss_mgr_set_timings(struct omap_dss_device *dssdev,

-- 
2.48.1

