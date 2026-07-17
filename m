Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F3F3DBD55;
	Fri, 17 Jul 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784278474; cv=none; b=uOZaBv+sUAeS+yG/zYa9DUVnVe66KnafAaDk0Gw0afsNW+tOaHgj47hiSmfKYFp/3sVHWDfkAOFKOGj9KI4+CnbeNu3gdypVghMGZkbog8TE5xPUcCBJrl8zMxztB65KMtsg/2fc2gt2ukmZH9ASsm+NoETxTSPbvfphbey/G5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784278474; c=relaxed/simple;
	bh=BEYZN1gsE00bNy2RhBPWQX/sexeJySVyt/uEk+jzRRc=;
	h=Message-ID:Date:From:To:Subject:In-Reply-To:References:Cc; b=Oi/DdfD3eHfYuXoePoMK1okpOBkq4f6hh4pWkJXL+Q1aN+RJNqjfZcPjUIPurO0b6zW77CXk0H9zeosdT1x6lMrDopMzoccoQzWor4CSJBHObzqWpEox34gBHP/CGKn0oZ05dxOK8dVKQOibxIuBkZjOm881ZSjeKbF5+wJr4KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ncGz03oZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ncGz03oZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A82D1F000E9;
	Fri, 17 Jul 2026 08:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784278471;
	bh=6csmYI19hiSya7Sts1kiN+uRFS2fgNQzCnN1S8iT0wc=;
	h=Date:From:To:Subject:In-Reply-To:References:Cc;
	b=ncGz03oZP8oe3VMVZx1V+iz8cg02xKQcCfQRSMDNRr7tDEIjBcm4LLS/PdSF2Do61
	 Leq1alJYiygsmQW4bhK8UzZ6s+cHkRvo3TAVJfm4ztCatSZCi+bmy8CXRAX9kID5/k
	 tG4m/i0I0TYhjd7aGySO9EI5SXCHQ6O659dIPuZRQhlig+7Mg0DHBK7JYXCNIPfOoN
	 GVFzV8vGgX1EwBBBemuF4B/gWLMgowlo+0qgqCI/waF8OCTQB37ImoEkRLIgj/RmWS
	 If0cjrB3nQPdrnnegzQUj91Veirsu5COrpJf8MDmE00sXU7LIbXVeduCKFao9VrF9K
	 /KBQJhQJqX2TA==
Message-ID: <6a107326b65320208c7eaa14a3192433@kernel.org>
Date: Fri, 17 Jul 2026 08:54:29 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Albert Esteve" <aesteve@redhat.com>
Subject: Re: [PATCH v2 4/5] drm/panel: find_panel_by_fwnode() return a
 counted reference
In-Reply-To: <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com>
References: <20260713-drm_refcount_wiring-v2-4-d3bb61f4bd4d@redhat.com>
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

On Mon, 13 Jul 2026 13:53:07 +0200, Albert Esteve wrote:
> find_panel_by_fwnode() is the fwnode-based counterpart to
> of_drm_find_panel(), used internally by drm_panel_add_follower().
> Like of_drm_find_panel(), it returned an unrefcounted pointer,
> leaving a window where the panel could be freed between the lookup
> and first use.
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
