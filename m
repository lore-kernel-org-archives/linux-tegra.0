Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D38E3E0749;
	Wed,  5 Aug 2026 07:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913600; cv=none; b=YtFsAzoNqJlcbyuEpRZ1W3r4novGBG+pzAw/W1poJwAvh2DYvvvpTo+s5Mb56XK3AWb8nPZNyAnSmjN9h+TcKhPnD9ynYlGF2XsqGSJwp5w3XPK9GPSN7CrVB7IUCHcKEWY9u07Mz/4l5/Fma6bmJQ9CH7bFta1wpTzMJEQmrF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913600; c=relaxed/simple;
	bh=HBCy1XcRwQB4ocjkcj/RsfoGFcZ9fMsGCJf+KO1FQVY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF3b2fJ1Aa9rpapjQpduhY4vPhAm/m5ItKHA0U/OE8N8VNS3fWPD5VFvOV/Sjn2CQV54joqfmZUyXTpHn4+hXUunDlFlTD7Oaxa+XpCkWbkpEC/6E8zQyuWh4D3QDfBKYbXFWmajm20BWlcw+Ob4Ton7Hs3G1orzkGqegRgEnSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1Ov3nPN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1Ov3nPN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FBD41F000E9;
	Wed,  5 Aug 2026 07:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785913598;
	bh=hiOuQZ+qbKPtsU6vpJkFL0vOoLX/w3NXaU22HaBxqH0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=g1Ov3nPN/H02R9GEFGczrKNWADKqiMios7nEgu5q0aTkR5yNoAq/YPFCc4FcpCi31
	 NB30DsAGv8mcU1kTHYpNZaIACfvqi6WC7OSHEXsIVNANC+65vIPPtkMuT0meoAIagS
	 TVnDXIygJGYHsUaMutVh3qVorPKIPe/SEvBaHXcmgz68O0l8LbMQ5nAKlNqbTL5mAr
	 jkrFdodytU3oBscZjUbYoeJg1nBVCWq1oYESR+zFJzjKkUzpuqI+7kTJFN7QgEPZNG
	 T4rUNsoC9EMgJgyYMVEDwOe4mMDF08ZFi6PuU8+9FMkgr4fjexF7goUeXOv0lEbTpU
	 czEkoo3pgrTug==
Date: Wed, 5 Aug 2026 09:06:35 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jacopo Mondi <jacopo@jmondi.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Jimmy Su <jimmy.su@intel.com>, 
	Matthias Fend <matthias.fend@emfend.at>, Mikhail Rudenko <mike.rudenko@gmail.com>, 
	Daniel Scally <dan.scally@ideasonboard.com>, Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Michael Riesch <michael.riesch@collabora.com>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Paul Elder <paul.elder@ideasonboard.com>, Martin Kepplinger <martin.kepplinger@puri.sm>, 
	Quentin Schulz <quentin.schulz@theobroma-systems.com>, Tommaso Merciai <tomm.merciai@gmail.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Richard Acayan <mailingradian@gmail.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Heiko Stuebner <heiko@sntech.de>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux@ew.tq-group.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, David Heidelberg <david@ixit.cz>
Subject: Re: [PATCH v4 3/7] arm64: dts: freescale: Convert to new media
 orientation definitions
Message-ID: <anLg9GdLKD4eMguI@orome>
References: <20260804-kbingham-orientation-v4-0-336998dd63b4@ideasonboard.com>
 <20260804-kbingham-orientation-v4-3-336998dd63b4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nmyfnhbtb3klucjj"
Content-Disposition: inline
In-Reply-To: <20260804-kbingham-orientation-v4-3-336998dd63b4@ideasonboard.com>


--nmyfnhbtb3klucjj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 3/7] arm64: dts: freescale: Convert to new media
 orientation definitions
MIME-Version: 1.0

On Tue, Aug 04, 2026 at 08:43:30PM +0100, Kieran Bingham wrote:
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
>=20
> Update the users throughout the freescale/NXP device trees to use the new
> definitions.
>=20
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> Reviewed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> ---
>  .../boot/dts/freescale/imx8mp-tqma8mpql-mba8mp-ras314-imx219.dtso      |=
 3 ++-
>  arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi                      |=
 3 ++-
>  2 files changed, 4 insertions(+), 2 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--nmyfnhbtb3klucjj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmpy4PsACgkQ3SOs138+
s6HAfA//YOk7q5LpyLNfCLWpw4PJyqRmkuOdrCDSDENusiMG1+cYxA1f/qFGUB08
eQ4+3p3EN8/l6JslxUy98QIy00jJeyyHxrHTQdhTn3wwoxbdfvw1fCKJ5LWKXfXZ
QwuzppC3RuWUpddqA1YgkuF92GFSObqvfhIAGGXjRAdoBkrEuibwoEKRBH/NRNw9
Cc05gKN6CB4FgHxJdZhYX9q+iW5HdWIqOJdUgyfbYw8DojIpYdhYeHUR/Sl54Vky
p9KBloxGTvhBA1oVe0a6bryeBjhE0La5w3SKigRhV85T0A/Mq9W1CJTxtEswNJEa
YcQx+Cj+IVwXnk3HvS5fgVtHTwv2nM8Pgnp21szd9SspfYreM7hBbKJ+AKivd4P5
mKbuay45A9f1iku6VgvQGPUdOjA1m6KiN6NH5MPB73r8R52FveLin+5keZgQH/Dq
K+nVXsNnoAfJznYBHWC2jisv0hTr/ERkSfFbyjeUTfDb6RteETuYqZI13Ub6neSM
ml2sJa2+aZ4n/8j7mvjcx81yVNr5MawTnCHK+dDMvHhPQpaMU5cm8YT2j8KAvAnd
I3PHZhqHoMNhGjifsQDIXARw/gzA27BeL9GcEF3vpUAJA6hec70EJELEbBbZFoC/
rF3yo2GCWGIJWMaIw1tvCwQTm/acz9Qdy2c3QpbDOajzilxwQ4Q=
=QISY
-----END PGP SIGNATURE-----

--nmyfnhbtb3klucjj--
