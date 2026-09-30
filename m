Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE0472D59E8;
	Wed, 30 Sep 2026 08:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790757308; cv=none; b=IChb34eBL6wB1KuXJpojuWOuYERNPlLvNo7pY1uP6xJAnMR5YT5Eq6NuKJgSLXDgmkplhb8RkXr1bAOY8uuimsI62cWAEIkLn21a7YzVHrWbkkOOkpc9JXZw63lG52AuLG4Gh2oZmdHZuxt/e8ws0vYB5VJIJ6yPQrVUVTtMUsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790757308; c=relaxed/simple;
	bh=jDpjBQ4Fv0vizTH/R2w52lNHv7zi8LnZQZCiWr9dGSQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WKfsqfRmEu4taUWVRVJbI7UlEkdKsTTEoG0NmJZ4i4MtYWGAmgeZHNvt7v83/AFSDPamyZuYKz+7vzkp1rmeQfBwk3dxWEor/MktNN3eX3olF/sGCKj0848QajStnvy9xsVerRTx6FkfDak0/jRIqLYD0HFHkX3KeSruoNGxgVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOWdOO1O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOWdOO1O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7A281F000FF;
	Wed, 30 Sep 2026 08:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790757300;
	bh=HmmuXY1dhET9hXohl3geSgtGl1ur+YkaIpC1O3vWiSg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YOWdOO1OmdzlKOayaKWfTLJfhShKZq7oZOxhbrhqWeUWZq9OVGrVvh5CZ3GZhq2Kn
	 lG0Gy4RuB+WAFtkJAjGIXicvap3bVB/chNozf41O3Z9eyYW5tl1Ozzyd3kYk/ZvrSh
	 hnvmbFMENtGBtTJVZJfd5YZy6v1JPiU90Yj1HzgEVSkA/g1za2/uCqakigHBYvhzq/
	 L7Xp4X480mUn/NZPFdEpnQuMudgUrFbJf+8XMIu+PoSO6y7+sY6KQqnCv7eBh7ojlM
	 Yu3IeHhFduCBjhDmaRFLaT+pBCHyD2WUlB8acfZNYwhVtzhFAUhMbWc3ESQdfzOmR3
	 d9In/lRM2sbyg==
Date: Wed, 30 Sep 2026 10:34:58 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
Message-ID: <arzI6PXbGAgXs9Uh@orome>
References: <20260930070535.47130-1-clamor95@gmail.com>
 <20260930070535.47130-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6xcfjcqu5qqwldk2"
Content-Disposition: inline
In-Reply-To: <20260930070535.47130-2-clamor95@gmail.com>


--6xcfjcqu5qqwldk2
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/6] drm/tegra: dc: Expand available registers layouts
MIME-Version: 1.0

