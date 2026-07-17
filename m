Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D29A8331230;
	Fri, 17 Jul 2026 08:56:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278577; cv=none; b=FYMlqCfyD1GTBr6xCuo8TgjsK9nFdKhsFukI176ZHshJDpsUaUoFIIdAxNuOrQRCbsyp4LdL4Ptu41DPSH0WGlmdZl/EEUI3HbIC7LJ24xT3VM3P9ou5rbYWLqiTb+uYcXJPmr45bsV95I9kpshpkiHWEYNZcNdwxfL1RFsL/IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278577; c=relaxed/simple;
	bh=ji3c6tV6Fmp8AGbsQNiKpqBvm3f3bp6x+PZi89E38Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOErf6rp+707je/JtXSUdN9HqiivX1Hah1A35WoRhMr0+RQD8UVQpRioRyi27J4htgdhLW8skVumWurPGF7kuVTB1tG5jiwBGZukxtNGl7+WwykyHbSXtbWPkPEsCjX2GOP9EOMSd+D8+0WhqFqhpYBitnbbOJRTSdbwfZrYfZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=azQXBRay; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="azQXBRay"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C26DA1F000E9;
	Fri, 17 Jul 2026 08:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278576;
	bh=ji3c6tV6Fmp8AGbsQNiKpqBvm3f3bp6x+PZi89E38Fw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=azQXBRayBGKG9pZTOOKyiIEsoNwnMAmRP2b6noY4+hF+zV4UYPa6VBdyla5JYzZOk
	 a8/dBQSHkr2xljG88tIdsWYefyzsjUCjRBn17l0DFjkl1P/mOoRt4AhHpWg1wn8GSM
	 rSCQkI7VymlKqdtau9Wsf6D//kpZYNrbzxA/F82/wGBOYzxcOvKT8r0OVngOfl676E
	 Ib/pcUa3NemJl9NSHznrEK3JGBPgeOEJ2x8j8Rm80G/vGH61lJmU3F+VZXFbmF/vkK
	 QsELya1yQgedwMoE39mMnmOBswZgzZgUdEVZ19IdgXP/Y/jUH/Wv6SZeMwvW6guXbV
	 1K/5VnQN9oDGQ==
Date: Fri, 17 Jul 2026 10:56:13 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Albert Esteve <aesteve@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Linus Walleij <linusw@kernel.org>, Marek Vasut <marex@denx.de>, 
	Stefan Agner <stefan@agner.ch>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Sandy Huang <hjc@rock-chips.com>, 
	Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Jingoo Han <jingoohan1@gmail.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Alain Volmat <alain.volmat@foss.st.com>, Raphael Gallais-Pou <rgallaispou@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-samsung-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge
 creation
Message-ID: <20260717-heavenly-peach-guan-82f0f1@houat>
References: <20260713-drm_refcount_wiring-v2-0-d3bb61f4bd4d@redhat.com>
 <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ro3acbddzcmn32hn"
Content-Disposition: inline
In-Reply-To: <20260713-drm_refcount_wiring-v2-5-d3bb61f4bd4d@redhat.com>


--ro3acbddzcmn32hn
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Subject: Re: [PATCH v2 5/5] drm: release panel reference after panel bridge
 creation
MIME-Version: 1.0

On Mon, Jul 13, 2026 at 01:53:08PM +0200, Albert Esteve wrote:
> Update a second batch of drivers calling of_drm_find_panel() or
> drm_of_find_panel_or_bridge() to release the lookup reference after
> wrapping the panel in a bridge.

I would have expected this to be squashed of patch 3, any reason it's in
a separate patch?

> Also handle the cases where a panel is found but cannot be used,
> dropping the reference immediately in those paths.

--ro3acbddzcmn32hn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCalnuLQAKCRAnX84Zoj2+
dnDUAX9DfbJ62T1vU+k0YXnFv3yX2k5iyF6uwKqBc3NkgP2wwaiGh0wcxI9im29e
ExLXo6wBegLo1kQnSSETZqi/cXakkCkkrHe5mEI5hPp0fWmM5IDcQSmHJGJhLvnd
3v05b7my6w==
=EsoI
-----END PGP SIGNATURE-----

--ro3acbddzcmn32hn--
