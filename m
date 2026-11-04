Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812071;
	b=AMsMC9PgZ9NQ6CW3oPRL6a6oapTzVfLfdhZgeBt5f7BSu0fhCI9fWYRGH5HeGfQbb4ip
	 RVITUb6nBM78y4+i1AQggQeRy0N7Bn4k5l5UJYdAxhyWgpjMfBua37eNbpT5rEP2ayAsy
	 xlwf19ELVKlmcqT6QFxvnVgAaC4MQxzX4k3EQd/EAxD6ph21OneAfIqXy00aMI08/bWIa
	 m/kFgqJps3ac5ImLOBvg9CI3zM/AJdXrrGysDOKUPupk6vS80l740MHpjsKsM4u0r/W3P
	 EkdYsgQLYGJJWfRzp4X2ZQcpE6YbdIDadSyIllzoyXigLC1gEvmIkOIV5GBfxZ8xhsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812071;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:To:From:
	 Subject:Cc:X-Mailer:References:In-Reply-To:
	 X-Last-TLS-Session-Version;
	bh=XGTKa+A0EJ4L1pLNTThftimEUnixWjJ49siVoGkapLY=;
	b=i3D+Uni+LG7fOdoYaAQvk6cOU4LpU0y5akaBCQVm4kuum4TmYsUxCFeFJo5QrrNQ2dEY
	 5J5dE8OawECdv1rNMFGmlLo2Yv+RpBsCrVVoFAuvkOjD9o5zk9I/SrILyjSq74Tw7xoP9
	 vyuB6uuta/u2hOYc/zTtQ0D4Ly9yYWqQ8bwrP++PIQ8kYy2VKViED722V2zJ2IHzDY7ZI
	 S7AoNQ+nJIbpHrWPAt2Z/IRGcoqYwxNLXwfjYlKbTb0maCP8kW54HZWhU9KsuO9sLNUYg
	 2AR6FRIg/tvzeTqV1nZ6x0vti6AGv+wiMqB654O46LtzMiSu7FKHUGtFqsl8LLyvqrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kpW9EzxD;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A8E606A33A;
	Wed,  4 Nov 2026 17:07:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94A8E606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=kpW9EzxD
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 34CE3C8F476;
	Wed,  4 Nov 2026 17:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1EBE760772;
	Wed,  4 Nov 2026 17:07:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 82B7610329251;
	Wed,  4 Nov 2026 18:07:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793812059; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=XGTKa+A0EJ4L1pLNTThftimEUnixWjJ49siVoGkapLY=;
	b=kpW9EzxDmdwtKwJxISj/gutIXqyN7MmDRignbWZN1ektWTrrUIPrzso7gUlAIzRlYfmlqW
	wBKlXNUQhCfopQRniPYcBz+T3i6olaSdwJWoGYq/d1bCvLPhFP25igvjueEGcFOAbK2C+g
	lOlAG7F4VENL7Shxg3rR1VCK0QcwJEj51ZVM4g87fG/ThwFB2lU6YrCm+VpFntbpEluzhB
	BIvWkeRvI9t8CN65COyeHnV708XPaCXT8itYVl+McadgV2i2dutDVKHVPTlYkR75obUlkZ
	aOVlJuGAspv0NyRdMHKWaxq4ALVvic2JukDp9T7B6la1y8qyGG6ZYjuBUnDOVA==
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Nov 2026 18:07:11 +0100
Message-Id: <DMMLAMPXDLC2.3SN65B5N7R4M5@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 02/35] drm/panel: remove the unused struct panel_bridge
Cc: "Douglas Anderson" <dianders@chromium.org>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Jessica Zhang" <jesszhan0024@gmail.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Paul
 Cercueil" <paul@crapouillou.net>, "Marek Vasut" <marex@denx.de>, "Stefan
 Agner" <stefan@agner.ch>, "Frank Li" <Frank.Li@nxp.com>, "Sascha Hauer"
 <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>, "Laurent
 Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Tomi Valkeinen"
 <tomi.valkeinen+renesas@ideasonboard.com>, "Kieran Bingham"
 <kieran.bingham+renesas@ideasonboard.com>, "Geert Uytterhoeven"
 <geert+renesas@glider.be>, "Magnus Damm" <magnus.damm@gmail.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Linus Walleij" <linusw@kernel.org>,
 "Sandy Huang" <hjc@rock-chips.com>, =?utf-8?q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, "Andy Yan" <andy.yan@rock-chips.com>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>, "Randy Dunlap"
 <rdunlap@infradead.org>, "Inki Dae" <inki.dae@samsung.com>, "Seung-Woo Kim"
 <sw0312.kim@samsung.com>, "Kyungmin Park" <kyungmin.park@samsung.com>,
 "Krzysztof Kozlowski" <krzk@kernel.org>, "Peter Griffin"
 <peter.griffin@linaro.org>, "Alim Akhtar" <alim.akhtar@samsung.com>,
 "Alison Wang" <alison.wang@nxp.com>, "Paul Kocialkowski"
 <paulk@sys-base.io>, "Yannick Fertre" <yannick.fertre@foss.st.com>,
 "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Philippe Cornu"
 <philippe.cornu@foss.st.com>, "Maxime Coquelin"
 <mcoquelin.stm32@gmail.com>, "Alexandre Torgue"
 <alexandre.torgue@foss.st.com>, "Chen-Yu Tsai" <wens@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Thierry Reding"
 <thierry.reding@kernel.org>, "Mikko Perttunen" <mperttunen@nvidia.com>,
 "Jonathan Hunter" <jonathanh@nvidia.com>, "Jagan Teki"
 <jagan@amarulasolutions.com>, "Ondrej Jirman" <megi@xff.cz>, "Javier
 Martinez Canillas" <javierm@redhat.com>, "Igor Reznichenko"
 <igor@reznichenko.net>, "Michael Walle" <mwalle@kernel.org>, "Dario
 Binacchi" <dario.binacchi@amarulasolutions.com>, "Jagan Teki"
 <jagan@edgeble.ai>, "Jianhua Lu" <lujianhua000@gmail.com>,
 =?utf-8?q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, "Purism Kernel Team"
 <kernel@puri.sm>, "Jerry Han" <hanxu5@huaqin.corp-partner.google.com>,
 "Joel Selvaraj" <jo@jsfamily.in>, "Icenowy Zheng" <icenowy@aosc.io>,
 "Michael Trimarchi" <michael@amarulasolutions.com>, "Sumit Semwal"
 <sumit.semwal@linaro.org>, "Casey Connolly" <casey.connolly@linaro.org>,
 "Michael Tretter" <m.tretter@pengutronix.de>, "Cristian Cozzolino"
 <cristian_ci@protonmail.com>, "Junjie Cao" <junjie.cao@linux.dev>, "Ryan
 Brue" <ryanbrue.dev@gmail.com>, "Nickolay Goppen" <setotau@mainlining.org>,
 "Stefan Mavrodiev" <stefan@olimex.com>, "Florian Fainelli"
 <florian.fainelli@broadcom.com>, "Broadcom internal kernel review list"
 <bcm-kernel-feedback-list@broadcom.com>, "Robert Chiras"
 <robert.chiras@nxp.com>, "Alexander Koskovich" <akoskovich@pm.me>, "Markuss
 Broks" <markuss.broks@gmail.com>, "Artur Weber" <aweber.kernel@gmail.com>,
 "David Heidelberg" <david@ixit.cz>, "Dzmitry Sankouski"
 <dsankouski@gmail.com>, "Yedaya Katsman" <yedaya.ka@gmail.com>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <imx@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>,
 <linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-doc@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>, <linux-sunxi@lists.linux.dev>,
 <linux-tegra@vger.kernel.org>, <linux-rpi-kernel@lists.infradead.org>
X-Mailer: aerc 0.22.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-2-5e3070a3478f@oss.qualcomm.com>
 <179338130510.3009485.7743956655769667889.b4-review@b4>
In-Reply-To: <179338130510.3009485.7743956655769667889.b4-review@b4>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Oct 30, 2026 at 6:28 PM CET, Luca Ceresoli wrote:
> On Mon, 26 Oct 2026 13:09:51 +0200, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:
>> The bridge is embedded into struct drm_panel now, nothing uses the
>> separate wrapper struct any more.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
