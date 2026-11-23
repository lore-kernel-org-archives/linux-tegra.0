Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438189;
	b=QWZdSNjmF3s5Ypu2/sCUpKIyqJW0JO9HWtuAWt8WhxDGZz/QfBVmxn9uJaQZ/i7Sqrvu
	 ywF48RuiXc5POh2RMVp2b00WnzP0Gh+depckV/wHWFVWZrM+WwmPnZe+/+8gawI8f7R98
	 sJ540C+FU4/bTg3bzbikywYYQzGrOpeqbNEr9XyZFPhIzeTFTdGlDM3wZUxQxqxLUqmIf
	 P6vUL5l8kZ0xdqpbtWQgaXPJFJsH6Z8d51KTOx4d7ulJx6JYbl6t/AEQhtTR0Jc46Fw4Z
	 m30rlx29WQwu2abLn1lY33pBuJCvE8KKfhlABfYPxGwr/f80mF87dNpdqIgAPGgZkGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438189;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:To:Cc:
	 In-Reply-To:References:Subject:Message-Id:Date:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=9S+zYbf1+35Bjw2Mrwh8qKAGonx8naAVwCL/M52lAos=;
	b=42v7Fle/ISbffWy+OJV7bA/pKHlVpR58jlevS9TBkLH7fuuLPcm7OWGQofl5nDvj8Ipq
	 /icQLLst9MJVoUBeYQponRY9fyc4Q70ZX9mkyR7udCRu27hI1F++vc+se8qBNgwOiepfi
	 hID7jws1T+4y2OSL2phjAE6mApNYaTnlQ8e5U9V4T/iJlrYsb37xkb8qbypQaM7jczJoH
	 RhX1uhvU71e7eYjpC7fbAiw8MqVuf7OyXFGWGECCpduLBk3tWq4rWZ1qSEI6NJA0CMork
	 R5ICh+QkWDN4TEVeTHQesnUwR8pZ2I46vAzCNzy2Ytp9l2HsZ5JfON/Hl16HbKiAf8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2eVrJ5W7;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FB1606A32C;
	Mon, 23 Nov 2026 12:49:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6FB1606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=2eVrJ5W7
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 7B880C69149;
	Mon, 23 Nov 2026 12:49:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6C4BF601E1;
	Mon, 23 Nov 2026 12:49:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 58F5211E6A338;
	Mon, 23 Nov 2026 13:49:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795438180; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=9S+zYbf1+35Bjw2Mrwh8qKAGonx8naAVwCL/M52lAos=;
	b=2eVrJ5W7Q2n7kIAXCLAfrUUYblKTfODmq1QVOkzJvI7oWSJXMqLWa2QzpazEjogSDqKzLh
	s8sAxDfXwnzYNVSFG3dkGdEGmdUXt3V6GstTnIqHqBxkh8XBlm+2KLChquHHZoUNIkU7IX
	UQyATbEVJjrbrnmNMUfIVKumyb7j01Fkv0K91l3BkJ1SUMdQM9PgFOlheX31bjRmCLMnxw
	cNWH2JioMQhckzm1o8iOFOfY5k1Uwqf3FjbPF3P5HeZId+1XNnPRN22o00uI7iYRkuBNtR
	Ug/iv3lmeQrfv8sRhqI1i1om5BfRunNZelsRIHCwZoJKMWlALzPwJIKLHejLUg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Paul Cercueil <paul@crapouillou.net>, Marek Vasut <marex@denx.de>, 
 Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
 Linus Walleij <linusw@kernel.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Inki Dae <inki.dae@samsung.com>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Alison Wang <alison.wang@nxp.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
 Javier Martinez Canillas <javierm@redhat.com>, 
 Igor Reznichenko <igor@reznichenko.net>, Michael Walle <mwalle@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Purism Kernel Team <kernel@puri.sm>, 
 Jerry Han <hanxu5@huaqin.corp-partner.google.com>, 
 Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
 Michael Trimarchi <michael@amarulasolutions.com>, 
 Sumit Semwal <sumit.semwal@linaro.org>, 
 Casey Connolly <casey.connolly@linaro.org>, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Junjie Cao <junjie.cao@linux.dev>, Ryan Brue <ryanbrue.dev@gmail.com>, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Stefan Mavrodiev <stefan@olimex.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Robert Chiras <robert.chiras@nxp.com>, 
 Alexander Koskovich <akoskovich@pm.me>, 
 Markuss Broks <markuss.broks@gmail.com>, 
 Artur Weber <aweber.kernel@gmail.com>, David Heidelberg <david@ixit.cz>, 
 Dzmitry Sankouski <dsankouski@gmail.com>, 
 Yedaya Katsman <yedaya.ka@gmail.com>, Andy Yan <andyshrk@163.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org
