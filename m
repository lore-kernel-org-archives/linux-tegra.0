Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939153F58E1;
	Fri, 26 Jun 2026 12:59:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782478793; cv=none; b=cAFf7Wj9I4Pg1VUu1WMN7HPLDjvHblLahTU5PMvIBGUzG9axDdDuwkfeY7T7aGkvEanJ77c2sA+0vt7eDWRa34QhO5W52tdrHAUm8L2Lih2innuccSuVVr3W9fOBBjVJ5s/CMCoU8RZkp7UbTlwk0MYyjNyBH2mgxSJeFfCeO8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782478793; c=relaxed/simple;
	bh=iuAhpilzZ82xLPk+JSQEUu87jLlBPaxS3Zm76C7j3bE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1T+K1zOb8NonQJMtzZfeMAw3KIz0aMGLSIcpf1XHO5dGrfElDSeNraelAnT/jWethVrlmK4n2faANy5J2yXIVPnM+wKz8l1UBPUdsuJP892Vh8ASAzdszSOXl2vQHRkXWQ4FTaEQhIDe6BVzAdd3Ia4OvY7lj2NM7tBDCmQJbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SUXMgmgW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SUXMgmgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8032F1F000E9;
	Fri, 26 Jun 2026 12:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782478791;
	bh=iuAhpilzZ82xLPk+JSQEUu87jLlBPaxS3Zm76C7j3bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SUXMgmgWimGLbzlNMZ7wcG+1j38gd4fRHDIlDqaegwcqfVuQgLYX8VuUJtvM15vYp
	 jX12ep+d309u8bLQbPbyAdBvJmd8GAsRPjPQZkY4YwXDX5gr9XzTy4IoAL7jcTI2rV
	 8MTxA1z++Ku+mxv+86TWL/aJ6xmEhLbsBHRnhMPe0NgKiyIhsLVeyivZGTUIIikGnb
	 y3xB6TtxeLHebb/RguAspWG9yWJwnaIq7UkWwS/TVbfgzD/kJBZNxTlsLf/tTqaRX3
	 91ZGmQgom/jibidOew2L8xqAHAtkawCvVu8yAOpBH0ClZXAOWEuwCJJPHM/LEHesNi
	 Azxjd24IvLvoA==
Date: Fri, 26 Jun 2026 14:59:48 +0200
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
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge
 creation
Message-ID: <20260626-ivory-tarantula-of-valor-af0e2a@houat>
References: <20260626-drm_refcount_wiring-v1-0-cca1a7b3bdef@redhat.com>
 <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="hx5apeednlr6fj2q"
Content-Disposition: inline
In-Reply-To: <20260626-drm_refcount_wiring-v1-5-cca1a7b3bdef@redhat.com>


--hx5apeednlr6fj2q
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 5/5] drm: release panel reference after panel bridge
 creation
MIME-Version: 1.0

On Fri, Jun 26, 2026 at 02:03:27PM +0200, Albert Esteve wrote:
> of_drm_find_panel() and drm_of_find_panel_or_bridge() now return a
> counted reference. In drivers that immediately wrap the panel in a
> bridge via devm_drm_panel_bridge_add() or equivalent, the bridge
> acquires its own reference, so the caller's lookup reference must be
> released right afterwards.
>=20
> Also handle the cases where a panel is found but cannot be used,
> dropping the reference immediately in those paths.
>=20
> Assisted-by: Claude:claude-opus-4-6
> Signed-off-by: Albert Esteve <aesteve@redhat.com>

drm_of_find_panel_or_bridge() does indeed return a refcounted pointer
now, but afaik the doc wasn't updated to reflect that.

More importantly, I feel like with both of_drm_find_panel and
drm_of_find_panel_or_bridge we update a path that is considered legacy
anyway now, and we should rather focus on providing a safe alternative.

But none of the functions you updated are unsafe, so it won't be more
unsafe, or provide any illusion of safety to the caller. Idk.

Either way, this should all be on its way out if Luca creates a bridge
for every panel, and we'll consolidate on bridges only, so maybe it's
not such a big deal to merge this patch.

Maxime

--hx5apeednlr6fj2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaj53xAAKCRAnX84Zoj2+
dsH4AX98DVuJ2nWYEJlnvBoa7TLPQIxJp+N3SqD7GpI68AgQPx9+XXIRd6eD3iVF
E+I0SeQBgPnPf10X5ME+9qUOY4BE8jXvhoS7IaHARK1hueut9qHTwNXhFYoQyHlo
Wk/+lJPV9A==
=+ukr
-----END PGP SIGNATURE-----

--hx5apeednlr6fj2q--
