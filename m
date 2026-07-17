Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4DD26B764
	for <linux-tegra@vger.kernel.org>; Fri, 17 Jul 2026 14:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784296971; cv=none; b=ATb/QOxJpxGMIcZs9WnE65SplPUJ2ivqLJDdZ9KI/GZY/Rnuh1DWP60HQJ5Zrb+4FvSMqGLJeU8nPYGTl+F06nxJ4QBOG8grtUeMzr25LionUgcocUyvzc9szO6LuHJ5pPeMCDBKddpYSfIkxhEnZyfwOro4kOw2GCHjMm//Mm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784296971; c=relaxed/simple;
	bh=CBR1Ph2kUJjjkYaGrdkvqaa4iWlYMfiXDLEZXyTQZ1o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IBcSC+aOFlLaRR0YpeFVHZWV2SL2Gre+Ga98TbnFidxgt5AxeN0AdTmISp/DmcZerMbcvtZtbFbepoWAYZEqyZFuihMV6nWqC16u3ScOhWDszyl2eB+cVnNxGRdDtWVad2ovKG2EcbWf7boTHM0RksGNLYI4SBOUI0lSUTG7wgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bGM79G5L; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bGM79G5L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784296967;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KXAKRwDTnzEg9ZBBk/oAwaIuZZpboPYGh9kDsncZq0U=;
	b=bGM79G5LBKwXsDbBsaXtYvIJgmzFfl2w2Ge3kVs+zjJRIFH+WON61qoPE5lokq9ucBro89
	ZCJ93In6dgzY34eIGYyXrZl44KZkqMq2/GF0QvsKraEI1ewpqjNc8xBOu6dheTTSJhajxZ
	tZBIbJvr4NouzPpMka2zGlRkKikybAQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439-Yb86uWQwMq65dWAFJOh-cw-1; Fri,
 17 Jul 2026 10:02:43 -0400
X-MC-Unique: Yb86uWQwMq65dWAFJOh-cw-1
X-Mimecast-MFC-AGG-ID: Yb86uWQwMq65dWAFJOh-cw_1784296960
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B2D201955EA8;
	Fri, 17 Jul 2026 14:02:38 +0000 (UTC)
Received: from [192.168.1.153] (headnet05.pony-001.prod.iad2.dc.redhat.com [10.2.32.117])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 342F318005B3;
	Fri, 17 Jul 2026 14:02:18 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
Subject: [PATCH v3 0/4] drm/panel: refcounting panel lookups and references
Date: Fri, 17 Jul 2026 16:02:03 +0200
Message-Id: <20260717-drm_refcount_wiring-v3-0-023900c32e01@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XOyw6CMBAF0F8hXVvTF2105X8YQ/oYoAuKabFqC
 P9uwYUx0eWdzD0zM0oQPSR0rGYUIfvkx1AC31XI9jp0gL0rGTHCJKkpxy4OTYTWjrcwNXcffei
 wgBpUreBAhEKleS0L/rGp50vJvU/TGJ/bkUzX6duTTP70MsUEW6upVoYbB+0pguv1tLfjgFYws
 w+i/jyVWUEcN0bSVhgn3BeyLMsLlq5UcPwAAAA=
X-Change-ID: 20260513-drm_refcount_wiring-4e5e757e9047
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784296938; l=6089;
 i=aesteve@redhat.com; s=20260303; h=from:subject:message-id;
 bh=CBR1Ph2kUJjjkYaGrdkvqaa4iWlYMfiXDLEZXyTQZ1o=;
 b=wkA63uP1ZKoAa4h64tde85ydj2YqROznD17VIE6GUQVqeRP94Romw2NP7XiRctsK48Czd8IKA
 egJVcLgipY8AlirQeQbG5HkLYCJmhqolZb8CsYQG+KwOXgQPNcCRePK
X-Developer-Key: i=aesteve@redhat.com; a=ed25519;
 pk=YSFz6sOHd2L45+Fr8DIvHTi6lSIjhLZ5T+rkxspJt1s=
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

The drm_panel subsystem provides kref-based reference counting [1]
(drm_panel_get/put) but almost nothing in the tree actually uses it.
This results in a systemic use-after-free pattern throughout the codebase.

This series aims to close all those issues.

Patches 1-2: fix the infrastructure. drm_panel_add/remove now keep
a counted reference for the list entry. drm_panel_bridge_add_typed()
now holds a counted reference for the lifetime of the panel_bridge.

Patch 3: change the semantics of of_drm_find_panel(). It now acquires
a reference before returning, under panel_lock. All in-tree callers
of of_drm_find_panel() and drm_of_find_panel_or_bridge() are updated.
Two patterns are common in these fixes:

- Bridge-wrapping: the panel is passed to devm_drm_panel_bridge_add()
  or equivalent, which acquires its own reference. The caller (including
  devm_drm_of_get_bridge() and drmm_of_get_bridge()) releases its lookup
  reference immediately after.