In-Reply-To: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
Subject: Re: (subset) [PATCH 00/35] drm/panel: let the panels use the
 atomic state
Message-Id: <179543814467.190741.17345151948628824699.b4-ty@b4>
Date: Mon, 23 Nov 2026 13:49:04 +0100
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3


On Mon, 26 Oct 2026 13:09:49 +0200, Dmitry Baryshkov wrote:
> The panel is the only element of the display pipeline which never sees
> the atomic commit. Its prepare() and enable() callbacks get nothing but
> the panel, so a panel which has to be programmed differently depending
> on the mode can only guess it. The NT35950 driver, for example, saves
> the connector in get_modes() and reads connector->state->crtc->state
> while being prepared: without the locks, from the current state rather
> than from the one being committed, and with no way to reject a mode it
> doesn't know.
> 
> [...]

Applied, thanks!

[01/35] drm/panel: remove the get_timings() callback
        commit: 874b9d3ad6e0087ea21aafcb2ada3f6a6a8c5a1c
[02/35] drm/panel: remove the unused struct panel_bridge
        commit: 83fa60df1302667ce139457208aee277067732db
[03/35] drm/tidss: get the panel type from the embedded bridge
        commit: eb5352d63fee9733f798f53e0418c17a5184d258
[04/35] drm/bridge: lvds-codec: use devm_drm_panel_bridge_add()
        commit: 4afe0e580a135dd4917486ccf7cff3442b6596ff
[05/35] drm/ingenic: use devm_drm_panel_bridge_add()
        commit: cfac2956bdaabec099fdc471ebd9ae9ac0defd65
[06/35] drm: mxsfb: use devm_drm_panel_bridge_add()
        commit: f88a377f94b03796ea5c7d62fb3b061f6a0bb040
[07/35] drm: rcar-du: use devm_drm_panel_bridge_add()
        commit: a57b24576b38dafdcd859aff8f129c0c0a29fd04
[08/35] drm: rz-du: use devm_drm_panel_bridge_add()
        commit: 666e1e77703cbcff43d48e77a24f72e4147510d8
[09/35] drm/mcde: use drm_panel_bridge_add()
        commit: 0f7bcd3b5439845acfa6a381a7cc314262b2d4fe
[10/35] drm/pl111: use drm_panel_bridge_add()
        commit: 3f603bf783886f681721218aae4c8c709ee961bf
[11/35] drm/rockchip: lvds: use drm_panel_bridge_add()
        commit: 8165f8e83c3a660b7311337aae0469d760ff5f26
[12/35] drm/rockchip: rgb: use drm_panel_bridge_add()
        commit: 66acc28d44cd41d9ad63be5840556450f84f6b50
[13/35] drm/panel: remove the _typed() panel bridge functions
        commit: bbdf706498e19c35c56e3d69178c3e833f014e06
[14/35] drm/panel: remove drm_panel.connector_type
        commit: 5888187709034391aaf7f1ab8d4910285f0b404f

Best regards,
-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