On Wed, Sep 30, 2026 at 10:05:30AM +0300, Svyatoslav Ryhel wrote:
> Expand existing DC register definitions with additional fields in
> preparation for adding the 8-bit CPU interface.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/dc.c |  3 ++-
>  drivers/gpu/drm/tegra/dc.h | 54 ++++++++++++++++++++++++++++++++++----
>  2 files changed, 51 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/dc.c b/drivers/gpu/drm/tegra/dc.c
> index b0bfa946e6979..5c67928bcabfa 100644
> --- a/drivers/gpu/drm/tegra/dc.c
> +++ b/drivers/gpu/drm/tegra/dc.c
> @@ -2384,7 +2384,8 @@ static void tegra_crtc_atomic_enable(struct drm_crt=
c *crtc,
> =20
>  	if (dc->rgb) {
>  		/* XXX: parameterize? */
> -		value =3D SC0_H_QUALIFIER_NONE | SC1_H_QUALIFIER_NONE;
> +		value =3D SC0_H_QUALIFIER(SC_H_QUALIFIER_NONE) |
> +			SC1_H_QUALIFIER(SC_H_QUALIFIER_NONE);
>  		tegra_dc_writel(dc, value, DC_DISP_SHIFT_CLOCK_OPTIONS);
>  	}
> =20
> diff --git a/drivers/gpu/drm/tegra/dc.h b/drivers/gpu/drm/tegra/dc.h
> index 0cb0515968b35..5679e1ca0c2a5 100644
> --- a/drivers/gpu/drm/tegra/dc.h
> +++ b/drivers/gpu/drm/tegra/dc.h
> @@ -274,8 +274,11 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define DC_COM_CRC_CHECKSUM			0x301
>  #define DC_COM_PIN_OUTPUT_ENABLE(x) (0x302 + (x))
>  #define DC_COM_PIN_OUTPUT_POLARITY(x) (0x306 + (x))
> +#define LSC0_OUTPUT_POLARITY_LOW BIT(24)
>  #define LVS_OUTPUT_POLARITY_LOW (1 << 28)
>  #define LHS_OUTPUT_POLARITY_LOW (1 << 30)
> +#define LSPI_OUTPUT_POLARITY_LOW BIT(8)
> +#define LDC_OUTPUT_SELECT_V_PULSE1 BIT(14)
>  #define DC_COM_PIN_OUTPUT_DATA(x) (0x30a + (x))
>  #define DC_COM_PIN_INPUT_ENABLE(x) (0x30e + (x))
>  #define DC_COM_PIN_INPUT_DATA(x) (0x312 + (x))
> @@ -303,9 +306,15 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define  UNDERFLOW_REPORT_ENABLE (1 << 0)
> =20
>  #define DC_DISP_DISP_SIGNAL_OPTIONS0		0x400
> -#define H_PULSE0_ENABLE (1 <<  8)
> -#define H_PULSE1_ENABLE (1 << 10)
> -#define H_PULSE2_ENABLE (1 << 12)
> +#define H_PULSE0_ENABLE				BIT(8)
> +#define H_PULSE1_ENABLE				BIT(10)
> +#define H_PULSE2_ENABLE				BIT(12)
> +#define V_PULSE0_ENABLE				BIT(16)
> +#define V_PULSE1_ENABLE				BIT(18)
> +#define V_PULSE2_ENABLE				BIT(19)
> +#define V_PULSE3_ENABLE				BIT(20)
> +#define M0_ENABLE				BIT(24)
> +#define M1_ENABLE				BIT(26)
> =20
>  #define DC_DISP_DISP_SIGNAL_OPTIONS1		0x401
> =20
> @@ -451,11 +460,30 @@ int tegra_dc_rgb_exit(struct tegra_dc *dc);
>  #define BASE_COLOR_SIZE_888    (  8 << 0)
>  #define BASE_COLOR_SIZE_101010 ( 10 << 0)
>  #define BASE_COLOR_SIZE_121212 ( 12 << 0)
> +#define DISP_COLOR_SWAP_BGR	BIT(16)
>  #define CMU_ENABLE_ENABLE      (1 << 20)
> =20
>  #define DC_DISP_SHIFT_CLOCK_OPTIONS		0x431
> -#define  SC1_H_QUALIFIER_NONE	(1 << 16)
> -#define  SC0_H_QUALIFIER_NONE	(1 <<  0)
> +#define SC0_H_QUALIFIER(x)			(((x) & 0x7) <<  0)
> +#define SC1_H_QUALIFIER(x)			(((x) & 0x7) << 16)
> +enum {
> +	SC_H_QUALIFIER_DISABLE,
> +	SC_H_QUALIFIER_NONE,
> +	SC_H_QUALIFIER_HACTIVE,
> +	SC_H_QUALIFIER_EXT_HACTIVE,
> +	SC_H_QUALIFIER_HPULSE,
> +	SC_H_QUALIFIER_EXT_HPULSE,
> +};

Let's stick with regular defines for this, there's really no advantage
in using enums for this and the other enums introduced by this patch.

Thierry

--6xcfjcqu5qqwldk2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmq8ybEACgkQ3SOs138+
s6HtwxAAiaxDlHnN4aptkVD4LviQS+58GCUsQFpauwktU417bgBtaEY2IR5bhnfB
v1aTOT50EqEBPvh7/gQp60S9oc9tFNhwlVmLU/KYRlmcoPkusRlQVbI9Y+akKeti
NGLkDd+dx/2+rBtMTC+dkfRcD+pakl1LHkmgyGkI6+JgFp/MpnaV0f5QwrgmuP0x
rFC2I15ojWSnkDRGi4BG/n1LrdIXSnU2+y6LOuEkRpyIiFXDiHHfkLavBS4UkdTX
C41Xra+HkTVy0auwYYkoWMPPpQXls82+OyXmBiK/eeLmv5ECrJUjIEJaR+6R4frG
6DA7OgJGsUne483UmmNe62lTxvK2BlPX7aRSS+3yyhEUW2HUdgghnFx0VLJlwhAG
nO1iOpc4/8KwrJsiCpAyc1bsW+G8whJ1XJBQhdylkGRjulciBSBoRU+EO8g1flKa
u4kpC19nVL6RY66YlVVxhrOrjSUc2MKkUOz5A7rJxAbJenvlEQKgnsY8nRvm2iQ+
LqXc/3/nlivdMrY323Q3GmABGf+9LI7ZK4nSkzLWhjkh2kMAL3yeXskRoShIZ3BB
xyHhjrG8hSfNBYz2E7rl+N9iXfCndvqtCJ/CBGSqJdwOAyYSfLht/zblkgn75GdJ
lH8hBcIBf/4FrCdbbjiuOsj4yHW8jhaZZrit5BXeQgRbib1M2B0=
=fYMI
-----END PGP SIGNATURE-----

--6xcfjcqu5qqwldk2--