- Store-and-use: the panel pointer is kept in a driver struct and
  used directly for the device lifetime. The reference is released in the
  remove/unbind path, or via devm_add_action_or_reset() where no explicit
  teardown function exists.

Patch 4: extend the same fix to find_panel_by_fwnode(), a static helper
used internally by drm_panel_add_follower(). Since it has no external
callers, the fix is self-contained: drm_panel_remove_follower() is
updated to call drm_panel_put() to balance the reference.

In order to catch all places in the tree that required releasing the
reference, the search was assisted by an AI model. Specifically, a
Coccinelle script was designed by the agent to address the trivial changes
(not included in the series). Although a few required manual fixes, with goto
labels or bracket additions. Additionally, the model helped to discern implicit
teardown paths that were addressed with devm_add_action_or_reset() calls.
Thus, these commits have the Assisted-by label following the project guidelines.

No functional change is intended for any driver. The reference
counting only affects object lifetime; panel operations are unaffected.

[1] https://lore.kernel.org/all/20250331-b4-panel-refcounting-v4-0-dad50c60c6c9@redhat.com/

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
Changes in v3:
- Squashed patches 3 and 5
- Fix probe failure paths that leaked reference
- Fix UAF and other smaller issues found by Sashiko
- Add comment in tegra-dsi explaining why panel is always
  NULL in that path and so no early drm_panel_put() is required
- Link to v2: https://lore.kernel.org/r/20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com

Changes in v2:
- Squash of_drm_find_panel() API change with its caller fixes
- Split find_panel_by_fwnode() into its own commit
- Update kernel-doc for drm_of_find_panel_or_bridge()
- Link to v1: https://lore.kernel.org/r/20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com

---
Albert Esteve (4):
      drm/panel: have drm_panel_add/remove manage a list reference
      drm/bridge/panel: hold a reference to the wrapped panel
      drm/panel: of_drm_find_panel() return a counted reference
      drm/panel: find_panel_by_fwnode() return a counted reference

 drivers/gpu/drm/bridge/analogix/analogix-anx6345.c | 12 +++++++++++
 drivers/gpu/drm/bridge/fsl-ldb.c                   |  1 +
 drivers/gpu/drm/bridge/lontium-lt9211.c            |  1 +
 drivers/gpu/drm/bridge/lvds-codec.c                |  1 +
 drivers/gpu/drm/bridge/panel.c                     | 20 ++++++++++++++----
 drivers/gpu/drm/bridge/samsung-dsim.c              |  1 +
 drivers/gpu/drm/bridge/ssd2825.c                   |  1 +
 drivers/gpu/drm/bridge/tc358767.c                  |  2 ++
 drivers/gpu/drm/bridge/tc358768.c                  |  1 +
 drivers/gpu/drm/bridge/waveshare-dsi.c             |  1 +
 drivers/gpu/drm/drm_of.c                           |  3 ++-
 drivers/gpu/drm/drm_panel.c                        | 24 +++++++++++++++++-----
 drivers/gpu/drm/exynos/exynos_dp.c                 | 19 ++++++++++++++++-
 drivers/gpu/drm/exynos/exynos_drm_dpi.c            |  3 +++
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_rgb.c          | 18 ++++++++++++++++
 drivers/gpu/drm/imx/dcss/dcss-kms.c                |  3 +++
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c          |  4 +++-
 drivers/gpu/drm/logicvc/logicvc_interface.c        | 12 +++++++++++
 drivers/gpu/drm/mcde/mcde_drv.c                    |  1 +
 drivers/gpu/drm/mcde/mcde_dsi.c                    |  1 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.c                  |  1 +
 drivers/gpu/drm/omapdrm/dss/output.c               |  1 +
 drivers/gpu/drm/pl111/pl111_drv.c                  |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c  |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_lvds.c        |  1 +
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_encoder.c   |  1 +
 drivers/gpu/drm/rockchip/analogix_dp-rockchip.c    | 11 ++++++++++
 drivers/gpu/drm/rockchip/rockchip_lvds.c           |  4 ++++
 drivers/gpu/drm/rockchip/rockchip_rgb.c            |  3 +++
 drivers/gpu/drm/sti/sti_dvo.c                      |  3 +++
 drivers/gpu/drm/stm/ltdc.c                         |  1 +
 drivers/gpu/drm/stm/lvds.c                         | 12 ++++++++---
 drivers/gpu/drm/sun4i/sun4i_lvds.c                 | 13 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_rgb.c                  | 13 ++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.c                 |  2 ++
 drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c             |  6 +++++-
 drivers/gpu/drm/tegra/dsi.c                        |  5 +++++
 drivers/gpu/drm/tegra/output.c                     | 24 +++++++++++++++++++---
 drivers/gpu/drm/tidss/tidss_kms.c                  | 16 ++++++++++-----
 drivers/gpu/drm/tve200/tve200_drv.c                |  1 +
 40 files changed, 225 insertions(+), 24 deletions(-)
---
base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
change-id: 20260513-drm_refcount_wiring-4e5e757e9047

Best regards,
-- 
Albert Esteve <aesteve@redhat.com>

