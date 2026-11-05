Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793892183;
	b=GBdNC6rmNtkSNVdrjVtIxmy4AqtmDUKcqPM+udIJfYRSko4ZhLcvEYdl005qn9r+QbFQ
	 /4jcOH6KUhuVYusMUJDQVhIA/NBL0fMoJuNtD+FsS3Ohx94mX8DFq8miFJxM7Q0sv98N6
	 AlIcr4aJC5KS8M1J+p7oscaXK7/sTtBsTefA5vDagpzpgbFcxvTl5PsPAYBgqLGmgYzQY
	 irDXMG+HwGSgkb7zGTYBKqnFkBpSBBupKsqEkl4i5w/aGkD8PSZKA22y21rOLQdGGW8ce
	 7NO+Qp0glC8a9dR+h1KT/yJMyoztwq9WDRPHIx11SoSe26YghfGYaCzUk4kJOhBYNZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793892183;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=7v4V8/4X0TjPkcYr+xi2naJa0ss/5ymYdMLn3Qm3uOs=;
	b=JZdUGveRPlT/7JqXKbpyCl0G++t1pxPZRggYlEhESCSSJrFcqin85sTpSrHszPUzkGKh
	 S3ZR2NHRDKK1ljGi5tgZH8J3CJqyqmZ3jEDjBifOgj1mW3HTGM5DQwmGBv5UlEnQ+vY11
	 dSfpmfy2iKts2Ef7GN4AFTTlEQNnbX1HWHluqQCYynP1fP/+eOxYCK+zofrVXrL2A574T
	 6J6gRb9V/rVd3Q3RcAnBsPXUN56Ue5VB0SD5QOlrM8PPsDpePLhAntbeNn/LDnjK8PEDT
	 eJr2J+uvl4Dgy+Wa65Zxlmzi3qAAkku63AbMHrZAtm2HLlG/vOGfgaw4JwV0loZz6RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEZbSxVP;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49430606A329;
	Thu,  5 Nov 2026 15:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XEZbSxVP
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E0B21F000C1;
	Thu,  5 Nov 2026 15:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793892182;
	bh=7v4V8/4X0TjPkcYr+xi2naJa0ss/5ymYdMLn3Qm3uOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XEZbSxVPp7P+6DCvBeS1fYcBTKKFA8Ha7Jl4bhp/kBeJ54vGatjc+bX6k0kObz436
	 CtPqzd+USA6qX5S1JHghC/mr7XsPM49vwBPA16wkGqmmeKQyES5OJNLYzYo3wZTQhb
	 Tin5ClkzUFqrLlL8Fq9wLBDURSGpbKOpheR4ywJBmZjfHFE7slfW94G3B6wTCDyKpN
	 Yblpifrc40qgpV2v2Y0e3U+8UngGO6t2tzPs8pZml9XwqwrafVxnDSh95z7CTTAF5u
	 sa71q+OIVZ3i1ZoRXRHp0l35vB4tCkO30gN9LLgRP4rYSnybLSamdn6kjtVuGbSuUl
	 yhtA+C90f8gFw==
Date: Thu, 5 Nov 2026 16:22:59 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jyri Sarha <jyri.sarha@iki.fi>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Paul Cercueil <paul@crapouillou.net>, 
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Linus Walleij <linusw@kernel.org>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Peter Griffin <peter.griffin@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Alison Wang <alison.wang@nxp.com>, Paul Kocialkowski <paulk@sys-base.io>, 
	Yannick Fertre <yannick.fertre@foss.st.com>, Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
	Philippe Cornu <philippe.cornu@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Ondrej Jirman <megi@xff.cz>, 
	Javier Martinez Canillas <javierm@redhat.com>, Igor Reznichenko <igor@reznichenko.net>, 
	Michael Walle <mwalle@kernel.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	Jagan Teki <jagan@edgeble.ai>, Jianhua Lu <lujianhua000@gmail.com>, 
	Guido =?utf-8?Q?G=C3=BCnther?= <agx@sigxcpu.org>, Purism Kernel Team <kernel@puri.sm>, 
	Jerry Han <hanxu5@huaqin.corp-partner.google.com>, Joel Selvaraj <jo@jsfamily.in>, Icenowy Zheng <icenowy@aosc.io>, 
	Michael Trimarchi <michael@amarulasolutions.com>, Sumit Semwal <sumit.semwal@linaro.org>, 
	Casey Connolly <casey.connolly@linaro.org>, Michael Tretter <m.tretter@pengutronix.de>, 
	Cristian Cozzolino <cristian_ci@protonmail.com>, Junjie Cao <junjie.cao@linux.dev>, 
	Ryan Brue <ryanbrue.dev@gmail.com>, Nickolay Goppen <setotau@mainlining.org>, 
	Stefan Mavrodiev <stefan@olimex.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Robert Chiras <robert.chiras@nxp.com>, 
	Alexander Koskovich <akoskovich@pm.me>, Markuss Broks <markuss.broks@gmail.com>, 
	Artur Weber <aweber.kernel@gmail.com>, David Heidelberg <david@ixit.cz>, 
	Dzmitry Sankouski <dsankouski@gmail.com>, Yedaya Katsman <yedaya.ka@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH 27/35] drm/bridge-connector: let the bridges set up the
 connector
Message-ID: <auyfJAn3f-is-eXX@houat>
References: <20261026-drm-panel-funcs-v1-0-5e3070a3478f@oss.qualcomm.com>
 <20261026-drm-panel-funcs-v1-27-5e3070a3478f@oss.qualcomm.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="nvlajszkdnqh6lds"
Content-Disposition: inline
In-Reply-To: <20261026-drm-panel-funcs-v1-27-5e3070a3478f@oss.qualcomm.com>


--nvlajszkdnqh6lds
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 27/35] drm/bridge-connector: let the bridges set up the
 connector
MIME-Version: 1.0

On Mon, Oct 26, 2026 at 01:10:16PM +0200, Dmitry Baryshkov wrote:
> Call drm_bridge_chain_connector_init() once the connector is initialized,
> so that the bridges implementing the connector_init callback get to set
> up their part of it.
>=20
> Assisted-by: LLM
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu=
/drm/display/drm_bridge_connector.c
> index 81f3e26f6fdf..2d982c7109b5 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -1141,6 +1141,10 @@ struct drm_connector *drm_bridge_connector_init(st=
ruct drm_device *drm,
>  		connector->polled =3D DRM_CONNECTOR_POLL_CONNECT
>  				  | DRM_CONNECTOR_POLL_DISCONNECT;
> =20
> +	ret =3D drm_bridge_chain_connector_init(encoder, connector);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
>  	if (panel_bridge)
>  		drm_panel_bridge_set_orientation(connector, panel_bridge);

I don't really mind this change, but we should have a user for it and it
doesn't look like you have any in this series?

Maxime

--nvlajszkdnqh6lds
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCauyfTAAKCRAnX84Zoj2+
dlpBAX9vmlt6LO/z8/cZ2e9AdKjYtQICZ+l2BzUxUnN/1vgtuPBo4ZauhGowfRnu
dCnXGMoBf0dGFfOI0idM2rRpYmxj//Dz342c5BaFpa3YCCrW5V+qnd1vuLuKWMX4
8+jAJrTriw==
=Icn+
-----END PGP SIGNATURE-----

--nvlajszkdnqh6lds--
