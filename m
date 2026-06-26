Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1885C3F54C9;
	Fri, 26 Jun 2026 12:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478061; cv=none; b=twlpgxBL6cHMxi5RcQBIcNu4VPKEkFHj+YV616IEsbvBAS4pmZiV9TJPrRCf1/MA4BEfVo8A6mjTpgMECpyjmlCsMRHFz8dCytgWExsq1qRlkw3RWncoTNBzsP3Vcrem7qUKVmMSbKGbSsfsXXLiTr8Q8aZgBrEYRfhA0EvdN/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478061; c=relaxed/simple;
	bh=d+LWMOcyZyTXzD9/HUFkvzlnP4bg7RRXDRK8N9avc7c=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=TXz3QyHJ7I3CsM8xtH25uqH6wQxSnmKkTs8ex6rzJR/hFr4Urpa94pZ+caPcwnMnmUcZARJiQhvzo626HCz1ARkxjAY72vGh+CJgH2/mlgnA7Fon/ga17xmHrLxF6tr+6bbBDC8QCfE/jF7TeHu4lG57ap2VmMhsa0o2eESiqIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfxGAN/j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfxGAN/j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71D421F000E9;
	Fri, 26 Jun 2026 12:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478051;
	bh=gcyGrresjTTPmNzfpyIyHzXr15imrzLhXIY91GPffew=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=cfxGAN/jcCri326WXf34xWET6jX2QyOm4MN8pOKcqeKKkNBjEv6dqSXeKvaCEjiqQ
	 xMUnaQaNuIQ/CQpLmGf1YlXqiGM0E0hqnbxoXWt1LrQHDTq2J3OIjNE3S2u9Xn/5ix
	 oK+DP1AL9NHLm/+ebKyBGxhWgla2EUstpziga4oibOgZCkFVMReghKfhD46XkJseIF
	 4XVC8j4IST/6OWvdETIEQ6EjrbCmQnuVJeZuoqmH1cmfRtKD2cnh8CooWMpcUWm9DM
	 tqoCryTCxfyH5x8StBEipzh+MB2ezInl6ba2yu/4cYIqDp4Gf/3f7LbllTeUaSycd1
	 37NkVCXO7+daQ==
Message-ID: <f183d0ba167f71e0555814f7447f46e0@kernel.org>
Date: Fri, 26 Jun 2026 12:47:28 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH 1/5] drm/panel: have drm_panel_add/remove manage a list
 reference
In-Reply-To: <20260626-drm_refcount_wiring-v1-1-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-1-cca1a7b3bdef@redhat.com>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, "Alain
 Volmat" <alain.volmat@foss.st.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>, "Alim
 Akhtar" <alim.akhtar@samsung.com>, "Alison Wang" <alison.wang@nxp.com>, "Andrzej
 Hajda" <andrzej.hajda@intel.com>, "Andy Yan" <andy.yan@rock-chips.com>, "Biju
 Das" <biju.das.jz@bp.renesas.com>, "Chen-Yu Tsai" <wens@kernel.org>, "David
 Airlie" <airlied@gmail.com>, "Fabio Estevam" <festevam@gmail.com>, "Frank
 Li" <Frank.Li@nxp.com>, "Geert Uytterhoeven" <geert+renesas@glider.be>,
 =?utf-8?b?SGVpa28gU3TDvGJuZXI=?= <heiko@sntech.de>, "Inki Dae" <inki.dae@samsung.com>, "Jagan
 Teki" <jagan@amarulasolutions.com>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Jessica
 Zhang" <jesszhan0024@gmail.com>, "Jingoo Han" <jingoohan1@gmail.com>, "Jonas
 Karlman" <jonas@kwiboo.se>, "Jonathan Hunter" <jonathanh@nvidia.com>, "Jyri
 Sarha" <jyri.sarha@iki.fi>, "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>, "Krzysztof
 Kozlowski" <krzk@kernel.org>, "Kyungmin Park" <kyungmin.park@samsung.com>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Laurent Pinchart" <laurent.pinchart+renesas@ideasonboard.com>, "Laurentiu
 Palcu" <laurentiu.palcu@oss.nxp.com>, "Linus Walleij" <linusw@kernel.org>, "Luca
 Ceresoli" <luca.ceresoli@bootlin.com>, "Lucas Stach" <l.stach@pengutronix.de>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, "Magnus Damm" <magnus.damm@gmail.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Marek Vasut" <marex@denx.de>, "Maxime
 Coquelin" <mcoquelin.stm32@gmail.com>, "Maxime Ripard" <mripard@kernel.org>, "Mikko
 Perttunen" <mperttunen@nvidia.com>, "Neil Armstrong" <neil.armstrong@linaro.org>, "Paul
 Cercueil" <paul@crapouillou.net>, "Paul Kocialkowski" <paulk@sys-base.io>, "Pengutronix
 Kernel Team" <kernel@pengutronix.de>, "Peter Griffin" <peter.griffin@linaro.org>, "Philippe
 Cornu" <philippe.cornu@foss.st.com>, "Raphael Gallais-Pou" <raphael.gallais-pou@foss.st.com>, "Raphael
 Gallais-Pou" <rgallaispou@gmail.com>, "Robert Foss" <rfoss@kernel.org>, "Samuel
 Holland" <samuel@sholland.org>, "Sandy Huang" <hjc@rock-chips.com>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Seung-Woo Kim" <sw0312.kim@samsung.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Stefan Agner" <stefan@agner.ch>, "Thierry
 Reding" <thierry.reding@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Tomi
 Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Yannick Fertre" <yannick.fertre@foss.st.com>
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>

On Fri, 26 Jun 2026 14:03:23 +0200, Albert Esteve wrote:
> The global panel_list holds raw pointers to drm_panel objects.
> Nothing prevents a panel from being freed while it is still linked
> in the list: if a driver's probe calls drm_panel_add() and then
> fails at a later step, panel->list remains in panel_list. Any
> subsequent call to of_drm_find_panel() that iterates the list will
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
