Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C6C33E7BD0;
	Fri, 26 Jun 2026 12:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478097; cv=none; b=L7KKSZqq680cWRVX369lSPVIjS107EgkS4DWrSqtFilHv7NvIVtdjkjtpt3qLE1M7pkNat/sXQGfYjQXk29cON754+ScofjIJc+ZJP54hPwJlRuvf0zUkNPiAOdoQouGejEh1tcYjNmTaajyd/J9Iv6y4ZgWk/BfueVYK6tDRk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478097; c=relaxed/simple;
	bh=bGwu9Z6aMghf29dyK10iLr2V0bNIiUqqeMLm7oscLkg=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=A/jwRP1DFnNtp8TrIKzBQVlgazPOoknZKryyYuC1T1dmflphlA6XKObNIMcprvAH1btHvPik2l04PUyzTk5Li6qOk46ow4mVPNHspnBZB/HQfh1A70fdaNzOoLwjZMSnycNbvGbF6YBGMTsaIH5eqfQ3PrnRqPO9gkuGtEo3cCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c1nHVby4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1nHVby4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7ABE1F000E9;
	Fri, 26 Jun 2026 12:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478092;
	bh=v4y2stLxJY7uDBiTbKNkCgVELhkFZRy7m3W4tRJdf+E=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=c1nHVby4VzRMzYi1WtQ/1/FW3ad4AR7RuNig6IMp0LM3ATUWQciaqWn60HmhO2Mvx
	 cNEqkAHm18Hvnr+k13yWAhq+yWo1uNw3hHWs3Q8x1TMAn1T5q4A954G06yoTZ/xqv7
	 lRQaMyVCNzPQM45PccrZMMHmAIAiMKXOnHAYfj6tLYr6w+/gjiQcRXuiPq4vQPbvJZ
	 cLkFy6mqvFRYiquJKKOAOxqBTRMC3VrfNBzcr08WK3a7LEXgOXrYKDLUf/GU7q1FJs
	 LJqnxBYj30rKVQA7A4J67kU/ZHMfl/2PT7/+94GYQY7CBjUcCvqoe/B9jXAyzpvIl0
	 O2OBomnk1cP5w==
Message-ID: <c5dc7d7db15a943d1b902469d79f4eb2@kernel.org>
Date: Fri, 26 Jun 2026 12:48:10 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH 2/5] drm/bridge/panel: hold a reference to the wrapped
 panel
In-Reply-To: <20260626-drm_refcount_wiring-v1-2-cca1a7b3bdef@redhat.com>
References: <20260626-drm_refcount_wiring-v1-2-cca1a7b3bdef@redhat.com>
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

On Fri, 26 Jun 2026 14:03:24 +0200, Albert Esteve wrote:
> drm_panel_bridge_add_typed() stores a pointer to the drm_panel it
> wraps, but never acquires a reference to it. If the panel device
> goes away while a panel_bridge still exists, the dangling pointer can
> be dereferenced through panel_bridge->panel.
> 
> 
> [ ... ]

Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
