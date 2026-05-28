Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D29C2D8DB0;
	Thu, 28 May 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779977204; cv=none; b=hsTSXbFiWPNoP66Y3jAjJ3HnNTtIWoR2bCXIrCYYihPlM1h0uCboKOmHAV1WYbQWn+n8mWDQMCK4pNeMhTIfFgAd5xFF6edlzNWyIh4qZXqVh/FCpzaOzz1ZaKsPBceMy18Ue8bFPGT8VDfl9Xlxk1sl9mDO3KH2NmDhgqMUttQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779977204; c=relaxed/simple;
	bh=OhptfS273NPbx5KYF6CsNy5n2FKBPT0N0VJ0FLUvNs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KX8myaNGrW100CPH/rapjgwURgVsbcDetocsBsovP47fgvjVbvTUpH5QgEZu6JwiN+d6mKGcLkcsno1OMVWynB+2rlv5ROvyx0HkaQeIk6GOWlhRgRDcwxQx3yly0zOWsgQiYsxORTBaWEaYYkV49qVeLB6fll6gYqs3Kepchu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jn8ao2vy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jn8ao2vy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4951B1F00A3A;
	Thu, 28 May 2026 14:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779977202;
	bh=kiyC2moGcmtgdeNSaFo56pMgH3zNTMgObzQG6WFoEcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jn8ao2vyPizwcJF1veAq5VPirITuFbJb/f7gn6kc3nZmkA/vCa/Y1moRMs5c44JXU
	 wwl238RW967IcqM7oxGfwCrrBogHogFwNb35s1LHa4wAFzGN91yOeln5E0beC9TDie
	 Q3yqT5oEEph165diwVTH+S0jqJbAhevXFRJ46gzDsniuLAIXlwhL4Pea7K30pafAhs
	 nedNVcZbboJ1ub8Xwp+DbTPxTMhZsF5UmKHc5w8HkLolaE8PYGH6h4TLmJLS4gGsmf
	 ZRZpTUvhiXvjXQ7l6eO3/HkxTs30nLDDqBGyCWdY7DWtKE1sfjCxZu9oq40SJKSY53
	 TJKBd8lhcWvYg==
Date: Thu, 28 May 2026 16:06:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: rgb: Fix use-after-free and leak in
 tegra_dc_rgb_probe()
Message-ID: <ahhLDKD2nI_skQ7B@orome>
References: <20260407084629.283151-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yljhe77scuhzfyua"
Content-Disposition: inline
In-Reply-To: <20260407084629.283151-1-vulab@iscas.ac.cn>


--yljhe77scuhzfyua
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: rgb: Fix use-after-free and leak in
 tegra_dc_rgb_probe()
MIME-Version: 1.0

On Tue, Apr 07, 2026 at 08:46:29AM +0000, Wentao Liang wrote:
> Move the of_device_is_available() check before devm_add_action_or_reset()
> to avoid using np after it may have been freed (if the action registration
> fails). Also release np immediately when the device is not available to
> prevent a reference leak.
>=20
> Fixes: 3c3642335065 ("drm/tegra: rgb: Fix the unbound reference count")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/gpu/drm/tegra/rgb.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/tegra/rgb.c b/drivers/gpu/drm/tegra/rgb.c
> index ff5a749710db..d7586fc820ce 100644
> --- a/drivers/gpu/drm/tegra/rgb.c
> +++ b/drivers/gpu/drm/tegra/rgb.c
> @@ -215,13 +215,15 @@ int tegra_dc_rgb_probe(struct tegra_dc *dc)
>  	if (!np)
>  		return -ENODEV;
> =20
> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
>  	err =3D devm_add_action_or_reset(dc->dev, tegra_dc_of_node_put, np);
>  	if (err < 0)
>  		return err;
> =20
> -	if (!of_device_is_available(np))
> -		return -ENODEV;
> -

I don't see how this achieves anything. If the action registration
fails, devm_add_action_or_reset() executes the action (that's the
"or_reset" part), so that takes care of the leak. Similarly, when things
fail, np is not going to be used anymore since we immediately return, so
there's no use-after-free either.

Thierry

--yljhe77scuhzfyua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYS/AACgkQ3SOs138+
s6G16Q/7BrRolqQi2OPTpeyyk6ZZ2yv3zPoPbb+nsLxWsiwD/KifNFlr6LC9Yymu
rbVxDI2hkYfTclmvWuvJ9BQs0Nvusv1CXWcRY1j0zYIpZWJR2nYzSvAMwdxapH/b
F2AtXFQhuooInpwK8szOwS1EUQWxbuKr9bfCNoNuaCDGEunIf08TnZryao53v73x
qqlUyXnvVIQ+wwDYpD1mXNbPKRDvoh8GZjAlzBPUmsNN+6pYbPLDNM0KV0qR4+KS
M1tfCJC4AMALRUnVVVuYOazvRVROxaOFx+0sHYZxN8WNMcGEveb47FckLLkqivl6
qiQP1lhaQDAdan0ZUtoAy1OYjQbSBxRIr2kFQCmxRattoR0kxg9Co37n1O9izlNE
JwVl202cHPrJfPIylQaw6T2s06ljaz2bzR0ZMprwpjCnstwGwPc3mIkx4mv7+Zeu
SFM3n9jGLGgWZuHtSW34DRhVwI/3IJEeyokF6wjm1DeU4T/q1GSWawy2p2PRt6rh
iwOj5bGufEW503CqWUA02H26bNx4rxg0b/FpFPcUu2Gp3AN8UBmxcG7fQcl1hNB/
2h6E0/BROVrxBfkpd7Vu0LLZjjCK2hfuwoMhL8sWqzJBVzjIABqt9TBGLs3vqMc7
iAqDwdLdZw23vNzTxWpByCjT4voB/1M8bS+4f1ba3k4WX5mQX4I=
=gLnO
-----END PGP SIGNATURE-----

--yljhe77scuhzfyua--
