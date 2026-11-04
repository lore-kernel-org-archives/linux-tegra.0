Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793812062;
	b=ql4uhzrPOnpMYqPuwDHl0dcxhu1U9Pq6EXMVGbkwKFbKLAlU6aY0lcHegBL1QblEnBdY
	 GsX5craf7wWX38RcxAHmF874esuCCtINXKOGtgLf0SMO/IoF6/X2Abx9sc1BryjBMlnjO
	 5dx1zUmn7nmllSamjLxUp3SOytYvtM/3uoGzJrqFTD9WBbuKzKzP1ReA71MBcbPv7Cke9
	 OheBJqrRdUmBuQEOI0dtAEuP4AagES9iViFTaOl9h9KPdIZaHXzQ/h9cskg99O5eREw0s
	 ame9tNk6yxDIiQm5NSaok/km3ZXKPqpObCIcYNTG1iECwImPH6V+RHjioszIPgo0gTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793812062;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Mime-Version:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:X-Mailer:References:In-Reply-To:X-Last-TLS-Session-Version;
	bh=Gj2WQ8NnsNfuifm6yJXA5XyiBIk7IIIT4t++b10Mocw=;
	b=EtBL0PMyfETnAo092sDwRzjCxw6nn90xuK9hS0uKvOYjV5zb4zEgZkP+Tu3YR9sUtEjH
	 Wa2iGzdS61lw2bSCpVIFRXi62mSO9+rWPEF69VM50/h+ex24baE3Wk3WXv6W4/y1qp/yL
	 xin1JtHs7QEuNLS3LKo6q8bJIgoB5RHMfIqf7y89FoKZPi0w1goc3+jHMdzff2yg3vDOP
	 zfT+rrD+nGZMHWow6fK1DaRr+i8UoY67pQpvoWMNHYPxoF4j1wgFl7EP4oXQXfNPuv3jp
	 Z8DxYbTvGQjlCt3kR26FMorXpCbMDuIVz4uWrOJWqIRq7hHcMtK1dNByMzBym3Z9arA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JGQFhDwj;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4892606A329
	for <linux-tegra@vger.kernel.org>; Wed,  4 Nov 2026 17:07:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4892606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JGQFhDwj
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 3B2B4C8F475;
	Wed,  4 Nov 2026 17:08:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0211660770;
	Wed,  4 Nov 2026 17:07:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4795710329205;
	Wed,  4 Nov 2026 18:06:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793812049; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Gj2WQ8NnsNfuifm6yJXA5XyiBIk7IIIT4t++b10Mocw=;
	b=JGQFhDwjX+meJ/Dn2svPu460X/fvDR01Kpw5BjfX1u4YZ6q/TSyCWUPldBFWEw2j6Ni9Wo
	h7t/EdaV6hZ0xJGZFWiX6zhkRGzz4Bf5thJJwe5K5j5GpELm1isD864rPIV0SsRMYirrY7
	wfGAtbiVg9rlKnJECQoRSAb+dmnDlJCjswWd4zp1eeH7JIzcqnFMt3eHRmGDuYUWBb8M3z
	nGWl0ZxlTisiHe1hPwo8CPN09w2/F4EpbNABdIQMs67NZt3I7WUFWwbF9QVlF6evZScO3v
	KQE6YRw2u7wAMpH0cGiUEbP0/jhZnjRTbxFLqwKmU5fmGfTKutWBhE5EQfYLfw==
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
Date: Wed, 04 Nov 2026 18:06:58 +0100
Message-Id: <DMMLAH2PBZHV.EUBGX45HPWQ6@bootlin.com>
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
Subject: Re: [PATCH 01/35] drm/panel: remove the get_timings() callback
X-Mailer: aerc 0.22.0
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-1-5e3070a3478f@oss.qualcomm.com>
 <179338130509.3009485.3123201175903177487.b4-review@b4>
In-Reply-To: <179338130509.3009485.3123201175903177487.b4-review@b4>
X-Last-TLS-Session-Version: TLSv1.3

On Fri Oct 30, 2026 at 6:28 PM CET, Luca Ceresoli wrote:
>> Nothing has ever called get_timings() since it was introduced in commit
>> 2938931f3732 ("drm/panel: Add display timing support"). Remove it
>> together with its three implementations.
>
> Ah, interesting!
>
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Tested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
