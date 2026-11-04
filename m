Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812037;
	b=YiaCLiF0grlEZCcKez3CZ+Mfj4KBnP/v5z3HplG/N6v3CjAlU4HFiKOVkMb6++ZiX3wt
	 1oIFWhsiR3QUn3KLaSPFEw22obmihEp1h1FaEMIECkE5OTl5ic/nMEOVbhGu4SfyFqA55
	 R1HaR7ntgblAT/g6Chfz75qK/lsznUPdgxoTBI1pFOmp1tAG4g+otbpIrg2rYspTDKJK/
	 QxTXITjZ5X+K6p2aYLIRz264mVT5h8cl5iD2SuTMNbHGdmCx3eH9Qjcr20OTgrA4N2L6u
	 iK4Mzc/NLbgLykS0ui60rHOHGtZLrnmaX7lRPn9GLsEU5LK2R6nJx/XL+0mtcvIbpPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812037;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=ZXLl/AaUKXySpD8bEwxF+hYSf8GhUGDVr3Bx6BgI0DQ=;
	b=dIRdJK7yLYcKpHaVveChqgJNZPn0WT+EtG/GpZj8xI+jbE3AQQCwKql9VMUyAdfyMMkk
	 t6WmeW80jq0BN6sB13sHzp9OeOypgGQtKBcWejvjZWwlXJevrc8dr8JQ8JfB0vNY5xsg2
	 Auv7JR1qHCS2IrWD7PD++j+J/UWvD7MAPgJg52G2fmm3wQMFoUwp8WCwCcbf8E7fDmbdC
	 IUer+XBaMVoEKoJfW5jvmZgvc/QivyuQ+QmHhvv2tC7lXQbi1NoOX2F4Zuv6EtITdz2d5
	 MJnQmNRAs6c1oO6FlEfdzO15z9nsVdoSG5eYhsDwVwntwBncLrSz3jFiQxF0HhdYNOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iW0x3fvV;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EFE1606A331;
	Wed,  4 Nov 2026 17:07:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EFE1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=iW0x3fvV
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 1EE471A1455;
	Wed,  4 Nov 2026 17:07:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DE5F760772;
	Wed,  4 Nov 2026 17:07:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0FD6D103283F6;
	Wed,  4 Nov 2026 18:06:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793812025; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZXLl/AaUKXySpD8bEwxF+hYSf8GhUGDVr3Bx6BgI0DQ=;
	b=iW0x3fvVWevJcu5cfeg82h1dBX5Xp/UT8g/xeMTnxsjAzQxOe7zSh7CFcQ0VrzyBZBMk/e
	F0ioOQ3qJyxf3RfEV4PUYltM+K4xfxneF3N329SsTooEHYhV3p5n6rEl/HRRLm/+lwdBnh
	7HWz6W4j2dDqZYFlZoDQv6JhBdDRaezLBk158tddl6F6x1BtgOrisYrh72oZxq/dA9A9Kz
	z8QlnJUh5sQXZRCfyT81xsMTN9e+n496Xljek2ublkPLEXteA9HL0jKtYJEWmA/iNkkF3Q
	cIbr5bVq+cLRHwxVPJ3E7HC+ZjYKEliRwcbQwS5HHV/XSHZ0WQ4jYEZXq8nYCw==
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
Date: Wed, 04 Nov 2026 18:06:39 +0100
Message-Id: <DMMLA872GQ8B.1DSK2BUICYTHE@bootlin.com>
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
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>, "Dmitry Baryshkov"
 <dmitry.baryshkov@oss.qualcomm.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH 13/35] drm/panel: remove the _typed() panel bridge
 functions
X-Mailer: aerc 0.22.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-13-5e3070a3478f@oss.qualcomm.com>
 <179338130524.3009485.17598085708064235352.b4-review@b4>
In-Reply-To: <179338130524.3009485.17598085708064235352.b4-review@b4>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Oct 30, 2026 at 6:28 PM CET, Luca Ceresoli wrote:
> On Mon, 26 Oct 2026 13:10:02 +0200, Dmitry Baryshkov <dmitry.baryshkov@os=
s.qualcomm.com> wrote:
>> The connector type argument of drm_panel_bridge_add_typed() and
>> devm_drm_panel_bridge_add_typed() has been ignored since commit
>> b7797081ccfe ("drm/panel: embed a drm_bridge into every drm_panel"),
>> and they have no users left.
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
