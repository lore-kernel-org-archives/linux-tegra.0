Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559C23E5EF7;
	Thu, 28 May 2026 12:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779970460; cv=none; b=geedCvmC1nbLDI9jPQV/T5W8OSRDJGR54y4EQoH2Hjdydxa40eGvtSKDg1Yp8vxKZ9PjqmtCtIMxCETr2hAmMYv8eo2F7v2dsE+4Gt2li3iUhcY3NmV5wF7yVil0BWQuuXEwbOncs4LjPgmUm5eb9FFjRLguj2IMTgO0SEzvOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779970460; c=relaxed/simple;
	bh=FxqoqjokQ6MS69AZEdmgYLNixb8YfCukzUAKNYktBGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MflNiN0Jshuta95trKsoz1YdIRwg2EVyhYQVo7ikXb2tXGy5lkc+6En1nmdkwZTTTBW10wtg4Xzl2XZTGWGlMq7eaOegC+8YPS/pqXPlH9eMuqz1FWNAHs93/jiElc44nFq8efBH4hPaeMI9MXdPk0mEi11g0ulppV0DZwJGBjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4QB/OFZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4QB/OFZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6BE1F000E9;
	Thu, 28 May 2026 12:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779970458;
	bh=c7ZvzYJvgPpDD8oEjyGHN9tGHtNkMrlBIzW5xKTked4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=X4QB/OFZBOvvMsfHviivYSfvYJ2GeRcn7pdeyvUa0jBOAduy0QR7sT9ATxjDPcB3K
	 dDnGm7tMxY/iyvVf7kZW7+FZwu8kyG2V8o/g4ZZNYzNDBSTEOeU7rdS8wGxd97XsqL
	 GOAg0ZkZIJOfXJ9Q9JGWTV7c1ED4vGyfZ8ESSL9ouuQxV/ggZM547lU37bnnK4x9rY
	 e9c1u7/RIaHGEZeExfWrmESIwQJf2G9IzbWrcUxrXY2BLQmoSe+aBBPxlLLj/zIkJ3
	 zh8o2ZlUB+qQgwRs3yrf3ZWH6Xrlv5LbSGMudiSPTPmmLvCTzU3l7rnRNf58yzIcl1
	 uY4kGdDYqH3tA==
Date: Thu, 28 May 2026 14:14:16 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Ion Agorria <ion@agorria.com>, dri-devel@lists.freedesktop.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to
 gr*d_probe
Message-ID: <ahgxiAHUKG5AnRt_@orome>
References: <20260517091450.46728-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="swtyrvjgl5kqot2g"
Content-Disposition: inline
In-Reply-To: <20260517091450.46728-1-clamor95@gmail.com>


--swtyrvjgl5kqot2g
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 0/2] drm/tegra: gr2d/gr3d: Move pm_runtime_enable to
 gr*d_probe
MIME-Version: 1.0

On Sun, May 17, 2026 at 12:14:48PM +0300, Svyatoslav Ryhel wrote:
> The gr*d_remove() has pm_runtime_disable, this indicates it should be
> paired with pm_runtime_enable in the probe instead of being inside
> gr*d_runtime_resume().
>=20
> ---
> Changes in v3:
> - pm_runtime_enable moved before host1x_client_register
>=20
> Changes in v2:
> - remove pm from gr2d_exit along with pm from gr2d_runtime_resume
> - move register map initialize before host1x_client_register
> ---
>=20
> Ion Agorria (1):
>   drm/tegra: gr2d/gr3d: Contain PM in the gr*d_probe/gr*d_remove
>=20
> Svyatoslav Ryhel (1):
>   drm/tegra: gr2d/gr3d: Initialize address register map before HOST1X
>     client is registered
>=20
>  drivers/gpu/drm/tegra/gr2d.c | 19 +++++++++----------
>  drivers/gpu/drm/tegra/gr3d.c | 19 +++++++++----------
>  2 files changed, 18 insertions(+), 20 deletions(-)

Both patches applied, thanks.

Thierry

--swtyrvjgl5kqot2g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYMZgACgkQ3SOs138+
s6HnAw//YelmGq5h/oGcUm0GWHgAxG+Z/1cw2AzaPiyhmDL0fDm7mShSFhP/Go9R
ZJaBXU+2xYSNGqbcy4b0mI0875JkM63mN85H1fwhE0bzt/Yi8sqGEd3zT8cEg8jK
vhOir6ofY9SPs8FkYdj1Nh1drXICQ0Vzie/6wxp+ehFuON4zboVAy3qn9WUv8aIa
rNI+H4Q+fKYTOC4JkCAmWURrmwrwxb5k83CCe1K9kUcjjKnHtjNz3adIjn2n5Vhf
OZ025b4t7yBFjQZZv5oHu5eGEPeHQ5INFP/bPohRFLj9rIxFPDfOJxZF7tPF2kWe
36aoN20SGHFSyFo3llyRB5dIBboh0coyZwI+LVLiB8er8TnQ4VxpSqfx6OPkLWZ0
ck3nLRvHoiEBim4zCAYYvr2BZWpJ/qP3UPnVPukG1Fpe+VbSRM00I7vVkZrwEI3H
RgKRkIjRHfTM9siGSs0Euz/1gzMn6H55vs3Sy30VLHSMgzy9/wRfbs+n/PxwUp6v
z+QwOZJDzhWIO5mmCAx9uvcgSSf3TO7o9ZEjfYhFxusiViHIOyIDx8NnSOHPrZkF
Rt1+jWksTFGsII/WkUPdyxVwMZyPVWFbsW07VFYtSTVHNlV3E57HBVtmHqVAgu2i
bn5SaqrCwU6l+of77hH6r/hMHz20/uVirH/NwTqL6waUlAJZ8VU=
=Dwrl
-----END PGP SIGNATURE-----

--swtyrvjgl5kqot2g--
